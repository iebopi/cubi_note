# uart rx & tx

1. rm /var/lock/* -r

2. uart_test_app_for_linux /dev/ttySAC2 -b 115200 -l -rw "123456" -asc