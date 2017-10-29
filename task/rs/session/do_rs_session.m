    
%% SESSION
while ~index.endsession && ~index.escape
    %% TRIAL
    % set trial
    set_rs_trial;
    % do trial
    do_rs_trial;
    
    %% END OF SESSION
    set_rs_endofsession;
end

%% SAVE
% save data
data_save;
