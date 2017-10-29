
function s = struct_filter(s,ii)
    %% s = STRUCT_FILTER(s,ii)
    % apply a vector-like index within each field of a struct
    % s  : struct
    % ii : index
    
    %% function
    u_field = fieldnames(s);
    n_field = length(u_field);
    for i_field = 1:n_field
        field = u_field{i_field};
        try 
            s.(field) = s.(field)(ii,:); %TODO generalise to n-dims>2
        catch
            warning('field "%s" not filtered!',field);
        end
    end
end
