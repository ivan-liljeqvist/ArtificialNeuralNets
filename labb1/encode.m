

% if we change eta to smaller values we need to increase epochs alot
% backdrop will converge eventually, but it depends on the eta if it will
% be fast or not. Too large eta will converge fast, but may start
% oscillating, too small eta will converge but slowly


patterns=eye(8)*2-1
targets=patterns

X = [patterns; ones(1,8)];
T = targets;

% generera vikt verktor random element n?ra 0.  

eta = 0.05;
alpha = 0.9;
hidden = 3;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);


w = rand(hidden,(insize+1))* 2/sqrt(insize) - 1/sqrt(insize);
v = rand(outsize,hidden+1)* 2/sqrt(insize) - 1/sqrt(insize);


dv = zeros(outsize,(hidden+1));
dw = zeros(hidden,(insize+1));

epoch = 2000; 

%DELTA REGELN
%dW = -n*(W*X - T)*X.';

error=(1:epoch)

for i = 1:epoch
    
    %Forward
    
    hin = w * X; % input * weights = weighted inputs
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)]; % apply transfer func and add 
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;
    
    %Backward
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);
    
    %Weight update
    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha); %momentum - (Alpha*old sw)
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
   
    
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






