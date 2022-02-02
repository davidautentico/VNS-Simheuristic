module vns_simheuristic

include("initial_solution.jl")
include("fast_simulation.jl")
include("deep_simulation.jl")

# algo implementation

# baseSol <- genInitialSol
# baseSol <- fastSimulation(baseSol)
#
#    main_vns_search
#
# bestSol <- deepSimulation(bestSol)
#
# return (bestSol)