# MUSIC
A simple code for Multple Signal Classification (MUSIC). 
Input arguments are as follows:
YY = Signal snapshots (including AWGN noise)
ZC = Parameter space matrix (In case of DoA Estimation, ZC is the set of array steering vector)
u = Number of features (In case of DoA Estimation, u is the number of complex sinusoids)

#root_MUSIC
root-MUSIC is an innovative way of reducing computational overhead of conventional MUSIC algorithm. Instead of searching peaks in pseudospectrum, root-MUSIC formulates a polynomial and evaluates it along unit circle. Further computational expense can be reduced considering the fact that the roots of the aforementioned polynomial occur in reciprocal pairs. 

Input arguments are as follows:
YY = Snapshots of signals
k = number of features
B = number of signal blocks (alternatively can be interpreted as signal sampled from different scenarios)
