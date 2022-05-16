module TMP

export Bisection, Secant, findroot

include("rootfinding_algorithm.jl")

function findroot(f :: Function , (a,b) :: Tuple{T, T} where T <: Real , alg :: RootFindingAlgorithm)
    _root(f, (a,b), alg)
end

end