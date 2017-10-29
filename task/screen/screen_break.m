if parameters.flag_debug; return; end
if index.session < 2; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);
Screen(ptb.screen_w, 'TextFont',  parameters.screen_fontname);
Screen(ptb.screen_w, 'TextSize',  parameters.screen_fontsize);
Screen(ptb.screen_w, 'TextColor', parameters.screen_fontcolor);
Screen(ptb.screen_w, 'TextBackgroundColor', parameters.screen_fontbgcolor);

%% Plot
DrawFormattedText(ptb.screen_w,'Break','center','center');

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this;

%% Flip
Screen(ptb.screen_w,'Flip');

%% Wait
resp_click;
