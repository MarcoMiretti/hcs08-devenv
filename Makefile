IMAGE = marcotti/hcs08-devenv
GUI-PARAMETERS = -v $$HOME/.Xauthority:/root/.Xauthority:rw -e DISPLAY --net=host
BDM-PARAMETERS = --privileged -v /dev/serial/:/dev/serial -v /dev/ttyACM0:/dev/ttyACM0

build:
	docker build -t $(IMAGE) -f Dockerfile .

run-gui-support: build
	xhost +
	docker run -it --rm -v $$PWD:/home/project $(BDM-PARAMETERS) $(GUI-PARAMETERS) $(IMAGE)
	xhost -

run: build
	docker run -it --rm -v $$PWD:/home/project $(BDM-PARAMETERS) $(IMAGE)
