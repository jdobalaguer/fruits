
if ~parameters.flag_debug
    participant.filename_data  = fullfile('data',sprintf('data_%03i.mat', index.subject));
    participant.filename_error = fullfile('data',sprintf('error_%03i.mat',index.subject));
    if exist(participant.filename_data,'file')
        error('set_participant: error. data file already exists');
    end
    if exist(participant.filename_error,'file')
        error('set_participant: error. error file already exists');
    end
end
