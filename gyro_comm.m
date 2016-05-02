%%
clear;
global t;
global x;
global m;
global ii;
global timeOld Sx  Sy  Sr;
timeOld = -1;
Sx = 0;
Sy = 0;
Sr = 0;
t = 0;
m = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
ii = 0;
x = -100;
% p = plot(t,m,'EraseMode','background','MarkerSize',5);
% axis([x-200 x+200 -2 2]);
% grid on;

a1 = 55;
a2 = -55;
a3 = -128;
a4 = 128;
global A;
A = [   sind(a1), cosd(a1), 1;
        sind(a2), cosd(a2), 1;
        sind(a3), cosd(a3), 1;
        sind(a4), cosd(a4), 1];


%%

try
    s=serial('COM4');
catch
    error('cant serial');
end
set(s,'BaudRate', 115200,'DataBits',8,'Parity','none','FlowControl','none');
% s.BytesAvailableFcnMode = 'terminator';
% s.BytesAvailableFcn = {@callback,p};

s.BytesAvailableFcnMode = 'byte';
s.BytesAvailableFcnCount = 25;
s.BytesAvailableFcn = @cb;
s.terminator = '';
fopen(s);

% %%
% cmd1 = ['ff'; 'B0'; '01'; '02'; '03'; '00'; '00' ;'00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '31'];
% cmd1 = hex2dec(cmd1)';
% fwrite(s, cmd1);
% pause(2);
% %%
% cmd1 = ['ff'; 'B0'; '04'; '05'; '06'; '11'; '00' ;'00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '5C'];
% cmd1 = hex2dec(cmd1)';
% fwrite(s, cmd1);

%%
pause;
fclose(s);
delete(s);
clear s
close all;
clear all;



