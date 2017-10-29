
%% participant info
participant = struct();

if ~parameters.flag_debug
    participant.id = nan;
    while isnan(participant.id)
        participant.id = str2double(input('  Id : ','s'));
    end
    participant.age  = input('  Age:      ','s');
    participant.sex  = input('  Sex:      ','s');
    participant.hand = input('  Hand:     ','s');
else
    participant.id   = nan;
    participant.age  = '';
    participant.sex  = '';
    participant.hand = '';
end

% structure
participant.structure = cell(2,12);
switch (participant.id)
    case 1
        participant.structure = strcat('fruits',filesep(),{'star','cherry','apple','banana','watermelon','grapes','plum','mango','lemon','strawberry','peach','melon';...
                                                           'figs','olive','pineapple','kiwii','grapefruit','guava','avocado','pear','coconut','pomegranate','orange','lime'});
    otherwise % default case, also for debug
        participant.structure = strcat('fruits',filesep(),{'star','cherry','apple','banana','watermelon','grapes','plum','mango','lemon','strawberry','peach','melon';...
                                                           'figs','olive','pineapple','kiwii','grapefruit','guava','avocado','pear','coconut','pomegranate','orange','lime'});

end