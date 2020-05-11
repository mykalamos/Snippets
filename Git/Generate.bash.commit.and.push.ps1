cls
gci -Directory C:\users\riky\documents\code\News\packages | select -ExpandProperty fullName | 
%{ 
    $s = $_ -replace ':',''; 
    $s = $s -replace '\\','/';
    "cd /$s" ;
    "git add ."
    "git ci -m `"Package commit`""
    "git push"
}
