% Get the path to the m-unit-tests/src folder.
unit_tests_src_root = strrep(which('initialize_unit_tests_toolbox'),'initialize_unit_tests_toolbox.m','');

if ~exist('isoctave','file') 
    addpath([unit_tests_src_root '/missing/isoctave'])
end

if ~exist('skipline','file')
    addpath([unit_tests_src_root '/missing/skipline'])
end
