import Pkg

Pkg.UPDATED_REGISTRY_THIS_SESSION[] = true

if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
elseif occursin("v" * string(VERSION)[1:4], Base.active_project())
    Pkg.activate(temp=true)
end
