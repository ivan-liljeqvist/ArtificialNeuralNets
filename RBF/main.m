

x=[0:0.1:0.5*pi]';
y1=sin(2*x);
%y2=square(2*x);
y3=cos(x);



units = 30

makerbf

% var = variance och m = RBF-nodes positions
% 1) Variance - used in the transfer func
% 2) Kan vara olika f?r olika RBF-nodes
% 3) Styr dem hur l?ngt ifr?n noden input kan ligga f?r att f? en h?g
% signal



% Phi = v?rdet p? klock-kurvan f?wr alla inputs och units
Phi = calcPhi(x,m,var)

% Nu anv?nder vi v?rdet p? klock-kurvan f?r att r?kna ut 
% Phi*w = y1 => hitta w, LEAST SQUARE
w = Phi\y1
%w2 = Phi\y2
w3 = Phi\y3

out = Phi*w
%out2 = Phi*w2
out3 = Phi*w3

rbfplot1(x,out,y1,units)

fun = 'cos'
eta = 0.9

diter


% Now try to vary the number of units to get below 0.1, 0.01 and 0.001 
% 7 units => below 0.1
% 20 units => 0.01
% 30 units => 0.001

%?ndpunkterna blir s?mre approximerade eftersom dem yttersta RBF-units inte ligger tillr?ckligt l?ngt ut f?r att
%t?cka dem. (flera datapunkter som drar units mot mitten)


%6 units => 0.11
%plot(w,5,'x',m,5,'*')


%ON-LINE training
%How many units and iterations did you require to come down to a maxi-
%mum residual value of 0.01? What value(s) of ? did you use?

% eta = 0.9   %units =40  5000 iter d? blir det 0.01






