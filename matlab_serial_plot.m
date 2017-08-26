xmax=50;
t=0;
xmin=-50;
data=[];
while(1)
    t=t+1;
    z=fscanf(a);
    z=str2double(z);
   data(1,t) = z;
    plot(t,z,'ro')
    xmin=xmin+1;
    xmax=xmax+1;
    axis([xmin xmax 0 1024])
    hold on
    drawnow
   flushinput(s)
   %pause(0.01)
end
