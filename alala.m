%%
cmd1 = ['ff'; '00'; '01'; '00'; '00'; '00'; '00' ;'00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'; '00'];
cmd1 = hex2dec(cmd1)';
fwrite(s, cmd1);
