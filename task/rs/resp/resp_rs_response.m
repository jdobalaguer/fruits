
%% Get secs
gs = GetSecs();

%% Read port
if isnan(trialstruct.resp_response) && parameters.flag_ioport
    byte_in = io64(ptb.io.ioObj,ptb.io.address);
    if     ~bitget(byte_in,ptb.io.IO.buttonBit(1))
        trialstruct.resp_rt         = (gs - index.gs_trigger) - trialstruct.time_probe;
        trialstruct.resp_response   = 1;
        trialstruct.resp_correct    = (trialstruct.resp_response == trialstruct.vbxi_response);
        plot_rs_resp_response;
    elseif  bitget(byte_in,ptb.io.IO.buttonBit(2))
        trialstruct.resp_rt         = (gs - index.gs_trigger) - trialstruct.time_probe;
        trialstruct.resp_response   = 0;
        trialstruct.resp_correct    = (trialstruct.resp_response == trialstruct.vbxi_response);
        plot_rs_resp_response;
    end
    % clean
    clear byte_in;
end
    
%% Read keyboard
[down,~,code] = KbCheck();
if isnan(trialstruct.resp_response) && down && sum(code)==1 && find(code) 
    code = find(code);
    switch code
        case num2cell(KbName(parameters.key_escape))
            index.escape     = 1;
            fprintf('Exit forced by user.\n');
        case num2cell(KbName(parameters.key_target))
            trialstruct.resp_rt         = (gs - index.gs_trigger) - trialstruct.time_probe;
            trialstruct.resp_response   = 1;
            trialstruct.resp_correct    = (trialstruct.resp_response == trialstruct.vbxi_response);
            plot_rs_resp_response;
        case num2cell(KbName(parameters.key_nontarget))
            trialstruct.resp_rt         = (gs - index.gs_trigger) - trialstruct.time_probe;
            trialstruct.resp_response   = 0;
            trialstruct.resp_correct    = (trialstruct.resp_response == trialstruct.vbxi_response);
            plot_rs_resp_response;
    end
    % clean
    clear down code;
end

%% Wait
WaitSecs(0.005);
