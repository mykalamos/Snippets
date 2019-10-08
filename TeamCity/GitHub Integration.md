### Default branch
```
refs/heads/master
```
### VCS root Branch specification:
```
+:refs/heads/(master)
+:refs/heads/feature/(*)
+:refs/pull/(*/merge)
```
### VCS root Branch specification (including prefix and github merge builds):
```
+:refs/heads/(master)
+:refs/heads/(feature/*)
+:refs/heads/(release/*)
+:refs/heads/(hotfix/*)
+:refs/heads/(bugfix/*)
+:refs/pull/(*/merge)
```
