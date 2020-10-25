## #src
#-
include("../src/house_price_data.jl")

## #src
#-
my_data = HousePriceData("../data/train.csv")

levels = [20, 30, 60, 70]
titles = [
    "1-Story 1946 & Newer",
    "1-Story 1945 & Older",
    "2-Story 1946 & Newer",
    "2-Story 1945 & Order",
]

fig = plot_scatter(my_data, titles, levels)

## Julia REPL
## display(fig)

## jupyter notebook
fig

## #src
#-
print("hello")

