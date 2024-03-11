#include <iostream>

// Polynomial definition here
double polynomial(double x) {
    return x;
}

// Function to compute the integral of a polynomial using the trapezoidal rule
double integratePolynomial(double a, double b, int num_intervals) {
    double h = (b - a) / num_intervals;
    double sum = 0.5 * (polynomial(a) + polynomial(b));

    for (int i = 1; i < num_intervals; i++) {
        double x = a + i * h;
        sum += polynomial(x);
    }

    return sum * h;
}

int main() {
    double a = 0,b = 1;
    int num_intervals = 20;

    // Compute the integral using the trapezoidal rule
    double integral = integratePolynomial(a, b, num_intervals);

    // Output the result
    std::cout << "The integral of the polynomial in the range [" << a << ", " << b << "] is: " << integral << std::endl;

    return 0;
}
