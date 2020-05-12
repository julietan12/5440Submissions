using Plots

ax = 1.5
bx = 5.0
zx = 0.4
nzx = 2.7
xz = 1.5
nxz = 2.7
dz = 1

Z_vector = zeros(0)
S_vector = zeros(0)
X_vector = zeros(0)

for X = 0:0.1:10

    Z = 1/((1+(X/xz)^(nxz))*dz)
    append!(Z_vector, Z)
    S = (X+X*(Z/zx)^(nzx)-ax)/(bx-X)
    append!(S_vector, S)

    append!(X_vector, X)

end

myplot = plot(S_vector, X_vector, xlims = (0.0, 2), ylims = (0, 5), xaxis = "S", yaxis = "X")

display(myplot)

savefig(myplot, "./2c.png")
#S = (X+X*(z/zx)^(nzx)-ax)/(bx-X)

#S = (X+X*(1/((1+(X/xz)^(nxz))*dz))/zx)^(nzx))-ax)/(bx-X)



#####################################
#z = 1/((1+(x/xz)^nxz)*dz)
