
index = struct();

%% index

% subject
index.subject = participant.id;

% index
index.session    = 0;
index.trial      = 0;

% end
index.endtask    = 0;
index.endsession = 0;

% escape / resume
index.escape     = 0;
index.resume     = 0;

% trigger
index.gs_trigger = nan;
