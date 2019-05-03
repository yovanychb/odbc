FROM debian:stretch

RUN echo  "deb http://debian.ues.edu.sv/debian stretch main" > /etc/apt/sources.list
RUN apt-get update && apt install -y asterisk asterisk-core-sounds-es-gsm php-cli php-pgsql asterisk-prompt-es unixodbc unixodbc-dev odbc-postgresql && apt-get clean

ADD --chown=asterisk:asterisk ["*.conf","/etc/asterisk/"]
ADD --chown=asterisk:asterisk ["*.ini","/etc/"]

EXPOSE 5060/udp 10000-10010

RUN /etc/init.d/asterisk reload
RUN /etc/init.d/asterisk start

ENTRYPOINT asterisk -cvvvvvvvvvvv && sip set debug on
