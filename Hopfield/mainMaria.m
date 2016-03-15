x1=vm([0 0 1 0 1 0 0 1])
x2=vm([0 0 0 0 0 1 0 0])
x3=vm([0 1 1 0 0 1 0 1])



x1d=vm([1 0 1 0 1 0 0 1])
x2d=vm([1 1 0 0 0 1 0 0])
x3d=vm([1 1 1 1 1 1 1 1])
x4d=vm([1 0 0 1 1 0 1 0])

  
xd = [x1d; x2d; x3d];
xin = xd ;
oldx = xin*0;

P = 3; 
Units = 8;

x = [x1; x2; x3];
%xin = x;

%Calculate weights
W = x'*x; 

%Update neurons
%for i=1:ceil(log2(Units)) %oldx~=xin
for i=1:100
    xout = sgn(W*xin');
    oldx = xin;
    xin = xout';
end 

%1     1    -1     1     1    -1     1    -1
xin
