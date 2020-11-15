FROM	debian:buster

COPY 	usbdm_4.12.1.262-1-x86_64.deb /home/usbdm/

RUN	mkdir -p /etc/udev/rules.d/

RUN	apt-get update

RUN	apt-get install apt-utils -y

RUN	apt-get install /home/usbdm/usbdm_4.12.1.262-1-x86_64.deb -y

RUN	cp /etc/udev/rules.d/* /lib/udev/rules.d/

RUN	apt-get install vim usbutils make gcc libusb-dev -y
