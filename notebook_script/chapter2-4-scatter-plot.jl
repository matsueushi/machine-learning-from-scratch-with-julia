# ## 2.4 グラフのプロット

## #src
#-
using CSV
using DataFrames
using Plots


## #src
#-
data = CSV.read("../data/train.csv", DataFrame)


## #src
#-
scatter(data[!, :GrLivArea], data[!, :SalePrice], label="")
xlabel!("GrLivArea")
ylabel!("SalePrice")


## #src
#-
scatter(data[!, :MSSubClass], data[!, :SalePrice], label="")
xlabel!("MSSubClass")
ylabel!("SalePrice")
