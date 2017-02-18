%% bioloid access functions% by Adam Lukomski, 2013%
function err = hw_start( i )

switch computer()
    case 'GLNX86'
        display('linux 32-bit stuff')
	loadlibrary(['+hw/' computer '/libdxl.so'],['+hw/' computer '/libdxl.h'])
    case 'GLNXA64'
        display('linux 64-bit stuff')
	loadlibrary(['+hw/' computer '/libdxl.so'],['+hw/' computer '/libdxl.h'])
    case { 'pcwin64', 'PCWIN64', 'win64', 'WIN64' }
	display('windows 64-bit stuff')
	loadlibrary(['+hw/PCWIN64/libdxl.dll'],['+hw/PCWIN64/libdxl.h'])
    case { 'win32', 'WIN32', 'PCWIN', 'pcwin', 'win', 'PCWIN32', 'pcwin32' }
	display('windows 32-bit stuff')
	loadlibrary(['+hw/PCWIN/libdxl.dll'],['+hw/PCWIN/libdxl.h'])
    otherwise
        display('Not supported - trying windows 32-bit...')
	loadlibrary(['+hw/PCWIN/libdxl.dll'],['+hw/PCWIN/libdxl.h'])
end

%  libfunctions('libdxl')

%  disp(['please do chmod 666 /dev/ttyUSB' num2str(i) '...']);
err = calllib('libdxl', 'dxl_initialize', i, 1);
if err==1
	disp('success!')
else
	disp('error')
end


