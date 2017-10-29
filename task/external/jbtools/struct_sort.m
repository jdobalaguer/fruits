
function ret = struct_sort(s)
    %% ret = STRUCT_SORT(s)
    % sort fields
  
    %% function
    u_field = sort(fieldnames(s));
    nb_fields = length(u_field);
    
    ret = struct();
    for i_field = 1:nb_fields
        this_field = u_field{i_field};
        ret.(this_field) = s.(this_field);
    end
end
