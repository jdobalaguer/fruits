
parameters = struct();

%% flag
parameters.flag_verbose         = 1;
parameters.flag_debug           = 0;
parameters.flag_practice        = 0;
parameters.flag_trigger         = 1;
parameters.flag_jitter          = 1;
parameters.flag_ioport          = 0;
parameters.flag_audio           = 0;

%% task
parameters.task_sessions        = {'vi';'rs'};
% parameters.task_sessions        = {'rs';'vi'};
parameters.task_sessions        = repmat(parameters.task_sessions,[6,1]);
parameters.task_nbsessions      = numel(parameters.task_sessions);
parameters.task_nbtrials_rs     = 72;
parameters.task_nbtrials_vi     = 24;

%% keyboard
parameters.key_escape           = {'Escape','NonUS\|'};
parameters.key_return           = 'Return';
parameters.key_trigger          = 'T';
parameters.key_target           = 'H';
parameters.key_nontarget        = 'J';

%% time
parameters.time_presession      = 10.0;
parameters.time_possession      = 15.0;

parameters.time_vi_sample       =  1.0;
parameters.time_vi_delay        =  0.5;
parameters.time_vi_probe        =  1.0;
parameters.time_vi_response     =  2.0;
parameters.time_vi_isimin       =  1.0;
parameters.time_vi_isimax       =  5.0;

parameters.time_rs_sample       =  0.5;
parameters.time_rs_delay        =  0.5;
parameters.time_rs_probe        =  0.5;
parameters.time_rs_response     =  1.0;
parameters.time_rs_isimin       =  1.0;
parameters.time_rs_isimax       =  5.0;

if ~parameters.flag_jitter
    parameters.time_presession      =  0;
    parameters.time_possession      =  0;
    parameters.time_vi_isimin       =  0;
    parameters.time_vi_isimax       =  0;
    parameters.time_rs_isimin       =  0;
    parameters.time_rs_isimax       =  0;
    
    % make all times 0 seconds
    % parameters = struct_deep(parameters);
    % parameters.time = struct_func(@(~)0,struct_flat(parameters.time));
    % parameters = struct_flat(parameters);
end


%% screen
parameters.screen_rect          = [0,0,800,600];
parameters.screen_bg_color      = [192,192,192];
parameters.screen_bk_color      = [  0,  0,  0];
parameters.screen_triggercolor  = [128,128,128];
parameters.screen_fontcolor     = [  0,  0,  0];
parameters.screen_fontbgcolor   = [255,255,255,0];
parameters.screen_fontsize      = 36;
parameters.screen_fontname      = 'Helvetica';
