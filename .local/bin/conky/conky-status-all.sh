#!/bin/bash

main() {
  local repo status line symbol
  for repo in $(all-repo); do
    (
      cd "${repo}" || exit 1

      status="$(git status -s)"

      if [ -n "${status}" ]; then
        echo "\${alignr}\${color white}${repo#$DEV_HOME/}\${color}"
        while read -r line; do
          symbol="${line:0:2}"
          symbol="${symbol// /}"
          echo "\${alignr}${line:2} \${color #5F9EA0}${symbol}\${color}"
        done <<<"${status}"
        echo
      fi
    )
  done
}

main "$@"
