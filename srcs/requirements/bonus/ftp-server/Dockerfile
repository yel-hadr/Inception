FROM debian:bookworm

RUN apt-get clean && apt-get update -m -y &&  apt-get install -y vsftpd

COPY  conf/script.sh /etc/script.sh
RUN chmod +x /etc/script.sh

ENTRYPOINT [ "sh" , "/etc/script.sh"]

HEALTHCHECK --start-period=10s --timeout=10s --interval=10s --retries=3 CMD ["pidof", "vsftpd"]


CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]