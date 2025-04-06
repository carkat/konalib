FILE=t.c # test
KONA=https://github.com/kevinlawler/kona

.DEFAULT_GOAL := build
default:build

install: 
	make kona
	make ray

build:
	make t.so
	./run



t.so:$(FILE)
	$(CC) $^  -I./inc -L./lib -o ./lib/$@ -shared -fPIC -lc -lraylib

kona:
	# clone and make kona
	# copy files where they should go
	if cd ./extern/kona; then git pull; else cd ./extern && git clone $(KONA) ;fi
	cp ./extern/edit-konamake ./extern/kona/Makefile # replace the make file with the edited file
	cp ./extern/edit-kapi.c ./extern/kona/src/kapi.c # replace with working return values
	cd ./extern/kona && make clean && make &&  make kapi-test
	cp ./extern/kona/src/kona.h ./inc
	cp ./extern/kona/src/kapi.c ./inc
	cp ./extern/kona/libkona.a  ./lib
	cp ./extern/kona/k          ./ 

ray:
	if cd ./extern/raylib; then git pull; else git clone https://github.com/raysan5/raylib ./extern/raylib;fi
	cd ./extern/raylib/src && make PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_BUILD_MODE=DEBUG
	cp ./extern/raylib/src/libraylib.so \
		 ./extern/raylib/src/libraylib.so.5.5.0 \
		 ./extern/raylib/src/libraylib.so.550 ./lib;
	cp ./extern/raylib/src/raylib.h ./inc

rayclean:
	cd ./extern/raylib/src && make clean

clean:
	rm -f k
	rm -f ./inc/*
	rm -f ./lib/*
	rm -f ./obj/*
	rm -rf ./extern/kona
	make rayclean
	#rm -rf ./extern/raylib
