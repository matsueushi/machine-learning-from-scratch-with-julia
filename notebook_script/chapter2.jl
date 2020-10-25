# # Chapter 2 - Python..ではなくJulia入門


## #src
# Juliaでは、改行あり出力は`println`
println("hello")


## #src
# ## 2.2 変数と変数出力
# 変数や計算の埋め込みは`$()`で行う。
# 型を調べるのは`type`ではなく`typeof`を用いる。
num = 10
string = "Hello World"
println("num=$(num), typeof(num)=$(typeof(num))")
println("string=$(string), typeof(string)=$(typeof(string))")


## #src
# フォーマット書式ありの出力は標準ライブラリに含まれている`Printf.@sprintf`を使う。
# Pythonの`.format`に近い表記になる。
using Printf

num = 10.5678
println(@sprintf("小数2位:%.2f, 小数5位:%.5f, 小数2位の指数表記:%.2e", num, num, num))


## #src
# ## 2.3 データ構造
# ### 2.3.1 リスト
# Juliaではベクトル型が組み込まれているので、Pythonのようにリストとnumpy.ndarrayの相互変換
# を意識するする必要はない
price1 = [120, 180]
price2 = [300, 150]
all = [price1, price2]
all


## #src
# ### 2.3.2 リストの大きさ
length(price1)


## #src
# ### 2.3.3 リストの各要素へのアクセス
# インデックスが0から始まるPythonと違い、Juliaのインデックスは1から始まる
## 最初(1番目)の要素: 120
price1[1]


## #src
# 最初の要素はfirstでもアクセスできる
first(price1)


## #src
#-
## 2番目の要素
all[2]


## #src
#-
## 2行 2番目の要素: 150
all[2][2]


## #src
# ### 2.3.4 リストの拡張
# リストの拡張は`push!`を使う
## 空のリスト
price = []


## #src
#-
## 要素の追加: [120, 180]
push!(price, [120, 180])


## #src
#-
## 要素の追加: [[120, 180], [300, 150]]
push!(price, [300, 150])


## #src
# ### 2.3.5 Vector, Array
# Juliaではリストと行列、ベクトルの区別を意識しなくて良い
price1 = [120, 180]


## #src
#-
## Juliaはcolumn oriented
price2 = [200 300; 50 150.0]


## #src
# 要素の型は`eltype`を使って確認できる
eltype(price1)


## #src
#-
eltype(price2)


## #src
# ### 2.3.6 Arrayの大きさ
# `Array`のサイズは`size`で調べる
size(price1)


## #src
#-
size(price2)


## #src
# ### 2.3.7 Arrayのスライシング
price = [120, 180, 300, 150]

## 最初(1番目)の要素: 120
price[1]


## #src
#-
## 2番目の要素: 180
price[2]


## #src
#-
## 最後の要素: 150
price[end]


## #src
#-
## 最後から2番目の要素: 300
price[end-1]


## #src
#-
## 2番目から3番目の要素: [180, 300]
price[2:3]


## #src
#-
## 最初から2番目までの要素: [120, 180]
price[1:2]


## #src
#-
## 最初から3番目までの要素: [120. 180, 300]
price[1:end-1]


## #src
#-
## 最初から最後までの要素
price[:]


## #src
# ### 2.3.8 Arrayの簡単な計算
price = [120, 180, 300, 150]

## 和: 750
sum(price)


## #src
#-
## 積: 972000000
prod(price)


## #src
#-
## 二乗: [14400, 32400, 90000, 22500]  
## `.`でbroadcastする
price .^ 2


## #src
#-
## 平方根: [10.9544515, 13.41640786, 17.32050808, 12.247448711]
sqrt.(price)


## #src
# 統計関連の計算には標準ライブラリであるStatisticsを使う
#-
using Statistics

## 平均値: 187.5
mean(price)


## #src
#-
## 分散: 4668.75
## Statistics.varはデフォルトで不偏分散を計算するので、標本分散は`corrected=false`とする
var(price, corrected=false)


## #src
#-
var(price)


## #src
#-
## 最小値: 120
minimum(price)


## #src
#-
## 最大値: 300
maximum(price)


## #src
#-
## 最小のインデックス: 1
argmin(price)


## #src
#-
## 最大のインデックス: 3
argmax(price)

## #src
# ### 2.3.9 Vectorのソート
price = [120, 180, 300, 150]

## 昇順に並び替えた値: [120, 150, 180, 300]
sort(price)


## #src
#-
## 降順に並び替えた値: [300, 180, 150, 120]
sort(price, rev=true)


## #src
#-
## 昇順に並び替えた値のインデックス: [1, 4, 2, 3]
sortperm(price)


## #src
#-
## 降順に並び替えた値のインデックス: [3, 2, 4, 1]
sortperm(price, rev=true)


## #src
# ### 2.3.10 Vectorのユニーク
price = [120, 180, 300, 150, 150]

## unique後: [120, 180, 300, 150]
## 順番は保存される
unique(price)


