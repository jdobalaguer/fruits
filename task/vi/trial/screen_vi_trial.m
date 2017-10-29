


%% Verbose
plot_verbose_trial;

%% Sample
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% Plot
plot_vi_sample;

% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_vi_sample;
trialstruct.time_sample = ptb.screen_time_this - index.gs_trigger;

% Flip
Screen(ptb.screen_w,'Flip');

% Wait
resp_wait;

%% Delay
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% Plot
plot_fixation;

% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_rs_delay;
trialstruct.time_sample = ptb.screen_time_this - index.gs_trigger;

% Flip
Screen(ptb.screen_w,'Flip');

% Wait
resp_wait;

%% Probe
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% Plot
plot_vi_probe;

% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_vi_probe;
trialstruct.time_probe = ptb.screen_time_this - index.gs_trigger;

% Flip
Screen(ptb.screen_w,'Flip');

% Response
gs = GetSecs();
while   gs < ptb.screen_time_next        && ... time
        isnan(trialstruct.resp_response) && ... response
        ~index.escape                       ... exit
        
    resp_vi_trial;
end

% Wait after response
resp_wait;

%% Response
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% Plot
plot_fixation;

% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_vi_response;
trialstruct.time_sample = ptb.screen_time_this - index.gs_trigger;

% Flip
Screen(ptb.screen_w,'Flip');

% Response
gs = GetSecs();
while   gs < ptb.screen_time_next        && ... time
        isnan(trialstruct.resp_response) && ... response
        ~index.escape                       ... exit
        
    resp_vi_trial;
end

% No response
resp_vi_none;

% Wait after response
resp_wait;

%% Feedback

% Plot
plot_feedback;

% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this;
trialstruct.time_feedback = ptb.screen_time_this - index.gs_trigger;

%% Verbose
plot_verbose_feedback;

%% Clean
clear gs;
