git stash
jekyll build
git checkout gh-pages
rm -rf *
git checkout master _site
mv _site/* .
rm -rf _site
git add -A
git commit -am 'rebuilt site'
git push
git checkout master
git stash pop