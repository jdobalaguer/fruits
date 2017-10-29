
ptb = struct();

%% Preferences
% verbosity
Screen('Preference', 'Verbosity',0);
Screen('Preference', 'SuppressAllWarnings', 1);
% skip tests
if parameters.flag_debug, Screen('Preference', 'SkipSyncTests', 1);
else,                     Screen('Preference', 'SkipSyncTests', 1);
end

%% Time
ptb.time_start = GetSecs;

%% Screen
% open window
tmp_s = Screen('Screens');
tmp_s = tmp_s(end);
[tmp_w, tmp_r] = Screen('OpenWindow',               ...
                            tmp_s,                  ... screen
                            [],                     ... color
                            parameters.screen_rect, ... rectangle
                            32,                     ... pixel size
                            2                       ... nb of buffers
                        );

% values
ptb.screen_w            = tmp_w;
ptb.screen_rect         = tmp_r;
ptb.screen_drect        = [(ptb.screen_rect(3)-ptb.screen_rect(1)) , (ptb.screen_rect(4)-ptb.screen_rect(2))];
ptb.screen_center       = [ptb.screen_rect(1) , ptb.screen_rect(2)] + .5*ptb.screen_drect;
ptb.screen_bg_color     = parameters.screen_bg_color;
ptb.screen_time_this    = 0;
ptb.screen_time_next    = 0;
ptb.screen_fps          = Screen('FrameRate',ptb.screen_w);

% textures
Screen('Preference', 'TextAlphaBlending', 1);
Screen(ptb.screen_w,'BlendFunction',GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

%% Mouse
HideCursor;

%% Keyboard
%ListenChar(-1); % Disable key output to Matlab command window
KbName('UnifyKeyNames');

%% Audio
if parameters.flag_audio
    % set parameters
    ptb.audio.freqlow  = 2500;
    ptb.audio.freqhigh = 7500;
    ptb.audio.duration  = 0.1;

    % initialise port
    PsychPortAudio('Verbosity',0);
    InitializePsychSound;
    try
        ptb.audio.port = PsychPortAudio('Open', [], [], 1, [], 1);
    catch
        psychlasterror('reset');
        ptb.audio.port = PsychPortAudio('Open', [], [], 1, [], 1);
    end
    tmp_s = PsychPortAudio('GetStatus',ptb.audio.port);
    ptb.audio.sampling = tmp_s.SampleRate;
end

%% Textures
ptb.texture = nan(size(participant.structure));
for i_texture = 1:numel(participant.structure)
    tmp_file = fullfile(fileparts(which('main')),'assets','png',[participant.structure{i_texture},'.png']);
    [tmp_image,~,tmp_alpha] = imread(tmp_file);

    % replace transparency with white background
    tmp_a = repmat(double(tmp_alpha)./255,[1,1,3]);
    tmp_image = uint8((tmp_a).*double(tmp_image) + (1-tmp_a).*255);
    tmp_alpha(tmp_alpha>0) = 255;

    % create texture
    ptb.texture(i_texture) = Screen('MakeTexture', ptb.screen_w, cat(3,tmp_image,tmp_alpha));
end

%% IO ports
if parameters.flag_ioport
    [ptb.io.ioObj, ptb.io.status] = IOport_open();
    [ptb.io.IO] = IOport_logic();
    ptb.io.address = hex2dec('379');
end

%% Clean
data_clear;
