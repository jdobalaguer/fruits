
function y = shuffle(x)
    %% y = shuffle(x)
    % shuffle a vector
    
    %% function
    y = x(randperm(length(x)));
    y = reshape(y,size(x));
end
