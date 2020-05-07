include("PhasePortraitV2.jl")

# Function for a dual repression system without cooperativity
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (da/dt, dr/dt) over the range of (x1, x2)
function toggleMono(a, r)
    r0r = 1.0           # basal generation rate of R
    rr = 100.0          #
    r0a = 100.0         # basal generation rate of A
    ra = 5000.0         #
    da = 30.0           # first-order degradation rate of A
    u = @. -da*a + (r0a+ra*a^2)/(1+a^2+r^2)
    v = @. -r + (r0r+rr*a^2)/(1+a^2)

    return (u,v)
end

#Range of A, R values
arange = (0,200,15)          #Has the form (min, max, num points)
rrange = (0,100,15)          #Has the form (min, max, num points)
x₀ = ([1.0,10.0],[1.0,10.0]) #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span

#Axes Labels
axeslabels = ["A", "R"]

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, arange, rrange, xinit=x₀, t=tspan, clines=true,
        norm=true, scale=0.75, labels=axeslabels)

#Resolve ODEs
function bio_oscillator!(du,u,p,t)
    r0r = 1.0           # basal generation rate of R
    rr = 100.0          #
    r0a = 100.0         # basal generation rate of A
    ra = 5000.0         #
    da = 30.0
    du[1] = -da*u[1] + (r0a+ra*(u[1])^2)/(1+(u[1])^2+(u[2])^2)
    du[2] = -u[2] + (r0r+rr*(u[1])^2)/(1+(u[1])^2)
end
u0 = [1.0, 10.0]
p = ()
prob = ODEProblem(bio_oscillator!, u0, tspan, p)
sol = solve(prob)

fig = plot(sol)
savefig(fig, "./time_domain.png")
