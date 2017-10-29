function [tKeyPress,keyCode] = IOWaitButton(stimulus,IO,waitTime,ioObj,address)
% Wait for button press and return time and keyCode of the pressed button
% Stimulus stays on for [waitTime] even after button press.
%
%   INPUT
%   [waitTime]: duration of response window
%   [stimulus]: 4 dimensional image matrix.
%
%   OUTPUT
%    [tKeyPress]: reaction time
%    [keyCode]: array containing 1 at index of pressed button
% 
%   AUTHORS
%       Miriam Klein-Flügge @FMRIB, July 2015
%       modified by Janto Oellrich, November 2015

% initialize
keyCode     = zeros(1,size(IO.buttons,1));
tKeyPress   = -1;
tStart = GetSecs;

% wait for keypress (trigger onset) & save time of keypress
button  = -1;
byte_in = -1;

while (GetSecs-tStart)<waitTime %& button == -1
    
    % listen
    byte_in=io64(ioObj,address);
    
    % present image
    Screen(window,'PutImage',stimulus)
    
    % add fixation cross
    %             Screen('DrawLines', window, allCoords,...
    %                 lineWidthPix, white, [xCenter yCenter], 1);
    
    Screen(window,'Flip');
    
    % remember first one is inverted!
    if ~bitget(byte_in,IO.buttonBit(1)) | any(bitget(byte_in,IO.buttonBit(2:end)))
        tKeyPress = GetSecs-tStart;
        if ~bitget(byte_in,IO.buttonBit(1))
            button = 1;
        elseif bitget(byte_in,IO.buttonBit(2))
            button = 2;
        elseif bitget(byte_in,IO.buttonBit(3))
            button = 3;
        else
            button = 4;
        end
    end
    WaitSecs(0.005);
end

if button~=-1
    keyCode(button) = 1;
end

% wait for end of trigger
byte_in=io64(ioObj,address);
while ~bitget(byte_in,IO.buttonBit(1)) | any(bitget(byte_in,IO.buttonBit(2:end)))
    byte_in=io64(ioObj,address);
end