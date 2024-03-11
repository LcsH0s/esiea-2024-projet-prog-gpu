#include <iostream>
#include <cmath>

// Define the new polynomial function here
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
    double a = 0, b = 100; // Bornes d'integration
    int num_intervals = 1000000000; // Nombre d'intervales d'integration
    int answer = 50;

    // Calcul du pas d'integration en fonction du nombre d'intervals
    double integral = integratePolynomial(a, b, num_intervals);

    if (integral != answer) {
        std::cout << "Error: incorrect result: found "<< integral << " instead of " << answer << std::endl;
    }

    // Output the result
    std::cout << "The integral of the polynomial in the range [" << a << ", " << b << "] is: " << integral << std::endl;

    return 0;
}
