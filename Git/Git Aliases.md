## List aliases
```bash
git config --get-regexp alias
```
## Creating aliases
```bash
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.cia 'ci -a'
git config --global alias.co checkout
git config --global alias.cm 'checkout master'
git config --global alias.cd 'checkout develop'
git config --global alias.mm 'merge master'
git config --global alias.md 'merge develop'
git config --global alias.fm 'fetch origin master:master'
git config --global alias.fd 'fetch origin develop:develop'
git config --global alias.cob 'checkout -b'
git config --global alias.fmcm '!git fm && git cm'
git config --global alias.fdcd '!git fd && git cd'
git config --global alias.fp 'fetch -p'
--git config --global alias.rp 'remote prune'
git config --global alias.lo 'log --oneline'
git config --global alias.la 'config --get-regexp alias'
git config --global alias.lo1 'lo -n 1'
git config --global alias.lo5 'lo -n 5'
git config --global alias.lon '!f() { git lo -n $1; }; f'
git config --global alias.pushd 'push -u origin HEAD'
git config --global alias.pu push
git config --global alias.pod 'pull origin develop'
git config --global alias.pom 'pull origin main'
git config --global alias.acp '!git add . && git cia && git pushd'
```
