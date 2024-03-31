CPU_CC=g++
CPU_CFLAGS=-Wall
CPU_EXEC=$(BINDIR)cpu_integrator

GPU_CC=nvcc
GPU_CFLAGS=
GPU_EXEC=$(BINDIR)gpu_integrator

BINDIR=bin/

TEST_ARGS1=0 10 10000000
TEST_ARGS2=0 100 100000000

.PHONY: all build cpu gpu compare

all: build

build: cpu gpu

cpu:
	$(CPU_CC) -o $(CPU_EXEC) $(CPU_CFLAGS) src/main.cpp

gpu:
	$(GPU_CC) -o $(GPU_EXEC) $(GPU_CFLAGS) src/main.cu

compare: compare/ta1 compare/ta2

compare/ta1:
	@echo "Comparing execution times for test args 1:"
	@echo "--------------------------------------"
	@echo "Running $(CPU_EXEC):"
	@start=$$(date +%s%3N); ./$(CPU_EXEC) $(TEST_ARGS1); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"
	@echo "Running $(GPU_EXEC):"
	@start=$$(date +%s%3N); ./$(GPU_EXEC) $(TEST_ARGS1); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"

compare/ta2:
	@echo "Comparing execution times for test args 2:"
	@echo "--------------------------------------"
	@echo "Running $(CPU_EXEC):"
	@start=$$(date +%s%3N); ./$(CPU_EXEC) $(TEST_ARGS2); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"
	@echo "Running $(GPU_EXEC):"
	@start=$$(date +%s%3N); ./$(GPU_EXEC) $(TEST_ARGS2); end=$$(date +%s%3N); echo "Execution time: $$((end-start)) milliseconds"
	@echo "--------------------------------------"
