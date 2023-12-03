# ECE132B_HW7

M/M/m/N queueing system(QS) simulation
Please generate at least 100000 events (messages) to simulate M/M/1 queueing system (QS). The inter-arrival rate λ and service rate μ are set as 4 messages/sec and 5 messages/sec, respectively. You may use the sample code provided for simulating Problem 1 (a folder containing Matlab scripts is uploaded in Bruinlearn in the same week as the homework).
(a) Please compare the simulation results of E[X], E[Q], E[D], E[W] with corre- sponding analytical results.
(b) Pleasefixμ=5msg/secandplotthesimulationresultsofE[X],E[Q],E[D],E[W] versus the traffic intensity ρ, such that ρ = {0.1i | i = 1,...,9}. Plot the ana- lytically computed values of E[X],E[Q],E[D],E[W], next to the corresponding results obtained through the simulation.
– Note: For the analytical values, please refer to the formulas included in the Class Notes.

## Analytical Result:

$$
E[D]=\frac{E[x]}{\lambda_D}\\
E[X]=\sum_{j=0}^NjP(j) \\
E[W]=E[D]-\frac{1}{\mu}\\
E[Q]=\lambda_DE[W]\\
$$
