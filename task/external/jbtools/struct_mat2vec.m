
function z = struct_mat2vec(s)
    %% z = STRUCT_MAT2VEC(s)
    % reshape values of each field as columns
    
    %% function
    z = struct_func(@mat2vec,s);
end
