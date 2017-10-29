function [ioObj, status] = IOport_open
% http://apps.usd.edu/coglab/psyc770/IO64.html
% 
% Miriam Klein-Flügge from the link above, July 2015

%-Calling io64 with no input arguments creates a persistent instance of
% the io64 interface object and returns a 64-bit handle to its location.
% This command must be issued first since the object handle is a required
% input argument for all other calls to io64.  This io64 call will not
% work properly unless a return variable is specified.
ioObj = io64;

%-Initialize the interface to the inpoutx64 system driver
%-Calling io64() using one input argument and a single return variable
% causes the inpoutx64.sys kernel-level I/O driver to be automatically
% installed (i.e., no manual driver installation is required). 
% status is a variable returned from the function that describes whether
% the driver installation process was successful (0 = successful).
% Subsequent attempts to perform port I/O using io64() will fail if a
% non-zero status value is returned here.  This step must be performed 
% prior to any subsequent attempts to read or write I/O port data.
status = io64(ioObj);

if status ~= 0
   error('inp/outp installation failed');
end


