REM https://www.pstips.net/question/4525.html
REM powershell set-ExecutionPolicy RemoteSigned
REM powershell -executionpolicy RemoteSigned -File .\swUrl.ps1 "file:///"%cd%"/index.html"
powershell -executionpolicy RemoteSigned -File .\swUrl.ps1 "http://www.weibo.com/" "admin111" "admin" 3000