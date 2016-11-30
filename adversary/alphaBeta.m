function  [bestValue, ridnode]=alphaBeta(node, alpha, beta, GraphName, ridnode,End_Generation)
   % var bestValue;  [bestValue, ridnode]=alphaBeta(1, -100, 100, DF, [])
   DF=GraphName;
   rid=0;
    if DF.Nodes.Generation(node) == End_Generation
        bestValue = DF.Nodes.trace(node);
        
  
         
    elseif  ~mod(DF.Nodes.Generation(node),2) && node ~= 1
        bestValue = alpha;
        
       % // Recurse for all children of node.
        for i=1:length(successors(DF,node))
            child=successors(DF,node);
            [childValue, ridnode] = alphaBeta(child(i), bestValue, beta,DF, ridnode,End_Generation);
            bestValue = max(bestValue, childValue);
            
            if beta <= bestValue
                rid=node;
                break;
            end
        end
       
    else 
        bestValue = beta;
        
       % // Recurse for all children of node.
      for i=1:length(successors(DF,node))
            child=successors(DF,node);
           [childValue, ridnode] = alphaBeta(child(i),alpha,bestValue,DF, ridnode,End_Generation);
            bestValue = min(bestValue, childValue);
            
            if  bestValue <= alpha
                rid=node;
                break;
            end
        end
           
    end
     if rid
       ridnode= [ridnode rid];     
     end
end
        
  
