time_next_event(1) = sim_time + exprnd(mean_interarrival);
num_in_s = num_in_s + 1;
time_arrival_system(num_in_s) = sim_time;       % time arrival system (i) = time of arrival of message-i
                                                % time arrival system (num_in_s) = time of arrival of the last message to arrive
total_of_customers = total_of_customers + 1;

if server_status == 2                           % both server busy is 2 ,1 busy is 1 and idle is 0                                              
    % Check to see whether queue limit is reached 
    if num_in_q >= Qlim
        num_in_s = num_in_s - 1;
        num_block_custs = num_block_custs + 1;
        display(['Message blocked, cannot enter the queue. Overflow occured at time' num2str(sim_time)]);
        return; % The queue limit has been reached, so stop the simulation
    else
        num_in_q = num_in_q + 1;                      
        time_arrival_queue(num_in_q) = sim_time;                         
    end
else 
    % server_status == idle (0 for both idle, 1 for only one idle)
    % Server is idle, so arriving customer has a delay of zero.
    % The following two statements are for program clarity and
    % do not affect the results of the simulation.
    if server_status == 1 || server_status == 0 
        wait_time = 0;
        total_of_waits = total_of_waits + wait_time;
    % Increment the number of customers delayed, and make server busy.
    num_waiting_custs = num_waiting_custs + 1;
    server_status = server_status + 1; % server is busy
    
    %Schedule a departure (service completion).
    %Schedule departure because there's no msg in the system, the next
    %departure event will be this event itself.
        if (time_next_event(2) >= 1.0e+30)
            time_next_event(2) = sim_time + exprnd(mean_service_time);
        else 
            time_next_event(3) = sim_time + exprnd(mean_service_time);
        end
    end 
end