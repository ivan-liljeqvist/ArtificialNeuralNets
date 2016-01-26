
%define variables
hidden=200
epoch=300

%the bottom plane is X and Y
x=[-5:1:5]';
y=x;
%the terrain is Z.
z=exp(-x.*x*0.1) * exp(-y.*y*0.1)' - 0.5;

%the size of the graph
gridsize = size(x, 1);
ndata = gridsize*gridsize;
eta = 0.001;
alpha = 0.9;


%Transform z into a vector with 1 rows and num_points columns
targets = reshape (z, 1, ndata);
%Meshgrid, take x and y and produce matrices xx and yy
[xx, yy] = meshgrid (x, y);
%Create a matrix 
patterns = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);


%
%rand returns interval (0,1) we want interval (?1/?d,1/?d), there fore we
%take -2*1/?d and then +1/?d


v = rand(outsize,hidden+1)* 2/sqrt(insize) - 1/sqrt(insize);
w = rand(hidden,(insize+1))* 2/sqrt(insize) - 1/sqrt(insize);

dv = zeros(outsize,(hidden+1));
dw = zeros(hidden,(insize+1));

X = [patterns; ones(1,ndata)];


for i = 1:epoch 
    %Forward
    hin = w * X;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    %Backprop
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    %Update weights
    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    zz = reshape(out, gridsize, gridsize);
    mesh(x,y,zz);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
    
    
end


