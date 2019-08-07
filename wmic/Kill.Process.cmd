wmic path win32_process Where "Caption Like '%%<ProcessName>%%' AND CommandLine like '%%<CommandLine>%%'"  Call Terminate
