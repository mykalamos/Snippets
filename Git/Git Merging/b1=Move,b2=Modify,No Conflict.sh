cd $TMP/GitMerging

git checkout -b feature/b1

mv src/HelloWorld/hello-world.txt src/HelloWorld/hello-worlda.txt
git add .
git commit -m "Rename file"

git checkout master

git checkout -b feature/b2
printf "\nhello world again" >> src/HelloWorld/hello-world.txt

git add .
git commit -m "Add text to Context1.txt"

git checkout master
git merge feature/b1
git branch -d feature/b1

git checkout feature/b2
git merge master

git checkout master
git merge feature/b2
git branch -d feature/b2
