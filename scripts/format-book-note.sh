# !/bin/bash

# Copyright Jacob Young 2018

# Script
# Takes input from the clipboard (pbcopy on macOS)
# Formats and replaces iBooks notes export
# Replaces clipboard with formatted notes to be added to a different, markdown supporting, note application

# cat test | sed -E 's/\”/\"/g' | sed -E 's/\“/\"/g' | sed -E 's/Notes From\:.*//g' | sed -E 's/Check out this book on the iBooks Store\:.*//g' | grep -Pzo -e "(?s)((?:\w+\s\d{1,2}\,\s\d{4})\K(.*?)(?=(\w+\s\d{1,2}\,\s\d{4}|\Z)))" | tr -s '\n'

# 1. Get clipboard contentns

IBOOKS_NOTES="$(pbpaste)"

# 2. Define regular expressions to format text

# 2. a. Sed
REMOVE_FANCY_QUOTES_START="s/\“/\"/g"
REMOVE_FANCY_QUOTES_END="s/\”/\"/g"
REMOVE_NOTES_ENDING="s/Notes From\:.*//g"
REMOVE_IBOOKS_ENDING="s/Check out this book on the iBooks Store\:.*//g"
REMOVE_SINGLE_SPACE_LINES="s/^ +$//g"
REMOVE_STARTING_NEWLINES='1,/^$/d'



# 2. b. Grep
FIND_QUOTE_AND_NOTE="(?s)((?:\w+\s\d{1,2}\,\s\d{4}\s+?)\K(.*?)(?=(\w+\s\d{1,2}\,\s\d{4}\s+?|\Z)))"

# 3. Format text
function group () {
  str=$1
  str=${str//$'\n'$'\n'$'\n'$'\n'/$'\t'}            # 2 newlines to 1 tab

  while [[ "$str" =~ $'\t'$'\n' ]] ; do
    str=${str//$'\t'$'\n'/$'\t'}          # eat up further newlines
  done

  str=${str//$'\t'$'\t'$'\t'$'\t'/$'\t'}            # sqeeze tabs

  IFS=$'\t'                               # field separator is now tab
  grouped=( $str )                         # slit into array
}

function format_all () {
  local final=()
  for pair in ${grouped[@]}; do
    # Take all the text before the first blank line
    quote="$(echo "$pair" | sed '/^$/q')"
    # Take all the text after the first blank line
    note="$(echo "$pair" | sed '1,/^$/d')"

    # Format quote
    quote="*$quote*"
    # Format note
    note="$(echo "$note" | sed '/^ *$/d;s/\(^.*$\)/\*\*\1\*\*\\n/g')"

    res="$quote\n\n$note"
    echo "$res\n---\n"
  done
}


QUOTES_AND_NOTES="$(\
  echo "$IBOOKS_NOTES" \
  | sed -E "$REMOVE_FANCY_QUOTES_START" \
  | sed -E "$REMOVE_FANCY_QUOTES_END" \
  | sed -E "$REMOVE_NOTES_ENDING" \
  | sed -E "$REMOVE_IBOOKS_ENDING" \
  | grep -Pzo "$FIND_QUOTE_AND_NOTE" \
  | sed -E "$REMOVE_SINGLE_SPACE_LINES" \
  | sed "$REMOVE_STARTING_NEWLINES"
)"

grouped=""
group "$QUOTES_AND_NOTES"
format_all

