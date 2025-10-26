function pluto
    if test -f "Project.toml"
        julia -e 'import Pluto; Pluto.run()'
    else
        julia -e 'import Pkg; Pkg.add("Pluto"); import Pluto; Pluto.run()'
    end
end
