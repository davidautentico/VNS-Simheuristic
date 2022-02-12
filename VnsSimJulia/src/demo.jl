using CSV
using DataFrames
 
 A = [0,1,1,0]
 b = filter((x)->x==1,A)
 print(b)

 # probar lectura de csv
 base_dir = pwd()
 csv_path = base_dir * "\\VnsSimJulia\\data\\constraints_v1.csv"
 print(csv_path)
 csv_reader = CSV.File(csv_path;header=1, delim=";")
 for row in csv_reader
    println("values: $(row.kmin), $(row.kmax), $(row.total_budget)")
end