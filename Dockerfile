# Wine docker image base
FROM debian:buster-slim

RUN sed -i -e "s/deb.debian/ftp.hk.debian/g" /etc/apt/sources.list \
	&& echo "deb http://deb.debian.org/debian buster contrib" >> /etc/apt/sources.list \
	&& env DEBIAN_FRONTEND=nointeractive dpkg --add-architecture i386 \
	&& apt-get update && apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	wget \
	fonts-wine \
	ttf-mscorefonts-installer \
	winbind \
	winetricks \
	wine32 \
	fonts-droid-fallback \
        zenity \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash" "-c"]

