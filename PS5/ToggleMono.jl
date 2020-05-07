include("PhasePortraitV2.jl")

# Function for a dual repression system without cooperativity
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)
function toggleMono(u, v)
    du = 1.0               #degradation rate const. for u
    dv = 1.0               #degradation rate const. for v
    alpha = 10.0           #effective rate of synthesis of repressors
    n = 2.0                #cooperativity of repression

    a = @. -du*u + alpha/(1+v^n) #eqn 1
    b = @. -dv*v + alpha/(1+u^n)   #eqn 2

    return (a,b)
end

#Range of x1, x2 values
x1range = (0,10,15)          #Has the form (min, max, num points)
x2range = (0,10,15)          #Has the form (min, max, num points)
#x₀ = ([0.9,0.35],[0.1, 0.0])  #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span

#Axes Labels
axeslabels = ["u", "v"]

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, x1range, x2range, xinit=(), t=tspan, clines=true,
        norm=true, scale=0.5, labels=axeslabels)
