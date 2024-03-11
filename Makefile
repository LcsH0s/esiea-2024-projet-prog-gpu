CC=g++
CFLAGS=-Wall

all: build

build: main.cpp
	$(CC) -o integrator.exe $(CFLAGS) main.cpp

.PHONY: all build
