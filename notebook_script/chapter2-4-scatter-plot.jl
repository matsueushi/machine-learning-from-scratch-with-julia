# ## 2.4 グラフのプロット

## #src
#-
using CSV
using DataFrames
using Measures
using Plots


## #src
#-
data = CSV.read("../data/house-prices-advanced-regression-techniques/train.csv", DataFrame)


## #src
#-
scatter(data[!, :GrLivArea], data[!, :SalePrice], label="", margin = 12mm)
xlabel!("GrLivArea")
ylabel!("SalePrice")


## #src
#-
scatter(data[!, :MSSubClass], data[!, :SalePrice], label="", margin = 12mm)
xlabel!("MSSubClass")
ylabel!("SalePrice")
