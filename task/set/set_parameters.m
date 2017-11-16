
parameters = struct();

%% flag
parameters.flag_verbose         = 0;
parameters.flag_debug           = 0;
parameters.flag_practice        = 1; %0;
parameters.flag_trigger         = 1;
parameters.flag_jitter          = 1;
parameters.flag_response        = 1;
parameters.flag_ioport          = 0; %1;
parameters.flag_audio           = 0;

%% task
parameters.task_sessions        = {'vi';'rs'};
parameters.task_sessions        = repmat(parameters.task_sessions,[3,1]);
parameters.task_nbsessions      = numel(parameters.task_sessions);
parameters.task_nbtrials_rs     = 144;
parameters.task_nbtrials_vi     =  48;

%% keyboard
switch computer()
    case {'PCWIN','PCWIN64'}, key = 'Escape';  % windows
    case {'MACI64'},          key = 'NonUS\|'; % mac
    case {'GLNXA64'},         key = 'Escape';  % linux
end
parameters.key_escape           = {key};
parameters.key_return           = 'Return';
parameters.key_trigger          = 'T';
parameters.key_target           = 'H';
parameters.key_nontarget        = 'J';
clear key;

%% time
parameters.time_presession      = 10.0;
parameters.time_possession      = 15.0;

parameters.time_vi_sample       =  1.0;
parameters.time_vi_delay        =  2.0;
parameters.time_vi_probe        =  1.0;
parameters.time_vi_response     =  2.0;
parameters.time_vi_isimin       =  0.0;
parameters.time_vi_isimax       =  3.0;

parameters.time_rs_sample       =  0.5;
parameters.time_rs_delay        =  0.5;
parameters.time_rs_probe        =  0.5;
parameters.time_rs_response     =  2.0;
parameters.time_rs_isimin       =  0.0;
parameters.time_rs_isimax       =  4.0;

if ~parameters.flag_jitter
    parameters.time_presession      =  0;
    parameters.time_possession      =  0;
    parameters.time_vi_isimin       =  0;
    parameters.time_vi_isimax       =  0;
    parameters.time_rs_isimin       =  0;
    parameters.time_rs_isimax       =  0;
    
    parameters.time_vi_sample       =  0;
    parameters.time_vi_delay        =  0;
    parameters.time_vi_probe        =  0;
    parameters.time_vi_response     =  0;
    parameters.time_rs_sample       =  0;
    parameters.time_rs_delay        =  0;
    parameters.time_rs_probe        =  0;
    parameters.time_rs_response     =  0;
end

%% screen
parameters.screen_rect          = []; %[0,0,800,600];%
parameters.screen_bg_color      = [192,192,192];
parameters.screen_bk_color      = [  0,  0,  0];
parameters.screen_resp_color    = [100,100,255];
parameters.screen_triggercolor  = [128,128,128];
parameters.screen_fontcolor     = [  0,  0,  0];
parameters.screen_fontbgcolor   = [255,255,255,0];
parameters.screen_fontsize      = 36;
parameters.screen_fontname      = 'Helvetica';
