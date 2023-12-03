close all;
clear;
clc; 

% The simulation of M/M/1 queueing system (QS)   
% %% Global parameters
time_next_event(1:2) = 0;   % Events = {arrivals, departures}
num_events = 2;             % arrival and departure events for a G/G/1 QS

mu = 5; % TODO: Modify it to the correct value
mean_service_time = 1/mu;      % Average message service time [sec]; 
limit_customers = 100000;      % Maximum number of messages that arrive to the system (whether admitted or blocked) which induce termination of the simulation run
Q_LIMIT = 1e30;  % The simulation program is terminated if the number of stored (in queue) messages exceeds this level
% 1e30 denotes a high number (taken as infinity)

for m = 1:9 
lambda = 0.5*m; %TODO: Modify it to the correct value
rho = lambda/mu;
mean_interarrival = 1/lambda; % Average interarrival time between message arrivals [sec];
% %% Initialize the system's parameters
initialize;

% %% Main
while total_of_customers -1 < limit_customers    % checks that the max number of served messages is below the specified limit and calls the timing( ) routine.
    % Also include termination conditions that involve maximum simulation run time, queue-size limits.
    % timing: Determines the next event type and updates the current simulation time
    timing;
    
    % update_time_avg_stats
    update_time_avg_stats;
    switch next_event_type
        case 1
            arrive();            
        case 2
            depart();
    end
    %total_of_customers
end
% report
% report;
meanx_analytical(m) = rho/(1-rho); meanx_sim(m) = area_num_in_s/sim_time;
meanq_analytical(m) = rho^2/(1-rho); meanq_sim(m) = area_num_in_q /sim_time;
meanD_analytical(m) = 1/(mu*(1-rho)); meanD_sim(m) = total_of_delays/num_delay_custs;
meanW_analytical(m) = rho/(mu*(1-rho)); meanW_sim(m) = total_of_waits/num_waiting_custs;
ro(m) = rho;
end
figure();
plot(ro,meanx_analytical,"Marker",".", 'MarkerFaceColor', 'red'); hold on;
plot(ro,meanq_analytical,"Marker",".", 'MarkerFaceColor', 'red');
plot(ro,meanD_analytical,"Marker",".", 'MarkerFaceColor', 'red');
plot(ro,meanW_analytical,"Marker",".", 'MarkerFaceColor', 'red');
plot(ro,meanx_sim,"Marker",".", 'MarkerFaceColor', 'blue');
plot(ro,meanq_sim,"Marker",".", 'MarkerFaceColor', 'blue');
plot(ro,meanD_sim,"Marker",".", 'MarkerFaceColor', 'blue');
plot(ro,meanW_sim,"Marker",".", 'MarkerFaceColor', 'blue');
xlabel('rho vector'); ylabel('values');
legend('E[X]_ana', 'E[Q]_ana', 'E[D]_ana', 'E[W]_ana', 'E[X]_sim', 'E[Q]_sim', 'E[D]_sim', 'E[W]_sim');
hold off; 