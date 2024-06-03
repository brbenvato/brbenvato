echo ''
echo '----------'
git branch feature/test-%1s
git checkout feature/test-%1s
echo "." >> README.txt
git add README.txt
git commit -a -m README.txt
git push origin feature/test-%1s
git checkout main
