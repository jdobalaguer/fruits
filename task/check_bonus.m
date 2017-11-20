
function check_bonus(data)
    %% CHECK_BONUS(data)
    % display the bonus obtained during the experiment

    %% function

    % max bonus
    max_bonus = 15.00;

    % means
    mean_vi = mean(data.resp_correct(strcmp(data.expt_task,'vi')));
    mean_rs = mean(data.resp_correct(strcmp(data.expt_task,'rs')));

    % compute bonus
    bonus = max_bonus * max(mean_vi + mean_rs - 1, 0);
    fprintf('Bonus : %.2f \n', bonus);
end
