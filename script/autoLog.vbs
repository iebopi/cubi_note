Dim a
Set a=WScript.CreateObject("WScript.shell")
a.run "http://localhost:8080/CMS_WEB/" '打开网站
WScript.Sleep 5000 '延时5秒，等待页面载入
a.SendKeys "admin" '这里填账号
a.SendKeys "{TAB}"
WScript.Sleep 100
a.SendKeys "admin"'这里填密码
a.SendKeys "{TAB}"
WScript.Sleep 100
a.SendKeys "{ENTER}"'这里点击登陆

WScript.Sleep 5000 '延时5秒，等待页面载入
a.SendKeys "admin" '这里填账号
a.SendKeys "{TAB}"
WScript.Sleep 100
a.SendKeys "admin"'这里填密码
a.SendKeys "{TAB}"
WScript.Sleep 100
a.SendKeys "{ENTER}"'这里点击登陆
WScript.Sleep 100'