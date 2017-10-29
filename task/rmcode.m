
function rmcode()
    %% function
    path = fullfile(pwd,'task');
    path = genpath(path);
    path = strsplit(path,':')';
    path(contains(path,'assets')) = [];
    path = strjoin(path,':');
    rmpath(path);
end
