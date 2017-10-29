
function z = struct_func(varargin)
    %% z = STRUCT_FUNC(f,s1[,s2][,..])
    % f : function
    % s : struct(s)

    %% function
    
    % default
    f = varargin{1};
    s = varargin(2:end);
    
    % assert
    assert(~isempty(s),'struct_func: error. struct not defined');
    u = cellfun(@fieldnames,s,'UniformOutput',false);
    assert(isscalar(unique(cellfun(@numel,u))),    'struct_func: error. structs have different number of fields');
    assert(all(cellfun(@(t)all(strcmp(t,u{1})),u)),'struct_func: error. structs have different fields');
    u = u{1};
    z = struct();
    for i = 1:length(u)
        n = u{i};
        t = cellfun(@(s)s.(n),s,'UniformOutput',false);
        z.(n) = f(t{:});
    end
end
