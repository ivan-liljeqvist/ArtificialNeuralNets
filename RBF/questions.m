

1) What is the lower bound for the number of training examples, N?

    N has to be at least =n. 
    Otherwise the least square will not work because the system will be underdetermined and have
    zero or infinite number of solutions.
    
    
2) What happens with the error if N = n? Why?

    The error is zero if there is 1 solution. 
    It could be the case that there are no solutions.
    
3) Under what conditions, if any, does (4) have a solution in this case?
    
    Condition 1:
    If all of the weights are zero, we'll get a homogeneous system.
    A homogeneous system always has a trivial solution.
    
    Condition 2:
    If fi(X) is invertable we can write W=fi(inv(x))y
    and W will have a solution.
    
4) During training we use an error measure defined over the training exam- ples. 
   Is it good to use this measure when evaluating the performance of the network? 
   Explain!
   
   In theory it's good because we take each point and measure the distance to the desired value.
   We square to get rid of the sign.
   The error is measurable so it's approporiate to use this method.
    
    
    
    
    
    