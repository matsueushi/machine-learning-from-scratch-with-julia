# # Chapter 4 - 回帰分析
# ## 4.1 線形回帰分析
## #src
include("../src/data.jl")
include("../src/linear_regression.jl")

using Measures
using Plots


## #src
#-
## 1. データの作成
data = regression_data1()


## #src
#-
function linear_regression(data; normalize=false)
    ## 2. データを学習用と評価用に分割
    n_train = floor(Int64, size(data.X, 1) * 0.9)

    ## 学習データ(全体の90%)
    X = normalize ? (data.X .- mean(data.X; dims = 1)) ./ std(data.X; corrected = false, dims = 1) : data.X
    Y = normalize ? (data.Y .- mean(data.Y; dims = 1)) ./ std(data.Y; corrected = false, dims = 1) : data.Y
    x_train = X[1:n_train, :]
    y_train = Y[1:n_train]

    ## 評価データ(全体の10%)
    x_test = X[n_train + 1:end, :]
    y_test = Y[n_train + 1:end]

    ## 3. 線形モデルの学習
    model = LinearRegression(x_train, y_train)
    train!(model)
    println("モデルパラメーター:\nw=$(model.w), \nb=$(model.b)")
    println("平方平均二乗誤差=$(rmse(model, x_test, y_test))ドル")
    println("決定係数=$(r2(model, x_test, y_test))")
    return model
end


## #src
#-
## 4. 線形モデルの評価
model = linear_regression(data)


## #src
#-
## 5. 線形モデルのプロット
scatter(data.X, data.Y,
        label = "Data",
        legend = :topleft,
        xlabel = "Garage Area x (square feet)",
        ylabel = "Sale Price y (USD)",
        margin = 12mm)
xs = 0:100:6000
## 予測を計算する。xs は reshapeする必要あり
ys = predict(model, reshape(xs, :, 1))
plot!(xs, ys, linewidth = 2, label = "Linear Regression Model")


## #src
# ### 4.1.9 重回帰分析の実行
data2 = regression_data2()
model2 = linear_regression(data2)


## #src
# ### 4.1.11 標準化による説明変数の重要度分析
model3 = linear_regression(data2, normalize = true)


## #src
# ### 4.1.12 外れ値と正則化
scatter(data.X, data.Y,
        label = "Train data without outlier",
        legend = :topleft,
        xlabel = "Garage Area x (square feet)",
        ylabel = "Sale Price y (USD)",
        margin = 12mm)
data_outlier = regression_data3()
scatter!(data_outlier.X, data_ourlier.Y,
        label = "Trains data with outlier")
scatter!(data.X[data.Y .< 700000, :], data.Y[data.Y .< 700000],
        label = "Train data")
plot!(xs, ys, linewidth = 2, label = "Linear Regression Model (No outlier)")
model4 = linear_regression(data3)
ys_model4 = predict(model4, reshape(xs, :, 1))
plot!(xs, ys_model4, linewidth = 2, label = "Linear Regression Model (With outlier)")


## #src
#-
## L2正則平均二乗誤差の正則化
## 正則化項なしの場合
scatter(data.X, data.Y,
        label = "Data",
        legend = :topleft,
        xlabel = "Garage Area x (square feet)",
        ylabel = "Sale Price y (USD)",
        margin = 12mm)
xs = 0:100:6000
ys = predict(model, reshape(xs, :, 1))
plot!(xs, ys, linewidth = 2, label = "Linear Regression Model")


## #src
#-
## 正則化項あり(lamb=1)
model_reg = linear_regression(data)
train_regularized!(model_reg, 1.0)
scatter(data.X, data.Y,
        label = "Data",
        legend = :topleft,
        xlabel = "Garage Area x (square feet)",
        ylabel = "Sale Price y (USD)",
        margin = 12mm)
xs = 0:100:6000
ys_reg = predict(model_reg, reshape(xs, :, 1))
plot!(xs, ys_reg, linewidth = 2, label = "Linear Regression Model")