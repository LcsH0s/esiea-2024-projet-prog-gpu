CPU_CC=g++
CPU_CFLAGS=-Wall
CPU_EXEC=$(BINDIR)cpu_integrator

GPU_CC=nvcc
GPU_CFLAGS=
GPU_EXEC=$(BINDIR)gpu_integrator

BINDIR=bin/


.PHONY: all build cpu gpu compare

all: build

build: cpu gpu

cpu: main.cpp
	$(CPU_CC) -o $(CPU_EXEC) $(CPU_CFLAGS) main.cpp

gpu:
	$(GPU_CC) -o $(GPU_EXEC) $(GPU_CFLAGS) main.cu


compare:
	@echo "Comparing execution times:"
	@echo "--------------------------------------"
	@echo "Running $(CPU_EXEC):"
	@start=$$(date +%s%3N); ./$(CPU_EXEC); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"
	@echo "Running $(GPU_EXEC):"
	@start=$$(date +%s%3N); ./$(GPU_EXEC); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"

