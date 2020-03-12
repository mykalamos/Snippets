$hash = @{}
$inputCollection | foreach { $hash[$_.MyKeyProperty] = $_.MyValueProperty }
