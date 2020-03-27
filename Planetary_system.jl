
# ------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------
# This code was created to run with Julia V0.6.4. Al thoug the logic can be applied with any ohter
# language, such as C++, scilab, matlab, etc.
# The forward-Euler method is used to calculate position (x,y,z), velocities (U,V,W) and acelerat-
# ion (Ax, Ay, Az) of every particle at the next timestep.
# ------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------- Created by Maveryck Garzon
 
# Initial conditions
#	Sun	Merc.	Venus	Earth	Mars	Jup.	Satur.	Uran.	Nept.	Plut.
X = [	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0]
Y = [	0.0	0.387	0.723	1	1.524	5.203	9.54	19.2	30.1	39.4]
Z = [	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0]
U = [	0.0	-78	-70	-59	-47	-26	-18.8	-13.2	-10.5	-9]
V = [	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0]
W = [	4.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0]
M = [	331e3	0.06	0.82	1	0.1	318	95.1	14.6	17.2	0.002]

# Note: M contains the mass of every planet relative to earth's. So Jupiter contains 318 times
#	the mass of earth.

Xc = copy(X)
Yc = copy(Y)
Zc = copy(Z)
Uc = copy(U)
Vc = copy(V)
Wc = copy(W)
# Initial Parameters:
 N = 20000; 	# Time steps
 t = 0;
dt = 0.0001
 G = 1e-02 	# Notice all parameters are relative to earth's ones. So G must be fitted.
Obj = 10 	# Number of objects in the system

for i in 1:Obj
       f = open("Data/Data$i.dat","w") do io; # There have to be a folder called "Data"
	write(io, " \n");
	end;
end

for k in 2:N;
  t = t + dt

	for i in 1:Obj
		Ax = 0.0;
		Ay = 0.0;
		Az = 0.0;
	     for j in 1:Obj
		if i==j
		  # Nothing happens
		else
		 r_xy = sqrt(  (X[j]-X[i])^(2) + (Y[j]-Y[i])^(2)  )
		 r_t  = sqrt( r_xy^(2) + (Z[j]-Z[i])^(2)  )
		 A = G*M[j]/(r_t^2)	     # Newton's Gratvitational law
		Ax = Ax + A*(X[j]-X[i])/r_xy # A_xi = sum(A_j*cos(theta_j))
		Ay = Ay + A*(Y[j]-Y[i])/r_xy # A_yi = sum(A_j*sin(theta_j))
		Az = Az + A*(Z[j]-Z[i])/r_t  # A_zi = sum(A_j*sin(omega_j))
		end
	     end
		Uc[i] = U[i] + Ax*dt;
		Vc[i] = V[i] + Ay*dt;
		Wc[i] = W[i] + Az*dt;
		Xc[i] = X[i] + Uc[i]*dt;
		Yc[i] = Y[i] + Vc[i]*dt;
		Zc[i] = Z[i] + Wc[i]*dt;

		# Every Data file contains the position of that body at every timestep
           	open("Data/Data$i.dat","a") do Data;  
	   	     write(Data, "$t $(Xc[i]) $(Yc[i]) $(Zc[i]) \n");
	  	 end;
	end

# All positions are actualized so the next timestep can start
X = Xc
Y = Yc
Z = Zc
U = Uc
V = Vc
W = Wc

end;

