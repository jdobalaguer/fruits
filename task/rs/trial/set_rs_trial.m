
% index and question
if ~index.resume
    index.trial  = index.trial + 1;
    rs           = struct_func(@vec_head,questions.rs);
    questions.rs = struct_func(@vec_tail,questions.rs);
else
    index.resume = 0;
    vi           = struct('day',  {data.vbxi_day(end,:)},...
                          'image',{data.vbxi_image(end,:)},...
                          'isi',  {data.time_isi(end,:)},...
                          'level',{data.vbxi_level(end,:)},...
                          'valid',{data.vbxi_response(end,:)});
end

% trial struct
trialstruct = struct();

% expt
trialstruct.expt_task       = 'rs';

% time
trialstruct.time_isi        = rs.isi;
trialstruct.time_sample     = nan;
trialstruct.time_probe      = nan;
trialstruct.time_response   = nan;
trialstruct.time_feedback   = nan;

% vbxi
trialstruct.vbxi_day        = rs.day;
trialstruct.vbxi_image      = rs.image;
trialstruct.vbxi_level      = rs.level;
trialstruct.vbxi_file       = arrayfun(@(d,i)participant.structure{d,i},trialstruct.vbxi_day,trialstruct.vbxi_image,'UniformOutput',false);
trialstruct.vbxi_response   = rs.match;

% pad out
trialstruct.vbxi_day(end+1)    = nan;
trialstruct.vbxi_image(end+1)  = nan;
trialstruct.vbxi_file{end+1}   = '';

% response
trialstruct.resp_rt         = nan;
trialstruct.resp_response   = nan;
trialstruct.resp_correct    = nan;
