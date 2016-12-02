function  [GraphUpadte]=AlgebraicRedundancy(newnode_number,GraphName)%genearate the next node by deepth first


            Last_node=newnode_number;
            generation=GraphName.Nodes.Generation(newnode_number);
            position=GraphName.Nodes.Position(newnode_number);
                                
            GraphUpadte=GraphName;

            if GraphUpadte.Nodes.Finish(Last_node)==1 %if the node is already finished, no need to continue
                
                return;
                
            elseif GraphUpadte.Nodes.Law(Last_node)== 0 % this is a control level? the covariance is not updated, no need to continue
                return;
                
            else  % this is a measurement level?begin to see the condition of Algebraic Redundancy
                
                for i=1:Lastnode-1
                    if GraphUpadte.Nodes.Generation(i)==generation && GraphUpadte.Nodes.Position(i)==position %find the node in the same geneartion and the same position
                        
                        if GraphUpadte.Nodes.trace(i) < GraphUpadte.Nodes.trace(Last_node)
                            
                            GraphUpadte.Nodes.Finish(Last_node)=1;
                            GraphUpadte.Nodes.rid(Last_node)=1;
                            return;
                        end
                                               
                    end
                    
                end
                                                           
            end

end