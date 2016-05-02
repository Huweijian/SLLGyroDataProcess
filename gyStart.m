global t;
global x;
global m;
global ii;

t = [0];
m = [0, 0, 0, 0, 0, 0, 0];
ii = 0;
x = -100;
p = 1;
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
s.BytesAvailableFcn = {@gyCallback, p};
s.terminator = '';
fopen(s);