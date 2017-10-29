
%% task-dependent session
switch parameters.task_sessions{index.session}
    case 'vi'
        do_vi_session;
    case 'rs'
        do_rs_session;
    otherwise
        error('do_session: error. session doesnt exist');
end

