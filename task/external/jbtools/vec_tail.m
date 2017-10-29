
function y = vec_tail(x)
    %% [y] = VEC_TAIL(x)
    % remove the first [n] elements from a vector [x]
    % x : vector
    % n : scalar (default 1)
    
    %% function
    
    % assert
    n = 1;
    if n<0, n = size(x,1)+n; end
    y = x(n+1:end,:);
end
