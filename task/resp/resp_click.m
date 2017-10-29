
%% Press click

% press
while ~index.escape
    [down,~,code] = KbCheck();
    if down && sum(code)==1
        switch find(code)
            % escape
            case num2cell(KbName(parameters.key_escape))
                index.escape     = 1;
            % return
            case num2cell(KbName(parameters.key_return))
                break;
        end
    end
end

%% Release click
% release
down = true;
while down
    [down,~,~] = KbCheck();
end

%% Clean
clear down code;
