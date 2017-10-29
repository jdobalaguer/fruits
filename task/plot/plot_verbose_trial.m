
%% verbose
if parameters.flag_verbose
    fprintf('\n');
    fprintf('Trial    %d %d \n',index.session,index.trial);
    fprintf('Image    %d %d %d \n',trialstruct.vbxi_image);
    fprintf('Response %d \n',trialstruct.vbxi_response);
end
