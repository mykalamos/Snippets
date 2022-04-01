## List aliases
```bash
git config --get-regexp alias
```
## Creating aliases
```bash
git config --global alias.st status
git config --global alias.ci commit
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
git config --global alias.lo 'log --oneline'
```
