
%% Plot sample

image_size = min(ptb.screen_drect)/4;
        
Screen( ptb.screen_w,                                           ... window
        'DrawTexture',                                          ... draw texture
        ptb.texture(trialstruct.vbxi_day(2),trialstruct.vbxi_image(2)), ...
        [],                                                     ... source rectangle
        [ptb.screen_center - 0.5 * image_size,                  ...
         ptb.screen_center + 0.5 * image_size]                  ...
    );

%% Clean
clear image_size;
