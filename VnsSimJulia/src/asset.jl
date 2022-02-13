module Asset
export NpvData, AssetData

struct NpvData
    cf0 :: Float64;
    cf1 :: Float64;
    cf2 :: Float64;
    cf3 :: Float64;
    cf4 :: Float64;
    discountRate :: Float64;
    npv :: Float64;
end

struct AssetData
    id :: Integer
    expectedReturn :: Float64;
    stDev :: Float64;
    minRequestedBudget :: Float64;
    requestedBudget :: Float64;
    mandatory :: Bool;
    qmin :: Float64;
    qmax :: Float64;
    npvData :: NpvData;
end

end

