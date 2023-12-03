num_in_s = num_in_s - 1;
delay_time = sim_time - time_arrival_system(1);         % delay experienced by the departing message
                                                        % time_arrival_system(1) identifies the time of arrival of the head-of-the-line (HOL) message.
total_of_delays = total_of_delays + delay_time;
num_delay_custs = num_delay_custs + 1;  

% push up message arrival times in the array so that the HOL message arrival time is at position 1
for k = 1:num_in_s
    time_arrival_system(k) = time_arrival_system(k+1);
end

if num_in_q == 0
    % The queue is empty so make the server idle and eliminate the
    % departure (service completion) event from consideration.
    if server_status == 2
        server_status = 1;
    else                % service type is 1.
        server_status = 0;
    end
    time_next_event(next_event_type) = 1.0e+30;
else
    % The queue is nonempty, so decrement the number of customers in queue.
    num_in_q = num_in_q - 1;
    
    % Compute the delay of the customer who is beginning service and update
    % the total delay accumulator.
    wait_time = sim_time - time_arrival_queue(1);
    total_of_waits = total_of_waits + wait_time;
    
    % Increment the number of customers delayed and schedule next departure.
    % We schedule departure because the next message in the queue is in
    % service, so the next_event(2) will be its departure time.
    num_waiting_custs = num_waiting_custs + 1;
    time_next_event(next_event_type) = sim_time + exprnd(mean_service_time);
    
    % Move each customer in queue (if any) up one place.
    for k = 1:num_in_q
        time_arrival_queue(k) = time_arrival_queue(k+1);
    end 
end




