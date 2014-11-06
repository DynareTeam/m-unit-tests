function [report, time] = run_unitary_tests(listoffiles)

% Runs unitary tests defined in a collection of files.
%
% INPUTS 
%  - listoffiles [cell], The list of m files (with path) where the unitary tests are written.
%                This cell, with n elements, is the output of get_directory_description routine.
%
% OUTPUTS 
%  - report      [cell], Results of the unitary tests (n rows and 5 columns). Each row stores
%                the second output argument of mtest routine (info).
%  - time        [double], Current date and time as date vector.
%
%
% See also get_directory_description, mtest

% Copyright (C) 2013-2014 Dynare Team
%
% This file is part of Dynare.
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

report = {};
    
for f=1:length(listoffiles)
    if isequal(listoffiles{f}(end-1:end),'.m') && isempty(strfind(listoffiles{f},'.#'))
        if is_unitary_test_available(listoffiles{f})
            disp(['***** Process unitary tests in      ' listoffiles{f}])
            [check, info] = mtest(listoffiles{f});
            report = [report; info];
        else
            disp(['Booh! No unitary tests available in ' listoffiles{f}])
        end
    end
end

if nargout>1
    time = clock;
end
