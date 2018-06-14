clear
cd $TMP
rm -rf GitMerging/
mkdir GitMerging && cd $_/
git init
mkdir src
mkdir src/HelloWorld
mkdir src/HelloMoon

printf "hello world" > src/HelloWorld/hello-world.txt
printf "hello moon" > src/HelloMoon/hello-moon.txt 

cd $TMP/GitMerging
git add .
git commit -m "Initial commit"
