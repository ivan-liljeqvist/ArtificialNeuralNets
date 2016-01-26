%we need to add bias to the input
X = [patterns;ones(1,200)]

%generate weigths close to zero
W = rand(1,3)*0.1
orW=W

%init n (learning rate)
n = 0.01

%number of epochs, times we iterate
epochs = 20

%get dimensions
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

%compute the change in weights, acording to formula
T=targets


%learn according to fomula
for i=1:epochs
    dW = -n*(W*X-T)*X.'
    W = W + dW
    
    axis ([-2, 2, -2, 2], 'square');
    
    p = W(1,1:2);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');

    plot(patterns(1,find(targets>0)),patterns(2,find(targets>0)),'*',patterns(1,find(targets<0)),patterns(2,find(targets<0)),'+',[p(1), p(1)]*k + [-p(2), p(2)]/l,[p(2), p(2)]*k + [p(1), -p(1)]/l, '-');

    %pause()

end





