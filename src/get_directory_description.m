function flist = get_directory_description(basedir)

% List recursively all the *.m files in a directory.
%
% INPUTS 
%  - basedir [string], the name of the directory to be inspected.
%
% OUTPUTS 
%  - flist   [cell of strings], the files under basedir (and subfolders).     

% Copyright (C) 2013-2015 Dynare Team
%
% This file is part of Dynare (m-unit-tests module).
%
% Dynare is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% Dynare's m-unit-tests module is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
% or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for 
% more details.
%
% You should have received a copy of the GNU General Public License
% along with Dynare.  If not, see <http://www.gnu.org/licenses/>.

if ~nargin || isempty(basedir)
    % Current directory is the default value of basedir 
    basedir = '.'; 
end
    
flist={};
%get m-files in this directory
dd = dir([basedir,filesep '*.m']);
temp=struct2cell(dd);
flist=[flist temp(1,:)];
%deal with subdirectories
dlist=getalldirectories(basedir,excludedsubfolders); %first call with excluded directories
for ii=1:length(dlist)
    flist=[flist getallroutinenames([ basedir filesep dlist{ii}])]; %recursive calls without subfolders
end


function dlist = getalldirectories(p,excluded_directories)
    if nargin<2
        excluded_directories = {};
    end
    dd = dir(p);
    dir_result=struct2cell(dd);
    directory_indicator=cell2mat(dir_result(4,:));
    dlist = dir_result(1,directory_indicator==1 & ~strcmp('.',dir_result(1,:)) & ~strcmp('..',dir_result(1,:)) & ~ismember(dir_result(1,:),excluded_directories));
