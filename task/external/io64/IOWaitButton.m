function [tKeyPress,keyCode] = IOWaitButton(IO,waitTime,ioObj,address)
% Wait for button press and return time and keyCode of the pressed button
% For use within Psychtoolbox
% 
% Miriam Klein-Flügge @FMRIB, July 2015

keyCode     = zeros(1,size(IO.buttons,1));
tKeyPress   = -1;
tStart = GetSecs;
% wait for keypress (trigger onset) & save time of keypress
button  = -1;
byte_in = -1;
while button == -1 & (GetSecs-tStart)<waitTime
    byte_in=io64(ioObj,address);
    % remember first one is inverted!
    if ~bitget(byte_in,IO.buttonBit(1)) | any(bitget(byte_in,IO.buttonBit(2:end)))
        tKeyPress = (GetSecs-tStart);
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