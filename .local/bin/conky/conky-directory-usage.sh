#!/usr/bin/env bash

main() {
  local dir len file size total lines

  dir="${1%/}"
  len="${#dir}"
  lines="${2:-5}"
  total="$(du -s --block-size=1 "${dir}" | cut -f1)"

  echo "${dir}"
  find "${dir}" -mindepth 1 -maxdepth 1 -exec du -s --block-size=1 {} \; | sort -rn | head -n "${lines}" | while read -r size file; do
  echo "${file:$((len+1))}\${alignr}$(numfmt --to=iec-i --suffix=B ${size}) \${execbar echo $(printf "%.2f" "$((${size}/${total}*100"))")}"
  done
  echo
}

## \usage conky-directory-usage DIRECTORY [LINES]
main "$@"