## #src
# ### 2.3.11 Vectorの条件を満たすインデックス
price = [120, 180, 300, 150]

## 条件を満たすインデックスを取得するにはfindall
findall(x -> x > 150, price)


## #src
#-
## マスクを作成するのはbroadcastを使えば簡単
indices = price .> 150


## #src
# ### 2.3.12 Arrayの結合
price1 = [120, 180]
price2 = [300, 150]

## horizontal方向への結合
hcat(price1, price2)


## #src
#-
## catを使っても書ける
cat(price1, price2; dims=2)


## #src
#-
## vertical方向への結合
vcat(price1, price2)


## #src
#-
## catを使っても書ける
cat(price1, price2; dims=1)


## #src
#-
price1 = reshape([120, 180], 1, 1, :)
price2 = reshape([300, 150], 1, 1, :)


## #src
#-
hcat(price1, price2)


## #src
#-
vcat(price1, price2)


## #src
#-
cat(price1, price2; dims=3)


## #src
# ### 2.3.13 Arrayの変形
price = [120, 180, 300, 150]


## #src
#-
## 2行 2列に変形
reshape(price, 2, 2)


## #src
#-
## 2行 2列に変形(自動)
reshape(price, 2, :)


## #src
#-
## 4行 1列に変形
reshape(price, 4, 1)


## #src
# ### 2.3.14 Arrayの繰り返し
price = [120, 180, 300, 150]

## 行方向に2回、列方向に1回繰り返す
repeat(price, 2, 1)


## #src
#-
## 行方向に1回、列方向に2回繰り返す
repeat(price, 1, 2)


## #src
#-
## 奥方向に2回、行・列方向に1回繰り返す
repeat(price, 1, 1, 2)


## #src
# ### 2.3.15 Arrayの次元拡張
price = [120, 180, 300, 150]

size(price)


## #src
#-
## 行方向に増やした後のsize
size(reshape(price, 1, :))


## #src
#-
## 列方向に増やした後のsize
size(reshape(price, :, 1))


## #src
# ### 2.3.16 Arrayの(軸方向の)回転
price = [120 180; 300 150]


## #src
#-
## 行方向に1つ回転する
circshift(price, (1, 0))


## #src
#-
## 列方向に1つ回転する
circshift(price, (0, 1))


## #src
#-
## 回転
rotr90(price, 1)


## #src
#-
rotl90(price, 2)


## #src
# ### 2.3.17 Arrayのインデックスの生成
price = [120, 180, 300, 150]

## 1:4
1:length(price)


## #src
#-
## [1, 2, 3, 4]
collect(1:length(price))


## #src
# ### 2.3.18 Arrayのインデックスのシャッフル
using Random

## シードを固定しておく
Random.seed!(1234)

price = [120, 180, 300, 150]

randperm(length(price))


## #src
# ### 2.3.19 単位行列の生成
using LinearAlgebra

Matrix(I, 5, 5)


## #src
# ### 2.3.20 CSV.jl & DataFrames.jl
# https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data?select=train.csv   
# からファイルをダウンロードしてdataフォルダに保存しているとする

## CSVファイルの読み込み
# pandas.DataFrameのようなDataFrameの構造を扱うにはDataFrames.jlを使う。
using CSV
using DataFrames


#-
data = CSV.read("../data/house-prices-advanced-regression-techniques/train.csv", DataFrame)


## #src
#-

## 5行目まで
first(data, 5)


## #src
#-
## カラムの一覧
names(data)


## #src
#-
## 建物の特徴(MSSubClass)
unique(data[!, :MSSubClass])


## #src
# ### 2.3.21 DataFrameからArrayへの変換
Array(data[!, [:GrLivArea, :SalePrice]])


## #src
# ### 2.3.22 DafaFrameのカラムの削除
length(names(data))


## #src
#-
## PoolAreaカラムを削除
select!(data, Not(:PoolArea))


## #src
#-
length(names(data))


## #src
# ## 2.4 グラフのプロット
# 別ファイル


## #src
# ### 2.5 if文とfor文
#-
values = [10, 3, 1, 5, 8, 6]

## 通常のfor文
## 空のリスト
passed_values = Int64[]
for v in values
    if v > 5
        push!(passed_values, v)
    end
end

## 結果を標準出力
println("5以上の値 $(passed_values)")


## #src
#-
## リスト内表記のforとif
passed_values = [v for v in values if v > 5]

## 結果を標準出力
println("5以上の値 $(passed_values)")


## #src
#-
## filterを使った表記
passed_values = filter(v -> v > 5, values)

## 結果を標準出力
println("5以上の値 $(passed_values)")


## #src
# ### 2.5.3 例外処理
#-
## Juliaでは1/0はInfになる
for i in [-1, 0, 1]
    println("$(1/i)")
end


## #src
#-
## 例外を発生させてみる
## for i in [-1, 0, 1]
##     println("$(i//i)")
##∂ end


## #src
#-
for i in [-1, 0, 1]
    try
        println("$(i//i)")
    catch
        continue
    end
end

