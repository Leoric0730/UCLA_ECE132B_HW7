    %% initialize
    sim_time = 0;               % Initialize simulation time  
    
    % Initialize the state variables
    server_status = 0;          % idle status = 0; busy status = 1
    num_in_s = 0;               % number of customers in the system (or system size, denoted as X)
    num_in_q = 0;               % number of customers in the queue (wait size, denoted as Q)
    time_last_event = 0;        % the time of the latest recorded event
    

    % Initialize the statistical counters.
    num_waiting_custs = 0;      % cumulative number of customers that have experienced waiting time up to this time
    num_delay_custs = 0;        % cumulative number of customers that have experienced delay time up to this time
    total_of_customers = 0;     % Cumulative sum of the waiting times experience by all customers served by the system up to this time
    total_of_waits = 0;         % Cumulative sum of the waiting times experience by all customers served by the system up to this time
    total_of_delays = 0;        % Cumulative sum of the delay times experience by all customers served by the system up to this time
    area_num_in_s = 0;          % cumulative system size area up to this time
    area_num_in_q = 0;          % cumulative queue size area up to this time
    area_server_status = 0;     % cumulative service area up to this time
    num_block_custs = 0;        % cumulative number of packet blocked
    % Initialize event list.  Since no customers are present,
    % the departure (service completion) event is eliminated from consideration.
    time_next_event(1) = sim_time + exprnd(mean_interarrival);  % time of next arrival event
    % Matlab defines exprnd(mean_interarrival) = exponentially distributed RV with this specified mean
    time_next_event(2) = 1.0e+30;                                  % time of next departure event, 1e30 denotes infinite
    time_next_event(3) = 1.0e+30;                                  % time of next departure event 
                                  