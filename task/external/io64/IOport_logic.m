function [IO] = IOport_logic
% IOport_logic
% First part is left in for understanding the IO port logic but not really 
% needed since the "bitget" function in Matlab solves it all ... 
% 
% Miriam Klein-Flügge, July 2015

bits=[ 7   6  5  4  3 2 1 0]; 
pins=[11  10 12 13 15];      %pins map to bits this way
vals=[128 64 32 16  8 4 2 1];%2^bits
defs=[1    0  0  0  0 1 1 1];%default val;bits 2,1,0 are always on

% Mapping at FMRIB
trigger     = 10;           %scan trigger
buttons     = [11 12 13 15];%buttons 1-4 in this order (1 inverted, see defs)

% Calculate possible values of triggers
IO.trig = defs*vals' + vals(find(pins==trigger));
for bt=1:4
    % buttons can be with trigger on or off
    if defs(find(pins==buttons(bt))) == 0 %not inverted
        IO.buttons(bt,:)   = [defs*vals' + vals(find(pins==buttons(bt))) IO.trig + vals(find(pins==buttons(bt)))];
    elseif defs(find(pins==buttons(bt))) == 1
        IO.buttons(bt,:)   = [defs*vals' - vals(find(pins==buttons(bt))) IO.trig - vals(find(pins==buttons(bt)))];
    end
end

% Default value when all triggers are off
IO.def = defs*vals'; 

% A lot easier than the above: use bitget(trigger_val,1) to see if 
% e.g. the first bit is 0/1 independent of the other bits, can do for all 8
% bits obviously
IO.trigBit = bits(find(pins==trigger))+1;
for bt=1:4
    IO.buttonBit(bt) = bits(find(pins==buttons(bt)))+1;
end