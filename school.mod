set J;		#	Secondary school catchment zones
set L;		#	Elementary school catchment zones
set G;		#	Choices of capacity for a new secondary school	
set H;		#	Choices of capacity for a new elementary school

param S {J} >= 0;		#	Secondary students population
param c {J} >= 0;		#	Secondary school capacity
param sig {J} >= 0;		#	Number of 100 seats expanding for secondary
param tau {L} >= 0;		#	Number of 100 seats expanding for elementary
param phi >= 0; 		#	Cost for Expanding 100 seats for secondary
param lam >= 0;			#	Cost for Expanding 100 seats for elementary
param gam {G} >= 0;		#	Capacity for a new secondary school
param a {J,J} >= 0;		#	Adjacencies for secondary catchment zones
param the {G} >= 0;		#	Cost for building a new secondary school
param E {L} >= 0;		#	Elementary students population
param d {L} >= 0;		#	Elementary school capacity
param del {H} >=0;		#	Capacity for a new elementary school
param b {L,L} >=0;		#	Adjacencies for elementary catchment zones
param psi {H} >=0;		#	Cost for building a new elementary school
param Bud >=0;			#	Total Budget
param P {j in J} = S[j]-c[j];	
param Q {l in L} = E[l]-d[l];
param alp >= 0;
param bet >=0;	

set I := {j in J: P[j] > 0};		#	Secondary zones that have overcap
set K := {l in L: Q[l] > 0};		#	Elementary zones that have overcap

var W {j in I} integer >= 0;			#	Expansion for secondary
var X {l in K} integer >=0;     		#	Expansion for elementary
var Y {j in I, g in G} integer >= 0; 	#	Locations for new secondary
var Z {l in K, h in H} integer >= 0;	#	Locations for new elementary
var U {i in I, j in I} integer >= 0;	#	Transfers for new secondary
var V {k in K, l in K} integer >= 0;	#	Transfers for new elementary

maximize Crowdedness:
	sum {i in I} 100*W[i] + 0.9*sum {i in I,j in I} U[i,j] + 0.1*sum {i in I} U[i,i] + sum {k in K} 100*X[k] + 0.9*sum {k in K,l in K} V[k,l] + 0.1*sum {k in K} V[k,k]; 
	
subject to Lowerbd_Sec {i in I}:
	sum {j in I} U[i,j] <= P[i] - 100*W[i];
subject to Lowerbd_Ele {k in K}:  
	sum {l in K} V[k,l] <= Q[k] - 100*X[k];

subject to Upperbd_Sec {i in I}:
	S[i] - sum {j in I} U[i,j] <= (1+alp)*(c[i] + 100*W[i]);
subject to Upperbd_Ele {k in K}:  
	E[k] - sum {l in K} V[k,l] <= (1+bet)*(d[k] + 100*X[k]);

subject to Expan_Sec {i in I}:
	100*W[i] <= sig[i]-c[i];
subject to Expan_Ele {k in K}:
	100*X[k] <= tau[k]-d[k];

subject to Adjacent_Sec {i in I, j in I}:
	U[i,j] <= a[i,j]* sum {g in G} gam[g]*Y[j,g];
subject to Transfer_Sec {j in I}:
	sum {i in I} U[i,j] <= sum {g in G} gam[g]*Y[j,g];
subject to Focus_Sec {j in I, i in I:i<>j}:
	U[i,j] <= U[j,j];
#subject to Size_Sec {j in J}:
#	sum {g in G} Y[j,g] <= 1;

subject to Adjacent_Ele {k in K, l in K}:
	V[k,l] <= b[k,l]* sum{h in H} del[h]*Z[l,h];
subject to Transfer_Ele {l in K}:
	sum {k in K} V[k,l] <= sum{h in H} del[h]*Z[l,h];
subject to Focus_Ele {l in K, k in K:k<>l}:
	V[k,l] <= V[l,l];
#subject to Size_Ele {l in L}:
#	sum {h in H} Z[l,h] <= 1;

subject to Budget:
	sum {i in I} phi*W[i] + sum {k in K} lam*X[k] + sum {j in I, g in G} the[g]*Y[j,g] + sum {l in K,h in H} psi[h]*Z[l,h] <= Bud;
	
	