module initial_solution
export initial_solution
using StatsBase

# project_list could be a maxtrix n x m -> n assets and m properties
# asset : id expected_retribution(ri) standard_deviation (si)
# model for local_solver?¿
# each project needs a min budget and a request budget (max)
# npv = net present value = prsent value of future inflows - present value of future outflows
# goal = max ( npv of the portfolio)
# cash flows = modeled as random variables
# interest rate = modeled as random variables 
# Benefit i in period t = Cit*xi /(1 + Rit)^t
# Cit is cashflows of xi in period t
# Rit is random discount rate
# NPVi = SUM (Bit) wih t=1..m
# NPV = SUM (NPVi) for all i
# goal = MAX (E[NPV])
function initial_solution(project_list, project_selected_ids, max_risk, k_min, k_max)

    
    # number of projects
    total_projects_size = size(project_selected_ids)

    # init solution
    feasible_solution = zeros(10)
    is_feasible = false

    # get the number of preselected projects
    selected_ids_map = countmap(project_selected_ids)
    total_selected_size = calculate_selected_ids[1]

    # loop
    while !is_feasible do
        portfolioSize = rand(k_min, k_max)
        # copy initial values with preselected ids
        initial_solution_ids = copy(project_selected_ids)
        while total_selected_size < portfolioSize do 
            candidate_idx = rand(1, total_projects_size)
            if initial_solution_ids[candidate_idx] == 0
                initial_solution_ids[candidate_idx] = 1
                total_selected_size += 1
            end
        end

        # solution candidate is built
        candidate_solution <- zeros(portfolioSize)
        idx = 0
        for i in total_projects_size do 
            if initial_solution_ids[i] == 1
                candidate_solution[idx] = project_list[i]
                idx +=1
            end
        end

        # call to local solver
        feasible_solution = local_solver(candidate_solution)
        if (satisfy_constraints(solution, maxRisk))
            is_feasible = true
    end
    return feasible_solution
end