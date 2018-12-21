$args[0]
if(($args[0] -eq $null) -or ![bool]$args[0].StartsWith("http"))
{
	exit
}
$Url = $args[0]
$idHWND = ,0
(New-Object -comObject Shell.Application).Windows()| where {($_.FullName -ne $null) -and ($_.FullName.toLower().EndsWith("iexplore.exe")) }| foreach { $idHWND+=$_.HWND }
$idHWND
Start-Process -FilePath "C:\Program Files\Internet Explorer\iexplore.exe"  -ArgumentList "-k $Url"

$num = 0
$idHWND.length
while($num -lt $idHWND.length) 
{
	Start-Sleep -Milliseconds 100
	if($idHWND.get($num) -eq 0)
	{
		"continue"
		$num = $num + 1
		continue
	}
	"idHWND:" + $idHWND.get($num)
	(New-Object -comObject Shell.Application).Windows()| where {($_.HWND -eq $idHWND.get($num)) } | foreach { Start-Sleep -Milliseconds 100;$_.quit();"killed" }
	$num = $num + 1
}