#include <iostream>
#include <cmath>

// Define the new polynomial function here
__device__ double polynomial(double x) {
    return x;
}

// CUDA kernel to compute the integral of a polynomial using the trapezoidal rule
__global__ void integratePolynomial(double a, double b, int num_intervals, double *result) {
    double h = (b - a) / num_intervals;
    double sum = 0.5 * (polynomial(a) + polynomial(b));

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = idx + 1; i < num_intervals; i += stride) {
        double x = a + i * h;
        sum += polynomial(x);
    }

    atomicAdd(reinterpret_cast<unsigned long long int*>(result), __double_as_longlong(sum * h));
}

int main() {
    // Define integration parameters
    double a = 0, b = 100; // Limits of integration
    int num_intervals = 1000000000; // Number of intervals for trapezoidal rule
    int answer = 50;

    double *d_result;
    cudaMalloc(&d_result, sizeof(double));
    cudaMemcpy(d_result, &answer, sizeof(double), cudaMemcpyHostToDevice);

    // Launch kernel
    int blockSize = 256;
    int numBlocks = (num_intervals + blockSize - 1) / blockSize;

    integratePolynomial<<<numBlocks, blockSize>>>(a, b, num_intervals, d_result);

    double integral;
    cudaMemcpy(&integral, d_result, sizeof(double), cudaMemcpyDeviceToHost);
    cudaFree(d_result);

    if (integral != answer) {
        std::cout << "Error: incorrect result: found " << integral << " instead of " << answer << std::endl;
    }

    // Output the result
    std::cout << "The integral of the polynomial in the range [" << a << ", " << b << "] is: " << integral << std::endl;

    return 0;
}
