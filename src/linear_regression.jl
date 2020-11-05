using LinearAlgebra
using Statistics


mutable struct LinearRegression
    X
    Y
    n_data
    input_dim
    w
    b
end


function LinearRegression(X, Y)
    n_data, input_dim = size(X)
    return LinearRegression(X, Y, n_data, input_dim, nothing, nothing)
end


# 2. 最小二乗法を用いてモデルパラメーターを最適化
function train!(model::LinearRegression)
    # 行列Xに「1」の要素を追加
    ndim = model.n_data
    Z = hcat(model.X, ones(ndim))

    # 分母の計算
    ZZ = 1 / ndim * Z' * Z

    # 分子の計算
    ZY = 1 / ndim * Z' * model.Y

    # パラメーターvの最適化
    # ZZ * v = ZY を解く
    v = ZZ \ ZY
    model.w = v[1:end-1]
    model.b = last(v)
    model
end

# 3. 予測
# X: 入力データ(データ数 x 次元数のArray)
predict(model::LinearRegression, x) = x * model.w .+ model.b

# 4. 平方平均二乗誤差(Root Mean Squared Error)
# X: 入力データ(データ数 x 次元数のArray)
# Y: 出力データ(データ数 x 1のArray)
rmse(model::LinearRegression, x, y) = sqrt.(mean((predict(model, x) - y).^2))

# 5. 決定係数の計算
# X: 入力データ(データ数 x 次元数のArray)
# Y: 出力データ(データ数 x 1のArray)
function r2(model::LinearRegression, x, y)
    sq = sum((predict(model, x) - y).^2)
    vr = sum((y .- mean(y; dims=1)).^2)
    return 1 - sq / vr
end

# L2ノルム正則化最小二乗法を用いてモデルパラメーターを最適化
# lamb: 正則化の重み係数(実数スカラー)
function train_regularized!(model::LinearRegression, lamb=0.1)
    # 行列Xに「1」の要素を追加
    ndim = model.n_data
    Z = hcat(model.X, ones(ndim))

    # 分母の計算
    ZZ = 1 / ndim * Z' * Z + lamb * I

    # 分子の計算
    ZY = 1 / ndim * Z' * model.Y

    # パラメーターvの最適化
    # ZZ * v = ZY を解く
    v = ZZ \ ZY
    model.w = v[1:end-1]
    model.b = last(v)
    model
end