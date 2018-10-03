# Github
- In repository create Readme.md with following code snippet:

## Projects
```html
<a href="http://<teamCityUrl>/project.html?projectId=<projectIdString>&tab=projectOverview">
<img src="http://<teamCityUrl>/app/rest/builds/aggregated/strob:(buildType:(project:(id:<projectIdString>)))/statusIcon.svg"/>
</a>
```
## Configurations
```html
<a href="http://<teamCityUrl>/viewType.html?buildTypeId=Omniview">
  <img src="http://<teamCityUrl>/app/rest/builds/buildType(id:Omniview)/statusIcon"/>
</a>
```
# TeamCity 

1. General Settings -> Enable Status Widget.
2. Enabling Pull requests and feature branch builds

VCS root -> Branch Specification:
+:refs/heads/(master)
+:refs/heads/feature/(*)
+:refs/pull/(*/merge)


