using DifferentialEquations
using Plots

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
   S=0.02
   du[1] = (ax+bx*S)/(1+S+(u[3]/zx)^nzx)-u[1]
   du[2] = (ay+by*S)/(1+S+(u[1]/xy)^nxy)-dy*u[2]
   du[3] = 1/(1+(u[1]/xz)^nxz+(u[2]/yz)^nyz)-dz*u[3]
end

u0 = [0.0, 0.0, 0.0]
p = ()
tspan = (0.0, 50.0)
prob1 = ODEProblem(prelim1!, u0, tspan)
sol1 = solve(prob1)

fig1  = plot(sol1, vars = (0,1), title="2d, S=0.02", xaxis="t", yaxis="X")
display(fig1)
savefig(fig1, "./2d_1.png")

function prelim2!(du, u, p, t)
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
   S=1.0e5
   du[1] = (ax+bx*S)/(1+S+(u[3]/zx)^nzx)-u[1]
   du[2] = (ay+by*S)/(1+S+(u[1]/xy)^nxy)-dy*u[2]
   du[3] = 1/(1+(u[1]/xz)^nxz+(u[2]/yz)^nyz)-dz*u[3]
end

prob2 = ODEProblem(prelim2!, u0, tspan)
sol2 = solve(prob2)

fig2  = plot(sol2, vars = (0,1), title="2d, S=10^5", xaxis="t", yaxis="X")
display(fig2)
savefig(fig2, "./2d_2.png")

function prelim3!(du, u, p, t)
   ax = 0.486
   bx = 5.31
   zx = 1.94e-3
   nzx = 2.8
   ay = 0.252
   by = 6.2
   xy = 1.4e-3
   nxy = 2.8
   dy = 1.07
   xz = .038
   nxz = 2.8
   yz = .097
   dz = 2.0
   nyz = 2.8
   S=10.0
   du[1] = (ax+bx*S)/(1+S+(u[3]/zx)^nzx)-u[1]
   du[2] = (ay+by*S)/(1+S+(u[1]/xy)^nxy)-dy*u[2]
   du[3] = 1/(1+(u[1]/xz)^nxz+(u[2]/yz)^nyz)-dz*u[3]
end

prob3 = ODEProblem(prelim3!, u0, tspan)
sol3 = solve(prob3)

fig3  = plot(sol3, vars = (0,1), title="2d, S=10", xaxis="t", yaxis="X")
display(fig3)
savefig(fig3, "./2d_3.png")
