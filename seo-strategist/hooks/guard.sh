#!/bin/bash
# guard.sh — company policy, enforced at the tool level.
#
# Runs before every Bash command. Blocks the two categories of action that cannot be
# undone: destroying the user's files, and sending things to other humans without
# their approval.
#
# Exit 0 = allow. Exit 2 = block, and the message on stderr is shown to the employee
# so it can explain itself and ask the user instead.
#
# Deliberately dependency-free — pattern matches the raw hook payload so it works on a
# stock Mac with nothing installed.

payload=$(cat)

block() {
  echo "BLOCKED by site policy: $1" >&2
  echo "Tell the user what you were trying to do and ask them to run it themselves if they want it." >&2
  exit 2
}

# --- Where a command can start and stop ------------------------------------------
#
# The command arrives embedded in JSON, so a double quote is a boundary. A multi-line
# command arrives with its newlines encoded as a literal backslash-n, and some hosts
# pretty-print the payload, so line starts count too. Miss either and
#     cd ~/Employees\nrm -rf Work
# sails straight through with the guard installed and reporting green.
#
# SEP is the loose boundary — any separator, quote, slash, whitespace, line start, or
# encoded newline. It catches `ls | xargs rm`, `bash -c 'rm x'`, and `/bin/rm`.
# Use it for names that are never ordinary English words.
#
# CMD is the strict one — true command position only. Use it for names that are also
# words the employee will legitimately type into its work: mail, trash, stripe, paypal.
# Blocking "your old razor belongs in the trash" would make the guard useless.

SEP="(^|\\\\n|[;&|\`(\"'/[:space:]])"
END="([[:space:]\"';&|)]|\\\\n|\$)"
CMD="(^|\\\\n|\"command\"[[:space:]]*:[[:space:]]*\"|[;&|\`(])[[:space:]]*(sudo[[:space:]]+)?"

# --- Destructive file operations -------------------------------------------------

# rm / rmdir / unlink / shred in any form, including pipes, subshells, and quoted -c
if grep -Eq "${SEP}(sudo[[:space:]]+)?(rm|rmdir|unlink|shred|srm)${END}" <<<"$payload"; then
  block "deleting files. This employee does not delete your work — it archives it in place."
fi

# find ... -delete and find ... -exec rm
if grep -Eq 'find[[:space:]].*-(delete|exec[[:space:]]+rm)' <<<"$payload"; then
  block "bulk deletion via find. Too easy to take out the wrong files."
fi

# git operations that throw away uncommitted work
if grep -Eq 'git[[:space:]]+(clean|restore|checkout[[:space:]]+--|reset[[:space:]]+--hard)' <<<"$payload"; then
  block "a git operation that discards uncommitted changes."
fi

# Truncating redirect onto a saved file. Appends with >> are fine — that is how logs grow.
if grep -Eq '[^>]>[|]?[[:space:]]*[^[:space:]|;&]*\.(md|csv|txt|json|tsv|yaml|yml|xlsx)' <<<"$payload"; then
  block "overwriting a file with a shell redirect. Edit the specific lines instead, or append with >>."
fi

# Other ways to empty or rewrite a file that do not look like a redirect
if grep -Eq "${CMD}truncate${END}" <<<"$payload"; then
  block "truncating a file. Edit the specific lines instead."
fi
if grep -Eq "${CMD}tee${END}" <<<"$payload" && ! grep -Eq 'tee[[:space:]]+(-a|--append)' <<<"$payload"; then
  block "writing over a file with tee. Use tee -a to append, or edit the file directly."
fi
if grep -Eq 'sed[[:space:]]+[^|;&]*(-i|--in-place)' <<<"$payload"; then
  block "an in-place sed edit. Edit the file directly so the change is visible and reversible."
fi

# Moving files to the trash
if grep -Eq '\.Trash' <<<"$payload" || grep -Eiq "${CMD}(trash|trash-put|rmtrash)${END}" <<<"$payload"; then
  block "moving files to the trash."
fi

# --- Sending things to other humans ----------------------------------------------

# Apple Mail / Messages via AppleScript
if grep -Eiq 'osascript.*(Messages|Mail|send)' <<<"$payload"; then
  block "sending a message or email. This employee drafts — you send."
fi

# Command-line mailers. Bare `mail` is command-position only, so copy about email
# — "the last email list you'll ever need" — still gets written.
if grep -Eq "${SEP}(sendmail|mailx|mutt|/usr/bin/mail)${END}" <<<"$payload" \
  || grep -Eq "${CMD}mail${END}" <<<"$payload"; then
  block "sending email from the command line. This employee drafts — you send."
fi

# --- Anything that could change a live site --------------------------------------

if grep -Eiq '(api\.webflow\.com|api\.wordpress\.com|api\.shopify\.com|api\.contentful\.com|api\.sanity\.io|api\.netlify\.com|api\.vercel\.com)' <<<"$payload"; then
  block "calling a CMS or hosting API. Your strategist recommends changes — you make them live."
fi
if grep -Eiq "${SEP}(sudo[[:space:]]+)?(wp|netlify|vercel|shopify|hugo|gh-pages|rsync)${END}" <<<"$payload"; then
  block "running a deploy or CMS CLI. Nothing this employee writes goes live by itself."
fi
exit 0
