module main

include("vns_simheuristic.jl")

print("**** VNS based Simheuristic ****");

# read data
base_dir = pwd()
assets_info_file = base_dir * "\\VnsSimJulia\\data\\assets_v1.csv"
assets_correlations_file = base_dir * "\\VnsSimJulia\\data\\assets_correlations_v1.csv"
constraints_info_file = base_dir * "\\VnsSimJulia\\data\\constraints_v1.csv"

# decode asset

# decode correlations

# decode constraints and npv data

num_assets = 10;
assets_corr_matrix = zeros((num_assets, num_assets));
assets_cov_matrix = zeros((num_assets, num_assets));

# call algorithm

# print results

print("**** Stopped ****")

end # module
