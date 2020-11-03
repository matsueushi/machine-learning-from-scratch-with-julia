struct LinearRegression
    X
    Y
    n_data
    input_dim
end

function LinearRegression(X, Y)
    n_data, input_dim = size(X)
    return LinearRegression(X, Y, n_data, input_dim)
end

# 最小二乗法を用いてモデルパラメーターを最適化
function train(model::LinearRegression)
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
    return v[1:end-1], last(v)
end