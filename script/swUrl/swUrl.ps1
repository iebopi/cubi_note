$args[0]
if(($args[0] -eq $null))
{
	exit
}
if(![bool]$args[0].StartsWith("http") -and ![bool]$args[0].StartsWith("file:"))
{
	exit
}

function Wait-IEReady([int]$TimeoutSeconds=10)
{
    $milliseconds=0
    $maxMilliseconds = $TimeoutSeconds * 1000
    while($Global:IEHost.Busy)
    {
        "11ss"
      if($milliseconds -gt $maxMilliseconds)
      {
        throw 'Wait ie ready timeout.'
      }
      sleep -Milliseconds 100
      $milliseconds+=100
        
    }
}

$Url = $args[0]
$user = $args[1]
$passwd = $args[2]
$timeout = $args[3]
$idHWND = ,0
(New-Object -comObject Shell.Application).Windows()| where {($_.FullName -ne $null) -and ($_.FullName.toLower().EndsWith("iexplore.exe")) }| foreach { $idHWND+=$_.HWND }
$idHWND
Start-Process -FilePath "C:\Program Files\Internet Explorer\iexplore.exe"  -ArgumentList "-k $Url"
$vbs = New-Object -ComObject WScript.Shell
Wait-IEReady
Start-Sleep -Milliseconds $timeout
$vbs.SendKeys("{TAB}")
$vbs.SendKeys("+") # SHIFT
$vbs.SendKeys("$user")
$vbs.SendKeys("{TAB}")
$vbs.SendKeys("$passwd")
$vbs.SendKeys("{ENTER}")

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