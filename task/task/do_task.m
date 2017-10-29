
%% TASK
while ~index.endtask && ~index.escape
    %% SESSION
    % set session
    set_session;
    % screens
    screen_break;
    screen_trigger;
    screen_presession;
    % do session
    do_session;
    % screens
    screen_possession;
    
    %% END OF TASK
    set_endoftask;
end
