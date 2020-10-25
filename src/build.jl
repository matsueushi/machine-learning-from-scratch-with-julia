root = joinpath(@__DIR__, "..")
using Pkg; Pkg.activate(root)
using Literate

src = joinpath(root, "notebook_script")
out = joinpath(root, "notebook")

function preprocess(s)
    s = "using Pkg; Pkg.activate(\".\"); Pkg.instantiate()\n#-\n" * s
end

for f in ["Project.toml", "Manifest.toml"]
    cp(joinpath(root, f), joinpath(out, f), force=true)
end

for x in readdir(src)
    Literate.notebook(joinpath(src, x), out; preprocess=preprocess, execute=true, documenter=true)
end