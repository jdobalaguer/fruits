if parameters.flag_debug; return; end
 
try
    save(participant.filename_error);
catch error_of_error
    fprintf('data_error: warning. %s\n', error_of_error.message);
end