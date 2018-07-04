### Git config
```bash
git config --global http.sslVerify false
git config --global core.editor "'<NppInstallDir>/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
```
### Cloning repositories
```bash
cd /c/<your code directory>
git clone <HostUrl>/<RepoName>.git <RepoName>
cd <RepoName>
```
### Creating a feature branch
```bash
git checkout master
git checkout -b feature/JIRA-1234-DoSomething # this will create a branch in your local repo and check it out
```
### Promoting changes
```bash
git add . # adds all changes in your working copy to the index. This is known as staging
git commit -m "MRS-1234 some comment" # creates a commit in your local repository of all the changes in the index
git push -u feature/JIRA-1234-DoSomething # sets upstream branch. Subsequently just use git push
```
### Amending changes
```bash
git checkout /path/to/file(s) # resets unstaged files
git commit --amend # launches text editor for amending commit messages
```
### Merging from master
```bash
git fetch origin master:master # updates local repo
git merge master # do this before submitting pull request
```
### Deleting branch
```bash
git branch -d feature/feature/JIRA-1234-DoSomething # local branch
git fetch -p # If branch has already been deleted remotely this will clean up remote refs
git push origin --delete feature/JIRA-1234-DoSomething # remote branch
```
