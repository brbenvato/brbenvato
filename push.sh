#!/usr/bin/env bash

function retry() {

  git config pull.rebase false
  git config --global user.name "Some dev"
  git config --global user.email "username@users.noreply.github.com"
  
  git checkout .
  git reset --hard origin/main
  git pull --no-edit
  echo `date` " <- $GITHUB_REF" >> deployment/file.txt
  git diff
  git add deployment
  git commit -a -m "Automated commit."
  git status
  git push
}

for i in `seq 1 40` ; do
  echo ''
  echo '------------------------------'
  echo "[" `date` "] Attempt: $i"
  echo '------------------------------'

  retry
 
  retry_exit=$?
  
  if [ "$retry_exit" -eq 0 ]; then
    echo "Success"
    exit 0
  fi
  
  sleep 1
done

exit 1
