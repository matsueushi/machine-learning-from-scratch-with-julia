# # Chapter 4 - 回帰分析
# ## 4.1 線形回帰分析
## #src
include("../src/data.jl")
include("../src/linear_regression.jl")


## #src
#-
## 1. データの作成
data = regression_data1()


## #src
#-
## 2. データを学習用と評価ように分割
n_train = floor(Int64, length(data.X) * 0.9)
## 学習データ(全体の90%)
x_train = data.X[begin:n_train, :]
y_train = data.Y[begin:n_train]

## 評価データ(全体の10%)
x_test = data.X[n_train + 1:end, :]
y_test = data.Y[n_train + 1:end]


## #src
#-
## 4. 線形モデルの学習
model = LinearRegression(x_train, y_train)
train(model)

## #src
#-
println(train(model))
