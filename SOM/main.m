

w = rand(100,84);
epochs = 20;

stepsize = 0.2;
num_animals = 32;

neightbourhood = 6;

eta=0.2;

pos = [];

%outer loop to train network
for e=1:epochs

    %innerloop
    for anim=1:num_animals
        
        %get info about animal
        p = props(anim,:)
        
        diffMat = bsxfun(@minus,w,p); 
        %caltulate the length of all diff-vectors
        normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
        [ignore,shortestIndex] = min(normDiffMat)
        
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
    
    
    if(neightbourhood>3) 
        neightbourhood = neightbourhood - 1;
    end
    
   
end



for anim=1:num_animals
    
    %get info about animal
    p = props(anim,:)
    diffMat = bsxfun(@minus,w,p); 
    %caltulate the length of all diff-vectors
    normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
    [ignore,shortestIndex] = min(normDiffMat)
    
    pos(anim) = shortestIndex
    

end
[dummy, order] = sort(pos);
snames(order)'
