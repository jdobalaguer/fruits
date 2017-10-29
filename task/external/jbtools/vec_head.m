
function y = vec_head(x)
    %% [y] = VEC_HEAD(x)
    % keep the first [n] elements of a vector [x]
    % x : vector
    % n : scalar (default 1)
    
    %% function
    
    % assert
    n = 1;
    if n<0, n = size(x,1)+n; end
    y = x(1:n,:);
end
