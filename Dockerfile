FROM centos:7
RUN yum -y install cronie
RUN yum -y install perl

COPY ./test_cron /etc/cron.d/
RUN mkdir -p /users/sailas
COPY ./test.pl /users/sailas/

RUN chmod 0644 /etc/cron.d/test_cron
RUN chmod 0644 /users/sailas/test.pl

RUN touch /var/log/cron.log
RUN chmod 0644 /var/log/cron.log

CMD crond start && tail -f /var/log/cron.log