cd $TMP/GitMerging
git checkout -b feature/b1
printf "\nhello moon again" >> src/HelloMoon/hello-moon.txt 

git add . 
git commit -m "create a 2nd line in hello-moon.txt"

git checkout master

git checkout -b feature/b2
printf "\nhello moon yet again" >> src/HelloMoon/hello-moon.txt 

git add . 
git commit -m "create a 2nd line in hello-moon.txt yet again"

git checkout master
git merge feature/b2
git branch -d feature/b2

git checkout feature/b1
git merge master
