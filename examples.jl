module TST

using Main.TMP

example1() = findroot(x->x^3-2, (1,2), Bisection())

example2() = findroot(x->x^5+2x^3-5x-2, (0,2), Bisection())

example3() = findroot(x->x^3 - 5*x^2 + 1.01*x + 1.88, (-1,0), Bisection())

example4() = findroot(x->x^3 - 5*x^2 + 1.01*x + 1.88, (-2,-1), Bisection())

example5() = findroot(x->x^3-2, (2.5,5.0), Secant(20,1e-7)) #No root found example

example6() = findroot(x-> x^3 - 5*x^2 + 1.01*x + 1.88, (2.5,5.0), Secant(20,1e-7)) #root found example

example7() = findroot(x-> x^3 - 5*x^2 + 1.01*x + 1.88, (2,5), Secant(20,1e-7)) #No convergence example

end
