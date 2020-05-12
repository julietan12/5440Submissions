using DifferentialEquations
using Plots
#before Hopf bifurcation
function prelim1!(du, u, p, t)
   ax = 1.5
   bx = 7.17
   zx = 1.75e-3
   nzx = 2.7
   ay = 0.31
   by = 14.9
   xy = 2.0e-3
   nxy = 2.7
   dy = 1.31
   xz = 0.19
   nxz = 2.7
   yz = 0.13
   dz = 1.41
   nyz = 2.7
   S=0.1
   du[1] = (ax+bx*S)/(1+S+(u[3]/zx)^nzx)-u[1]
   du[2] = (ay+by*S)/(1+S+(u[1]/xy)^nxy)-dy*u[2]
   du[3] = 1/(1+(u[1]/xz)^nxz+(u[2]/yz)^nyz)-dz*u[3]
end

u0 = [0.0045, 0.575, 0.065]
p = ()
tspan = (0.0, 50.0)
prob1 = ODEProblem(prelim1!, u0, tspan)
sol1 = solve(prob1)

fig1  = plot(sol1, vars = (0,3), title="2e, S=0.1", xaxis="t", yaxis="X", minorgrid = true)
display(fig1)
savefig(fig1, "./2e_1.png")

display(sol1[:,2])
