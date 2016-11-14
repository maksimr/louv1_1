%%
% In this exercise, you are asked to return a list containing the elements of the tree following
% the infix order. In the infix order (or in-order), for each tree, the first visited subtree is the left one,
% then the root and finally the right one. For instance, for 
% btree(4 left:btree(2 left:btree(1 left:leaf right:leaf)
%                                   right:btree(3 left:leaf right:leaf)) 
%               right:btree(5 left:leaf right:leaf))
% following the infix order traversal, we have: 1 2 3 4 5. 
%
declare
Tree1=btree(4 left:btree(2 left:btree(1 left:leaf right:leaf)
                         right:btree(3 left:leaf right:leaf)) 
            right:btree(5 left:leaf right:leaf))
Tree2=btree(3 left:btree(2 left:btree(1 left:leaf right:leaf) right:leaf)
            right:btree(4 left:leaf right:btree(5 left:leaf right:btree(6 left:leaf right:leaf))))
fun {Infix Tree}
   case Tree of btree(Value left:T1 right:T2) then
      {Append {Infix T1} Value|{Infix T2}}
   else
      nil
   end
end

{Show {Infix Tree1} == [1 2 3 4 5]}
{Show {Infix Tree2} == [1 2 3 4 5 6]}