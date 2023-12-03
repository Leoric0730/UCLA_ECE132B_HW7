close all;
clear;
clc; 

% The simulation of M/M/2/3 queueing system (QS)   
%% Global parameters
time_next_event(1:3) = 0;   % Events = {arrivals, departures}
num_events = 3;             % arrival and departure events for a M/M/2/3 Q
mu = 5; % TODO: Modify it to the correct value
mean_service_time = 1/mu;   % Average message service time [sec]; 
limit_customers = 100000;   % Maximum number of messages that arrive to the system (whether admitted or blocked) which induce termination of the simulation run

lambda = 9; %TODO: Modify it to the correct value
rho = lambda/mu;
mean_interarrival = 1/lambda; % Average interarrival time between message arrivals [sec];
Qlim = 1; % system is blocked if the system is full 
%% Initialize the system's parameters
initialize;

%% Main
while total_of_customers-1 < limit_customers    % checks that the max number of served messages is below the specified limit and calls the timing( ) routine.
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
        case 3
            depart();
    end
    %total_of_customers
end
% report
report;

