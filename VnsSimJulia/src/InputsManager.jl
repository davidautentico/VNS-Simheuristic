module InputsManager

using Asset, Constraints

# read assets: return;standardDeviation;mandatory;qmin;qmax;
function readAssets(assetFilePath)

    assets = AssetData[]
    npvData = NpvData()
    csv_reader = CSV.File(assetFilePath; header = 1, delim = ";")
    i = 1
    for row in csv_reader
        cf0 = row.cf0
        cf1 = row.cf1
        cf2 = row.cf2
        cf3 = row.cf3
        cf4 = row.cf4
        minPerBudget = row.minPerBudget
        discountRate = row.discountRate

        # cash flows
        cfs = Float64[]
        push!(cfs, cf0)
        push!(cfs, cf1)
        push!(cfs, cf2)
        push!(cfs, cf3)
        push!(cfs, cf4)
        cfsSize = size(cfs)[1]

        # calculate npvValue and requestedBudget
        requestedBudget = 0
        npvalue = 0
        for cfItem in cfs
            npvalue += cfItem / (1 + discountRate)^cfsSize
            if (cfItem < 0)
                requestedBudget += cfItem
            end
        end
        minRequestedBudget = abs(requestedBudget * minPerBudget)
        standardDeviation = npvalue * 0.05

        npvData = NpvData(cf0, cf1, cf2, cf3, cf4, discountDate, npvalue)

        # asset
        asset = AssetData(
            i,
            row.returns,
            standardDeviation,
            minRequestedBudget,
            requestedBudget,
            row.mandatory,
            row.qmin,
            row.qmax,
            npvData,
        )
        push!(assets, asset)

        i += 1
    end

    return assets
end

# read assets correlations and create covariance matrix

# read constraints: kmin, kmax, total_budget
function readConstraints(constraintsFilePath)
    csv_reader = CSV.File(constraintsFilePath; header = 1, delim = ";")
    kMin = 0
    kMax = 0
    totalBudget = 0
    for row in csv_reader
        kMin = row.kmin
        kMax = row.kmax
        totalBudget = row.total_budget
    end

    return ConstraintsData(kMin, kMax, totalBudget)
end

end
