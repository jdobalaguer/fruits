
function addcode()
    %% function
    path = fullfile(pwd,'task');
    path = genpath(path);
    
    switch computer()
        case {'PCWIN','PCWIN64'}, delimiter = ';C:'; % windows
        case {'MACI64'},          delimiter = ':';   % mac
        case {'GLNXA64'},         delimiter = ':';   % linux
    end
    path = strsplit(path,delimiter)';
    path(~cellfun(@isempty,strfind(path,'assets'))) = []; %#ok<STRCLFH>
    path = reshape(path,[1,numel(path)]);
    path = strjoin(path,delimiter);
    addpath(path);
end
