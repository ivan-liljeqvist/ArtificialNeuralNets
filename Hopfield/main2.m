%clear
pict

N = 1024;

W = p1'*p1 + p2'*p2 + p3'*p3;



ix = randperm(1024);
randomImage = cat(1,ones(1,512),-1*ones(1,512))
randomImage = randomImage(ix);
  
xd = [p1];

xin = xd ;
oldx = xin*0;

randomUnitMode=false;

units = [1:1024]; %list 1,2,3..1024


vis(randomImage);

pause

for c=1:1024
    for r=1:1024
        W(c,r) = ceil(normrnd(0, 1)); 
    end
end


for i=1:100 %while oldx~=xin
    
    
    if(randomUnitMode == 0) % matrix, all nodes togerher
        xout = sgn(W*xin');
    else %shuffle mode
        
        units = units(randperm(length(units))); %shuffle
        
        for u=units
            
            xout(u) = sgn( sum(W(u)'*xin) );
            
        end
        
    end
    
    
    
    oldx = xin;
    xin = xout';
   
    if mod(i,10)==0
        vis(xin);
        pause(0.1)
    end
   
end 

%vis(xin);


%Can the network complete a degraded pattern? 
%Try the pattern p11, which is a degraded version of p1, or p22 which is a mixture of p2 and p3.

% Yes it can, but sometimes it goes to an unwanted attractor and we get
% crazy result.





%Clearly convergence is practically instantaneous.
%What happens if we select units randomly, calculate their new state and then repeat the process 
%(the original sequential Hop eld dynamics)? Write a matlab script that does this, showing the image every hundredth iteration or so.





% How do you express this calculation in Matlab? (Note: you do not need to use any loops!)
% E = -xWx', x ?r xout i varje loop-iteration, den ?ndras

% What is the energy at the di erent attractors?
% Attractions => lower energy

% What is the energy at the points of the distorted patterns?
% KAN INTE G?RA!!!!

% Follow how the energy changes from iteration to iteration when you use the 
% sequential update rule to approach an attractor.
% Energy becomes lower and lower


% Generate a weight matrix by setting the weights to normally distributed random numbers, 
% and try iterating an arbitrary starting state. What happens?
% We generate a random Weight Matrix, so we get randomly generated attractors. The
% algorithm goes towards one of these. THe energy decreases.


%Make the weight matrix symmetric (e.g. by setting w=0.5*(w+w')). What happens now? Why?
% Beroende p? hur viktmatrisen ser ut s? konvergerar den mot ?nskade v?rden
% eller inte konvergerar alls.
