## Git Commands
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
