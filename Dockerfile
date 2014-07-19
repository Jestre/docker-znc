# version 1.4-2 - 2014-07-19
# docker-version 1.1.1
#  Slightly modified from MAINTAINER  Jim Myhrberg "contact@jimeh.me"
FROM        ubuntu:14.04
MAINTAINER  Scott Schulz "<swschulz@gmail.com>"

# We use a bootstrap script to avoid having temporary cache files and build
# dependencies being committed and included into the docker image.
ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh && /tmp/bootstrap.sh

RUN         useradd znc
ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
