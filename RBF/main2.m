

units = 10

plotinit
data=read('cluster');
vqinit;

singlewinner=0;

vqiter


%What problem could be seen when using the single winner strategy (sin- glewinner=1)?

% DEAD NODES!!!! if not single-winner => all the nodes find some kind of
% cluster

%What is the advantage of using this strategy?

% If you know the amount of cluster you can choose the lowest number of
% units possible. Then you can use single-winner and the training will be
% faster. Depending on what the goal is.