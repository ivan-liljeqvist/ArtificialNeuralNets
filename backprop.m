X = [patterns; ones(1,200)];
T = targets;

% generera vikt verktor random element n?ra 0.  

eta = 0.001;
alpha = 0.9;
hidden = 100;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);


v = rand(outsize,hidden+1)*0.1;
w = rand(hidden,(insize+1))*0.1;
dv = zeros(outsize,(hidden+1));
dw = zeros(hidden,(insize+1));



epoch = 200; 

%DELTA REGELN
%dW = -n*(W*X - T)*X.';

error=(1:epoch)

for i = 1:epoch 
   %Fram?t
   
    hin = w * X;
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    %Bak?t
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    %Viktuppdatering
    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    p = w(1,1:2);
    k = -w(1, insize+1) / (p*p');
    l = sqrt(p*p');
    
    plot(patterns(1,find(targets>0)),patterns(2,find(targets>0)),'*',patterns(1,find(targets<0)),patterns(2,find(targets<0)),'+',[p(1), p(1)]*k + [-p(2), p(2)]/l,[p(2), p(2)]*k + [p(1), -p(1)]/l, '-');

    error(i) = sum(sum(abs(sign(out) - targets)./2));
    
    %Error expalined:
    %1: sign(out) - targets = if both are same sign, we get 0 => zero error
    %2: /2 => because if different sign we'll get 1--1 = 2 but we just want
    %to count it as 1 error, therefore /2
    %3: we then sum each row for it self
    %4: now we have a vector with numbers
    %5: the second sum sums the vector
end


plot(error)






