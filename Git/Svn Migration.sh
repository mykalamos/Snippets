# create svn authors
cd  /C/Code/MRS/SVN/trunk
"C:/Program Files/TortoiseSVN/bin/svn.exe" log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > C:/temp/svn-authors.txt

# Manual step
# Should be of form: user@domain.com = FirstName Surname <user@domain.com>


# Create partial repo - no svn commit metadata
git svn clone <svnUrl> --trunk=trunk/MyPath/MyPath2 --authors-file=C:/temp/svn-authors-git.txt --no-metadata <NewRepoName>

OpenSSh dialog
(t)emporarily
git remote add origin <RemoteUrl>/<NewRepoName>.git

# Full migration

git svn clone <svnUrl> --stdlayout --authors-file=C:/temp/svn-authors-git.txt --no-metadata <NewRepoName> > /c/temp/GitSvnClone4.log

# Tag creation (untested)

for tag in `git branch -r | grep "tags/" | sed 's/ tags\///'`; do
  git tag -a -m "Converting SVN tags" $tag refs/remotes/$tag
done
