






% experiment
data.expt_subject(end+1,:)      = index.subject;
data.expt_task{end+1,:}         = trialstruct.expt_task;
data.expt_session(end+1,:)      = index.session;
data.expt_trial(end+1,:)        = index.trial;

% time
data.time_trigger(end+1,:)      = index.gs_trigger;        % this one is a timestamp
data.time_isi(end+1,:)          = trialstruct.time_isi;    % this one is a duration of ISI
data.time_sample(end+1,:)       = trialstruct.time_sample; % everything else is time since trigger
data.time_probe(end+1,:)        = trialstruct.time_probe;
data.time_response(end+1,:)     = trialstruct.time_response;
data.time_feedback(end+1,:)     = trialstruct.time_feedback;

% variables
data.vbxi_day(end+1,:)          = trialstruct.vbxi_day;
data.vbxi_image(end+1,:)        = trialstruct.vbxi_image;
data.vbxi_level(end+1,:)        = trialstruct.vbxi_level;
data.vbxi_file(end+1,:)         = trialstruct.vbxi_file;
data.vbxi_response(end+1,:)     = trialstruct.vbxi_response;

% response
data.resp_rt(end+1,:)           = trialstruct.resp_rt;
data.resp_response(end+1,:)     = trialstruct.resp_response;
data.resp_correct(end+1,:)      = trialstruct.resp_correct;
