module initial_solution

export initial_solution

# project_list could be a maxtrix n x m -> n assets and m properties
# asset : id expected_retribution(ri) standard_deviation (si)
function initial_solution(project_list, max_risk, k_min, k_max)

    # init solution
    feasible_solution = zeros(12)
    is_feasible = false
    aux_project_list <- copy_project_list(project_list)

    # bucle
    # while not is_feasible do
    #   s <- randPortfolioSize(k_min, k_max)
    #   selected_projects <- select_preselected_projects(project_list)
    #   project_list <- remove_project(project_list, select_preselected_projects)
    #   portfolio <- add_project_to_portfolio(portfolio, selected_projects)
    #   current_portfolio_size < get_portfolio_size(portfolio)
    #   while current_portfolio_size < s do 
    #       project <- select_project_randomly(project_list)
    #       project_list <- remove_project(project_list, project)
    #       portfolio <- add_project_to_portfolio(project)
    #        current_portfolio_size++
    #   end
    #   init_sol <- local_solver(portfolio)
    #   if (satisfy_constraints(init_sol, maxRisk))  
    #       is_feasible <- true
    #   else
    #       project_list <- copy_project_list(aux_project_list)
    #       portfolio <- delete_portfolio(portfolio)
    #   end
    #  end
    return feasible_solution
end