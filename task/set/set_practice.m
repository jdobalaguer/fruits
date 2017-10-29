

%% set training
if parameters.flag_practice
    parameters.task_sessions   = parameters.task_sessions(1:2);
    parameters.task_nbsessions = numel(parameters.task_sessions);
    questions.rs = struct_filter(questions.rs,1:parameters.task_nbtrials_rs);
    questions.vi = struct_filter(questions.vi,1:parameters.task_nbtrials_vi);
end
