1. In repository create Readme.md with following code snippet:
# Projects
<a href="http://<teamCityUrl>/project.html?projectId=<projectIdString>&tab=projectOverview">
<img src="http://<teamCityUrl>/app/rest/builds/aggregated/strob:(buildType:(project:(id:<projectIdString>)))/statusIcon.svg"/>
</a>
# Configurations
<a href="http://<teamCityUrl>/viewType.html?buildTypeId=Omniview">
  <img src="http://<teamCityUrl>/app/rest/builds/buildType(id:Omniview)/statusIcon"/>
</a>

2. In TeamCity -> Enable Status Widget.

3. Enabling Pull requests and feature branch builds
VCS root -> Branch Specification:
+:refs/heads/(master)
+:refs/heads/feature/(*)
+:refs/pull/(*/merge)


