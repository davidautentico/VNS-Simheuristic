module main

include("vnsSim.jl")

test = vnsSim.vns_sim(5,4)
greet() = print("Hello World!")

print(test)

end # module
