
function x = nan2zero(x)
    %% x = NAN2ZERO(x)
    % replace all nans with zeros
    
    %% function
    x(isnan(x(:))) = 0;
end
    