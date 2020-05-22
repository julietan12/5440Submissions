include("PhasePortraitV2.jl")

function NotchDelta(u, v)
    a = @. 1/(1+10*(v^2/(0.1+v^2))^2)-u
    b = @. 1/(1+10*(u^2/(0.1+u^2))^2)-v

    return(a,b)
end

#Range of x1, x2 values
x1range = (0,1,15)          #Has the form (min, max, num points)
x2range = (0,1,15)          #Has the form (min, max, num points)
#x₀ = ([0.0,0.4],[0.1, 0.0],[0.4, 0.8], [0.8,0.4])  #initial state vectors; a common must be included after the first array
tspan=(0.0,100.0)             #time span

#Axes Labels
axeslabels = ["D1", "D2"]

#Call the phaseplot functon to construct the phase portrait
phaseplot(NotchDelta, x1range, x2range, xinit=(), t=tspan, clines=true,
        norm=true, scale=0.5, labels=axeslabels)
