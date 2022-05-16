abstract type RootFindingAlgorithm end

struct Bisection <: RootFindingAlgorithm end
struct Secant <: RootFindingAlgorithm
    max_iter::Int
    tol::Float64
end

@inline function _root(f::Function, (a, b)::Tuple{T,T} where {T<:Real}, ::Bisection)
    fa = f(a)
    fb = f(b)

    @assert(sign(fa * fb) <= 0)

    #while loop that containes bisection method iteration
    while true #inter <= max_iter
        p = (a + b) / 2 #midpoint or = a + (b-a)/2
        if (a == p) || (b == p)
            break
        end
        fp = f(p)
        if sign(fp * fb) <= 0 #if true, the root exists from the interval [a, p]
            b = p 
            fb = fp
        else
            a = p #The root exists from the interval [b, p]
            fa = fp
        end
    end
    p = (a + b) / 2
    println("The root is $p.")
end

@inline function _root(f::Function, (a, b)::Tuple{T,T} where {T<:Real}, s::Secant)
    #check if the root exists in 
    fa = f(a)
    fb = f(b)
    if fa*fb > 0
        return println("No Root Found in the specified interval because f(a)*f(b) > 0! Input another interval and run the function")
    end

    #setting up counters and root validator
    iter = 1
    p = 0 #to ensure the value of p carries out of the while loop

    #while loop with secant method formula
    while iter < s.max_iter
        ratio = fa / (fa - fb)
        p = a - (a - b) * ratio

        #check if root is found or if p is less than the error which is close to 0
        if f(p) == 0 || abs(p - b) < s.tol #Tolerance level, stopping criterion from Okten, G. (2020)
            p
            print("The root is $p and the iteration number is $iter.")
        end 
        a = b
        b = p
        iter += 1
    end
    
    #case for non convergence
    last_value = f(p)
    println("The Secant Method failed to find the root because the method did not converge. The last iterations gives root $p with function value $last_value.")
end
    

