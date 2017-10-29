if index.resume, return; end

% folder
if ~exist('data','dir'); mkdir('data'); end

% stru
data = struct();

% experiment
data.expt_subject    = zeros(0,1);
data.expt_task       = cell (0,1);
data.expt_session    = zeros(0,1);
data.expt_trial      = zeros(0,1);

% time
data.time_trigger    = zeros(0,1);
data.time_isi        = zeros(0,1);
data.time_sample     = zeros(0,1);
data.time_probe      = zeros(0,1);
data.time_response   = zeros(0,1);
data.time_feedback   = zeros(0,1);

% variables
data.vbxi_day        = zeros(0,3);
data.vbxi_image      = zeros(0,3);
data.vbxi_level      = zeros(0,3);
data.vbxi_file       = cell(0,3);
data.vbxi_response   = zeros(0,1);

% response
data.resp_rt        = zeros(0,1);
data.resp_response  = zeros(0,1);
data.resp_correct   = zeros(0,1);
