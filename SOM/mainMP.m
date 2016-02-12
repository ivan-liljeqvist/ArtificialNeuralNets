
votes1
mpsex1
mpparty1
mpdistrict1

w = rand(100,31);
epochs = 20;

num_mp = 349;

neightbourhood = 20;

eta=0.2;

pos = [];

%outer loop to train network
for e=1:epochs

    %innerloop
    for mp=1:num_mp
        
        %get info about animal
        p = votes(mp,:)
        
        diffMat = bsxfun(@minus,w,p); 
        %caltulate the length of all diff-vectors
        normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
        [ignore,shortestIndex] = min(normDiffMat);
        
        %find the bound for rows to update
        startUpdateIndex = shortestIndex-neightbourhood;
        finishUpdateIndex = shortestIndex+neightbourhood;
        if(startUpdateIndex<=0)
            startUpdateIndex=1;
        end
        if(finishUpdateIndex>100)
            finishUpdateIndex=100;
        end
        
        for j=startUpdateIndex:finishUpdateIndex
            w(j,:) = w(j,:) + eta*(p-w(j,:)); %move the nodes towards the goal
        end
        
    end
    
    
    if(neightbourhood>1) 
        neightbourhood = neightbourhood - 1;
    end
    
   
end



for mp=1:num_mp
    
    %get info about animal
    p = votes(mp,:)
    diffMat = bsxfun(@minus,p,w); 
    %caltulate the length of all diff-vectors
    normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
    [ignore,shortestIndex] = min(normDiffMat);
    
    pos(mp) = shortestIndex;
   
    
end

a = ones(1,100)*350;
a(pos) = 1:349;
    
p=[mpsex;0];
image(p(reshape(a,10,10))+1);


