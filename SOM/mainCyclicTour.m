

w = rand(10,2);
epochs = 20;

stepsize = 0.2;
[num_nodes,ignore] = size(w);
[num_cities,ignore] = size(city);

neightbourhood = 3;

eta=0.2;

pos = [];

%outer loop to train network
for e=1:epochs

    %innerloop
    for c=1:num_cities
        
        %get info about city
        currentCity = city(c,:);
        
        diffMat = bsxfun(@minus,w,currentCity); 
        %caltulate the length of all diff-vectors
        normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
        [ignore,shortestIndex] = min(normDiffMat);
        
        %find the bound for rows to update
        startUpdateIndex = shortestIndex-neightbourhood;
        finishUpdateIndex = shortestIndex+neightbourhood;
        if(startUpdateIndex<=0)
            startUpdateIndex=num_nodes + startUpdateIndex;
        end
        if(finishUpdateIndex>num_nodes)
            finishUpdateIndex=finishUpdateIndex-num_nodes;
        end
        
        
        for j=startUpdateIndex:finishUpdateIndex
            w(j,:) = w(j,:) + eta*(currentCity-w(j,:)); %move the nodes towards the goal
        end
        
    end
    
    
    if(i==5 || i==10)
        neightbourhood = neightbourhood - 1;
    end
    
   
end



for c=1:num_cities
    
    %get info about animal
    currentCity = city(c,:);
    diffMat = bsxfun(@minus,w,currentCity); 
    %caltulate the length of all diff-vectors
    normDiffMat = arrayfun(@(idx) norm(diffMat(idx,:)), 1:size(diffMat,1));
    [ignore,shortestIndex] = min(normDiffMat);
    
    pos(c) = shortestIndex;
    

end

tour = [w;w(1,:)];
 plot(tour(:,1),tour(:,2),'b-*',city(:,1),city(:,2),'+')
