git stash
jekyll build
mv _site /tmp
git checkout gh-pages
rm -rf *
mv /tmp/_site/* .
git add -A
git commit -am 'rebuilt site'
git push
git checkout master
git stash pop
