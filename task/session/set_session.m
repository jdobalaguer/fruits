
%% index
if ~index.resume
    index.session       = index.session + 1;
    index.trial         = 0;
    index.endsession    = 0;
end
index.gs_trigger    = nan;

%% task-dependent settings
switch parameters.task_sessions{index.session}
    case 'vi'
        set_vi_session;
    case 'rs'
        set_rs_session;
    otherwise
        error('set_session: error. session doesnt exist');
end

