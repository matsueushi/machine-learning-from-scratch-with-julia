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
    println("ベクトル $(s)) 形: $(size(y)), 要素の型:$(eltype(y))\n$(y)\n")
end


## #src
### 3.1.2 ベクトルの内積
## 列ベクトル: 2行1列のArrayを定義
w = [5.0, 3.0]

## 行ベクトル: 1行2列
x = [1.0 5.0]

## 内積の計算
xw = x ⋅ w


## #src
#-
## wのノルムの計算: wの転置(行ベクトル)とw(列ベクトル)の掛け算
ww = transpose(w) ⋅ w


## #src
#-
## ノルムを計算する関数が用意されている
using LinearAlgebra
norm(w)


## #src
#-
println("xとwの内積) 形: $(size(xw)), 型:$(typeof(xw))\n$(xw)\n")
println("wのノルム) 形: $(size(ww)), 型:$(typeof(ww))\n$(ww)\n")


## #src
# ### 3.1.5 行列とベクトルの関係
## 行列: 3行2列のArrayを定義
X = [1.0 2.0; 2.0 4.0; 3.0 6.0]


## #src
#-
## 1行目の行ベクトル(1行2列)の取り出し
Xrow1 = X[[1], :]


## #src
#-
## 2列目の列ベクトル(3行1列)の取り出し
Xcol2 = X[:, [2]]


## #src
#-
## 標準出力
println("行列X) 形:$(size(X)), 要素の型:$(eltype(X))\n$(X)\n")
println("1行目) 形:$(size(Xrow1)), 要素の型:$(eltype(Xrow1))\n$(Xrow1)\n")
println("2列目) 形:$(size(Xcol2)), 要素の型:$(eltype(Xcol2))\n$(Xcol2)\n")


## #src
#-
## リストなしの場合
X[1, :]


## #src
#-
## リストありの場合
X[[1], :]


## #src
# ### 3.1.6 行列の積と和
## 行列 X: 3行2列のArrayを定義
X = [1.0 2.0; 2.0 4.0; 3.0 6.0]

## 列ベクトル b: 2行1列のArrayを定義
w = [5.0, 3.0]

## 列ベクトル b: 3行1列のArrayを定義
b = [1.0, 1.0, 1.0]

## 行列とベクトルの積と和
res = X * w .+ b
println("積和の結果 \n$(res)")


## #src
# ### 3.1.8 行列の階数
## 行列: 2行2列のArrayを定義
A = [6.0 2.0; 2.0 5.0]
B = [6.0 3.0; 2.0 1.0]

## 行列のランクの計算
println("Rank of A: $(rank(A))")
println("Rank of B: $(rank(B))")


## #src
#-
function find_inv(mat)
    if rank(mat) == size(mat)[1]
        println("行列:\n$(mat)\nランク$(rank(mat))\n逆行列:\n$(inv(mat))\n")
    else
        println("行列:\n$(mat)\nランク$(rank(mat))\n特異行列")
    end
end

find_inv(A)
find_inv(B)