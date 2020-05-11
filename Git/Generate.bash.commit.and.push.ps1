cls
gci -Directory C:\users\riky\documents\code\News\packages | select -ExpandProperty fullName | 
%{ 
    [string] $s = $_;
    ((':',''), ('\\','/')) | %{$s = $s -replace $_[0],$_[1]}
    "cd /$s" ;
    "git add ."
    "git ci -m `"Package commit`""
    "git push"
}
