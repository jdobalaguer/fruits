%{
    notes:
        requires MATLAB R2014a
        requires PsychToolbox (http://psychtoolbox.org/HomePage)
        optional IO64 library for windows (http://apps.usd.edu/coglab/psyc770/IO64.html)
    instructions:
        >> main;    % run task from beginning
        >> resume;  % or resume it
%}

%% CHECK
if ~strcmp(input('clear all and start? ... ','s'),'yes'), return; end
clear('variables');

%% SET
set_random;
set_parameters;
set_participant;
set_index;
set_filenames;
set_questions;
set_practice;

%% EXPERIMENT
run_experiment;
