if index.escape;  return; end

%% Background
Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Time
% calculate next times
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this + parameters.time_presession;

%% Plot
Screen(ptb.screen_w,'Flip');

%% Wait
resp_wait;
