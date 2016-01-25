%we need to add bias to the input
X = [patterns;ones(1,200)]

%generate weigths close to zero
W = rand(1,3)*0.1

%init n (learning rate)
n = 0.01

epochs = 20

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);


