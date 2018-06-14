cd $TMP/GitMerging
git checkout -b feature/b1
mv src/HelloMoon/hello-moon.txt src/HelloMoon/hello-moona.txt

git add . 
git commit -m "move hello-moon.txt"

git checkout master

git checkout -b feature/b2
mv src/HelloMoon/hello-moon.txt src/HelloMoon/hello-moonb.txt

git add . 
git commit -m "move hello-moon.txt again"

git checkout master
git merge feature/b1
git branch -d feature/b1

git checkout feature/b2
git merge master
