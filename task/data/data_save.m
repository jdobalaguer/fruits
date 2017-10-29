if parameters.flag_debug; return; end
if index.escape; return; end

if ~exist(fileparts(participant.filename_data),'dir')
    mkdir(fileparts(participant.filename_data));
end

save(participant.filename_data,'data', 'parameters', 'participant', 'ptb', 'index', 'questions');
