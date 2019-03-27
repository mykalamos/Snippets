$props = @{
	'Property1' = $someVal1
	'Property2' = $someVal2
}
return New-Object -Type PSObject -Prop $props
