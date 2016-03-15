x1=vm([0 0 1 0 1 0 0 1])
x2=vm([0 0 0 0 0 1 0 0])
x3=vm([0 1 1 0 0 1 0 1])


x1d=vm([1 0 1 0 1 0 0 1])
x2d=vm([1 0 0 0 0 1 0 0])
x3d=vm([1 1 1 0 1 1 0 1])
x4d=vm([1 1 1 0 0 1 1 1])

n = 8;
result = dec2bin(0:2^n-1)-'0';

xd = result;
xin = xd ;
oldx = xin*0;

P = 3; 
Units = 8;

xd = result;
x = [x1;x2;x3];
xin=xd; %REMOVE LATER

%Calculate weights
W = x'*x; 

%for c=1:8
    %for r=1:8
     %   W(c,r) = ceil(normrnd(0, 1)); 
    %end
%end

%W=0.5*(W+W')

E = -xd*W*xd'

%Update neurons
for i=1:40 %while oldx~=xin
    
    xout = sgn(W*xin');
    oldx = xin;
    xin = xout';
    
    E = -xout'*W*xout
    
end 

E = -xout'*W*xout

unique(sortrows(xin),'rows')


%How many attractors are there in this network? Hint: automate the searching.

    % Vi tr?nade n?tverket som vanligt
    % Skickade in alla permutationer av 1 och 0 p? 8 bitar
    % Sortade, unique => fick ut 10 unika rows aka attractors
    
    % Vi provade ge konstig input, men i alla blev det till en attractor
    
% What happens when you make the starting pattern even more dissimilar to the stored ones (e.g. more than half is wrong)?
    % Den drar till annan attractor
    




