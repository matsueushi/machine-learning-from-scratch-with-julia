# # Chapter 3 - 数学のおさらい


## #src
# ## 3.1
# ### 3.1.1 スカラーとベクトル
## 列ベクトル: 2行1列のArrayを定義
## Juliaはcolumn-major
w = [5.0, 3.0]


## #src
## 行ベクトル
#-
## 行ベクトル: 1行2列
x = [5.0 3.0]


## #src
#-
## すべての要素が0の1行5列のArrayを生成
x_zeros = zeros(1, 5)


## #src
#-
## すべての要素が1の1行5列のArrayを生成
x_ones = ones(1, 5)


## #src
#-
## 一様分布または正規分布にしたがってランダムに1行5列のArrayを生成
using Random
Random.seed!(1234)

## 一様分布
uniform = rand(1, 5)


## #src
#-
## 正規分布
normal = randn(1, 5)


## #src
#-
## 標準出力
for s in (:w, :x, :x_zeros, :x_ones, :uniform, :normal)
    y = eval(s)
    println("ベクトル $(s)) 形: $(size(y)), 型:$(eltype(y))\n$(y)\n")
end


## #src
### 3.1.2 ベクトルの内積
## 列ベクトル: 2行1列のArrayを定義
w = [5.0, 3.0]

## 行ベクトル: 1行2列
x = [1.0 5.0]

## 内積の計算
xw = x * w
