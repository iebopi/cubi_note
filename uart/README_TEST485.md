# ���ڡ�485����˵��

# By CEIV

1. ������ͨ�Բ���

1.1 ɾ�������� rm /var/lock/* -r

1.2 ���������Գ���

    �磺arm-linux-gnueabi-gcc uart_app.c -o uart_app

1.3 �޸�ϵͳ�����ļ���A20��Ӧsys_config.fex��imx6��Ӧ�豸���ļ���

    ����Ӳ��ԭ��ͼ�ҵ���ʹ�õ�uart�˿ںţ���ttyS2����tx/rx���źţ�����Ӧ�޸���Ӧ�������ļ�������ϵͳ�̼���

1.4 �Է����ղ���

    ���Ӵ���rx��tx��ִ�в��Գ���  ./uart_app /dev/ttyS4 -b 19200 -l -rw "123456" -asc

    ������������ʱ����ӡwrite��Ϣ������շ�������������̨��ӡread��Ϣ��write��Ϣһ�¡�

    ���ֻ��ӡwrite��Ϣ������ӡread��Ϣ���򴮿�rx��tx�������⣬�ɽ�tx�������Զ�rx���԰忨tx��ͨ�ԣ���rx�������Զ˲��԰忨rx��ͨ�ԡ�


2. 485����

   ����Ӳ��ԭ��ͼ����485��дʹ�����ţ������ݡ�����������GPIO��Ӧ�ĵ�������gpio��Ӧ���豸�ڵ㣬������������ӦIOΪ�ߵ͵�ƽ��ͨ��485ģ��

   ���ӵ�PC�˽���485�շ����ԡ�

   ���������ͨ�Բ���������GPIO������������485��ͨ���Ų����485ģ���·��