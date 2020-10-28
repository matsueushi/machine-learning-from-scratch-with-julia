# Chapter 2.6 コンストラクタ
using CSV
using DataFrames
using Plots
using Measures


struct HousePriceData
    df
end

# コンストラクタ
function HousePriceData(path::AbstractString)
    df = CSV.read(path, DataFrame)
    HousePriceData(df)
end

# 建物の等級(MSSubClass)を限定した散布図(横軸GrLibArea, 縦軸SalePrice)をプロットするメソッド
# titles: タイトル(グラフ数のリスト)
# levels: 建物の東急(グラフ数のリスト)
function plot_scatter(data::HousePriceData, titles, levels)
    xrange = extrema(data.df[!, :GrLivArea])
    yrange = extrema(data.df[!, :SalePrice])

    plts = []
    for (title, lv) in zip(titles, levels)
        df_plot = data.df[data.df.MSSubClass .== lv, :]
        fig = scatter(df_plot[!, :GrLivArea],
                      df_plot[!, :SalePrice],
                      title = title,
                      xlims = xrange,
                      ylims = yrange,
                      label = "")
        xlabel!("GrLivArea")
        ylabel!("SalePrice")
        push!(plts, fig)
    end
    plot(plts..., layout = (:, 2), size = [600, 600], margin = 3mm)
end
