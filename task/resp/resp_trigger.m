
%% Read trigger
while ~index.escape && isnan(index.gs_trigger)
    
    % get secs
    gs = GetSecs();
    
    % read port
    if parameters.flag_ioport
        byte_in = io64(ptb.io.ioObj,ptb.io.address);
        if bitget(byte_in,ptb.io.IO.trigBit)
            index.gs_trigger = gs;
            break;
        end
        clear byte_in;
    end
    
    % read keyboard
    [down,~,code] = KbCheck();
    if down && sum(code)==1
        switch find(code)
            % escape
            case num2cell(KbName(parameters.key_escape))
                index.escape     = 1;
            % trigger
            case num2cell(KbName(parameters.key_trigger))
                index.gs_trigger = gs;
                break;
        end
    end
    
    % wait
    WaitSecs(0.005);
end

%% Clean
clear gs;
