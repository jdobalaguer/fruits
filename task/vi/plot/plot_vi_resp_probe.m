if ~parameters.flag_response, return; end

%% Plot transparent

% background
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% plot probe
plot_vi_probe;

% plot circle in the centre
image_size = min(ptb.screen_drect)/50;
Screen( ptb.screen_w,                                           ... window
        'FillOval',                                             ... draw circle
        parameters.screen_resp_color,                           ... color
        [ptb.screen_center - 0.5 * image_size,                  ... rectangle
         ptb.screen_center + 0.5 * image_size]                  ...
    );
clear image_size


% flip
Screen(ptb.screen_w,'Flip');

%% Wait
WaitSecs(0.05);

%% Plot normal

% background
Screen(ptb.screen_w, 'FillRect', ptb.screen_bg_color);

% plot probe
plot_vi_probe;

% flip
Screen(ptb.screen_w,'Flip');
