
% index and question
if ~index.resume
    index.trial  = index.trial + 1;
    vi           = struct_func(@vec_head,questions.vi);
    questions.vi = struct_func(@vec_tail,questions.vi);
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
trialstruct.expt_task       = 'vi';

% time
trialstruct.time_isi        = vi.isi;
trialstruct.time_sample     = nan;
trialstruct.time_probe      = nan;
trialstruct.time_response   = nan;
trialstruct.time_feedback   = nan;

trialstruct.vbxi_day        = vi.day;
trialstruct.vbxi_image      = vi.image;
trialstruct.vbxi_level      = vi.level;
trialstruct.vbxi_file       = arrayfun(@(d,i)participant.structure{d,i},trialstruct.vbxi_day,trialstruct.vbxi_image,'UniformOutput',false);
trialstruct.vbxi_response   = vi.valid;

% response
trialstruct.resp_rt         = nan;
trialstruct.resp_response   = nan;
trialstruct.resp_correct    = nan;
