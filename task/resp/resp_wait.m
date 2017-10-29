
%% Wait or escape
while ~index.escape && (GetSecs < ptb.screen_time_next)
    [down,~,code] = KbCheck();
    if down && sum(code)==1
        switch find(code)
            % escape
            case num2cell(KbName(parameters.key_escape))
                index.escape     = 1;
        end
    end
end

%% Clean
clear down code;
