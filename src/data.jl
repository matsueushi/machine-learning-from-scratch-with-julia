using CSV
using DataFrames

struct RegressionData
    X
    Y
    x_label
    y_label
end


# 物件価格）説明変数:居住面積
function regression_data1()
    path = "../data/house-prices-advanced-regression-techniques/train.csv"
    data = CSV.read(path, DataFrame)
    X = data[data[:MSSubClass] .== 60, :GrLivArea]
    Y = data[data[:MSSubClass] .== 60, :SalePrice]
    x_label = "居住面積x[平方フィート]"
    y_label = "物件価格y[ドル]"
    return RegressionData(X, Y, x_label, y_label)
end


# 物件価格）説明変数:居住面積,車庫面積,プール面積,ベッド部屋数,全部屋
function regression_data2()
    path = "../data/house-prices-advanced-regression-techniques/train.csv"
    data = CSV.read(path, DataFrame)
    X = Array(data[data[:MSSubClass] .== 60, [:GrLivArea, :GarageArea, :PoolArea, :BedroomAbvGr, :TotRmsAbvGrd]])
    Y = data[data[:MSSubClass] .== 60, :SalePrice]
    x_label = ""
    y_label = "物件価格y[ドル]"
    return RegressionData(X, Y, x_label, y_label)
end


# 物件価格）説明変数:居住面積、物件価格に外れ値を追加
function regression_data3()
    path = "../data/house-prices-advanced-regression-techniques/train.csv"
    data = CSV.read(path, DataFrame)
    X = data[data[:MSSubClass] .== 60, :GrLivArea]
    Y = data[data[:MSSubClass] .== 60, :SalePrice]
    Y[Y .> 700000] -= 700000  # 外れ値
    x_label = "居住面積x[平方フィート]"
    y_label = "物件価格y[ドル]"
    return RegressionData(X, Y, x_label, y_label)
end
