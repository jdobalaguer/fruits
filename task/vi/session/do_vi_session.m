    
%% SESSION
while ~index.endsession && ~index.escape
    %% TRIAL
    % set trial
    set_vi_trial;
    % do trial
    do_vi_trial;
    
    %% END OF SESSION
    set_vi_endofsession;
end

%% SAVE
% save data
data_save;
