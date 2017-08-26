%run('clean');
clear all;
close all;
 
s = serial('COM1'); %assigns the object s to serial port
 
set(s, 'InputBufferSize', 256); %number of bytes in inout buffer
set(s, 'FlowControl', 'hardware');
set(s, 'BaudRate', 9600);
set(s, 'Parity', 'none');
set(s, 'DataBits', 8);
set(s, 'StopBit', 1);
set(s, 'Timeout',10);
%clc;
 
disp(get(s,'Name'));
prop(1)=(get(s,'BaudRate'));
prop(2)=(get(s,'DataBits'));
prop(3)=(get(s, 'StopBit'));
prop(4)=(get(s, 'InputBufferSize'));
 
disp(['Port Setup Done!!',num2str(prop)]);
 
fopen(s);           %opens the serial port
t=1;
disp('Running');
x=0;
while(t < 200)  %Runs for 200 cycles - if you cant see the symbol, it is "less than" sign. so while (t less than 200)
 
   a =fread(s); %reads the data from the serial port and stores it to the matrix a
 
   plot(x);
   axis auto;
   grid on;
 
   disp([num2str(t),'th iteration max= ',num2str(a)]);
   hold on;
   t=t+1;
   a=0;  %Clear the buffer
   drawnow;
end
 
fclose(s); %close the serial port