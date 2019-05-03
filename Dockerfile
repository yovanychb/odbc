FROM debian:stretch

RUN echo  "deb http://debian.ues.edu.sv/debian stretch main" > /etc/apt/sources.list
RUN apt-get update && apt install -y asterisk asterisk-core-sounds-es-gsm php-cli php-pgsql asterisk-prompt-es unixodbc unixodbc-dev odbc-postgresql && apt-get clean

COPY --chown=asterisk:asterisk ["rtp.conf","extensions.conf","sip.conf","func_odbc.conf","res_odbc.conf","/etc/asterisk/"]
COPY --chown=asterisk:asterisk ["odbcinst.ini","odbc.ini","/etc/"]

EXPOSE 5060/udp 10000-10010

RUN /etc/init.d/asterisk reload
RUN /etc/init.d/asterisk start

ENTRYPOINT asterisk -cvvvvvvvvvvv && sip set debug on
