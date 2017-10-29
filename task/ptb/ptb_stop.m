 
%% Time
ptb.time_stop = GetSecs;

%% Textures
arrayfun(@(t)Screen('Close',t),ptb.texture,'UniformOutput',false);

%% Screen

% mouse
ShowCursor;

% keyboard
ListenChar(0);

% remove anything pressed during the experiment (?)
FlushEvents;

% window
Screen('CloseAll');

%% Audio
if parameters.flag_audio
    % stop sound
    try %#ok<TRYNC>
        PsychPortAudio('Close', ptb.audio.port);
        ptb.audio.port = [];
    end
end

%% IO ports
if parameters.flag_ioport
    clear io64;
    %clear ptb.io.ioObj;
end

