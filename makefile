FILE=t.c # test
KONA=https://github.com/kevinlawler/kona

.DEFAULT_GOAL := build
default:build

install: 
	make kona

build:
	make t.so
	./run



t.so:$(FILE)
	$(CC) $^  -I./inc -L./lib -o ./lib/$@ -shared -fPIC -lc 

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

clean:
	rm -f k
	rm -f ./inc/*
	rm -f ./lib/*
	rm -f ./obj/*
	rm -rf ./extern/kona
