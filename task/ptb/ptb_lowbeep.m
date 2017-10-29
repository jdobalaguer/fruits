if index.escape; return; end
if ~parameters.flag_audio, return; end

% create pitch array
tmp_iymax = round(ptb.audio.duration*ptb.audio.sampling);
tmp_y = sin(linspace(0,ptb.audio.duration*ptb.audio.freqlow,tmp_iymax));

% start the audioport
PsychPortAudio('FillBuffer',ptb.audio.port,tmp_y);
PsychPortAudio('Start',ptb.audio.port);

% clean
clear tmp_iymax tmp_y;