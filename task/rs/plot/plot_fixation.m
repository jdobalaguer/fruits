
%% Plot fixation

width  = min(ptb.screen_drect)/20;
height = min(ptb.screen_drect)/100;

% horizontal
Screen( ptb.screen_w,                                        ... window
        'FillRect',                                          ... draw texture
        parameters.screen_bk_color,                          ... 
        [ptb.screen_center - 0.5 * [width,height],           ... rectangle
         ptb.screen_center + 0.5 * [width,height]]           ...
    );

% vertical
Screen( ptb.screen_w,                                        ... window
        'FillRect',                                          ... draw texture
        parameters.screen_bk_color,                          ... 
        [ptb.screen_center - 0.5 * [height,width],           ... rectangle
         ptb.screen_center + 0.5 * [height,width]]           ...
    );

%% Clean
clear width height;
