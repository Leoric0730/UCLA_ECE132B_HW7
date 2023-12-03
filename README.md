# ECE132B_HW7

M/M/m/N queueing system(QS) simulation

Problem 1 M/M/1

Please generate at least 100000 events (messages) to simulate M/M/1 queueing system (QS). The inter-arrival rate λ and service rate μ are set as 4 messages/sec and 5 messages/sec, respectively. You may use the sample code provided for simulating Problem 1 (a folder containing Matlab scripts is uploaded in Bruinlearn in the same week as the homework).
(a) Please compare the simulation results of E[X], E[Q], E[D], E[W] with corre- sponding analytical results.
(b) Pleasefixμ=5msg/secandplotthesimulationresultsofE[X],E[Q],E[D],E[W] versus the traffic intensity ρ, such that ρ = {0.1i | i = 1,...,9}. Plot the ana- lytically computed values of E[X],E[Q],E[D],E[W], next to the corresponding results obtained through the simulation.
– Note: For the analytical values, please refer to the formulas included in the Class Notes.

## Analytical Result:


$$
\rho=\frac{\lambda}{\mu}；<br>
\lambda_D=\lambda; <br>
E[D]=\frac{E[x]}{\lambda_D}=\frac{1}{\mu(1-\rho)}；<br>
E[X]=\sum_{j=0}^\infty jP(j)=\frac{\rho}{1-\rho}； <br>
E[W]=E[D]-\frac{1}{\mu}=\frac{\rho}{\mu(1-\rho)}；<br>
E[Q]=\lambda_DE[W]=\frac{\rho^2}{1-\rho}；<br>
$$

Problem 2 M/M/2/3

Consider a central exchange switch in a telephone system of a small organization that provides queueing facility for storing one waiting call. Arriving calls that find the system to be blocked are assumed lost. Assume the switch to be served by m = 2 service channels (transmission trunks). Assume the switching system to be loaded by calls that arrive in accordance with a Poisson process at a rate of λ = 9 [calls/hour]. Assume the duration of each call to be an exponentially distributed random variable whose average value is equal to μ1 = 12 minutes.

• Note: The telephone system can be modeled as M/M/2/3 QS. Please simulate this queueing system by running it for at least 100000 message service events.

You may modify any part of the sample code provided for Problem 1 (for M/M/1) to write simulation code for the M/M/2/3 queueing system (e.g. using Matlab or C++).

• Note: For analytical performance results for this system, please refer to the Class Notes.

(a) Please compare the simulation results for E[X], E[Q], E[D], E[W] with their corresponding analytical results.

(b) Please compare the simulation results of the blocking probability of the system, Pb, with its corresponding analytically computed value.

## Analytical Result:

$$
E[D]=\frac{E[x]}{\lambda_D}；<br>
E[X]=\sum_{j=0}^NjP(j)； <br>
E[W]=E[D]-\frac{1}{\mu}；<br>
E[Q]=\lambda_DE[W]；<br>
$$
