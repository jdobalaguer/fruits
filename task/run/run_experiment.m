
%% EXPERIMENT
try
    %% START
    % initialise psychtoolbox
    ptb_start;
    % show introduction screen
    screen_intro;
    
    %% TASK
    % task screen
    screen_task;
    % set task
    set_task;
    % do task
    do_task;
    
    %% END
    % show end screen
    screen_end;
    % close psychtoolbox
    ptb_stop;
    % clean
    data_clear;
    
catch err
    % close psychtoolbox
    ptb_stop;
    % save data
    data_error;
    % rethrow error
    rethrow(err);
end

%% ESCAPE
index.escape = 0;
