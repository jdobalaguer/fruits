if index.escape; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Plot
plot_fixation;

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + trialstruct.time_isi;

%% Flip
Screen(ptb.screen_w,'Flip');

%% Wait
resp_wait;
