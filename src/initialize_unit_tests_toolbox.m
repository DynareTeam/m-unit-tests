% Get the path to the dates/src folder.
unit_tests_src_root = strrep(which('initialize_unit_tests_toolbox'),'initialize_unit_tests_toolbox.m','');

if ~exist('isoctave','file') 
    addpath([unit_tests_src_root '/missing/isoctave'])
end