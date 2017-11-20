if parameters.flag_debug;    index.gs_trigger = GetSecs(); return; end
if ~parameters.flag_trigger; index.gs_trigger = GetSecs(); return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);
Screen(ptb.screen_w, 'TextFont',  parameters.screen_fontname);
Screen(ptb.screen_w, 'TextSize',  parameters.screen_fontsize);
Screen(ptb.screen_w, 'TextColor', parameters.screen_fontcolor);
Screen(ptb.screen_w, 'TextBackgroundColor', parameters.screen_fontbgcolor);

%% Plot
switch parameters.task_sessions{index.session}
    case 'vi'
        DrawFormattedText(ptb.screen_w,'Valido?','center',ptb.screen_center(2)-0.75 * parameters.screen_fontsize,parameters.screen_fontcolor);
    case 'rs'
        DrawFormattedText(ptb.screen_w,'Mismo dia?','center',ptb.screen_center(2)-0.75 * parameters.screen_fontsize,parameters.screen_fontcolor);
    otherwise
        error('screen_trigger: error. session doesnt exist');
end

DrawFormattedText(ptb.screen_w,'Esperando trigger ...','center',ptb.screen_center(2)+0.75 * parameters.screen_fontsize,parameters.screen_triggercolor);

%% Time
ptb.screen_time_this = GetSecs;
ptb.screen_time_next = ptb.screen_time_this;

%% Flip
Screen(ptb.screen_w,'Flip');

%% Wait
resp_trigger;
