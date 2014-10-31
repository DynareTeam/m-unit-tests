function [report, time] = run_unitary_tests(listoffiles)
    
% Copyright (C) 2013 Dynare Team
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
