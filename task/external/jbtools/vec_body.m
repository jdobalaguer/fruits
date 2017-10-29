
function y = vec_body(x)
    %% [y] = VEC_BODY(x)
    % remove the first and last [n] elements from a vector [x]
    % x : vector
    % n : scalar (default 1)
    
    %% function
    
    % assert
    n = 1;
    y = x(n+1:end-n);
end
