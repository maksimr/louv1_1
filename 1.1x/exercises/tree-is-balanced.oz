%%
% IsBalanced
%
% You are proposed to do a little gardening. Every gardener in the world would
% dream to have an algorithm that tells them if their trees are well trimmed.
% At the end of this exercise, you will be able to help all of these gardener!
%
% This exercise is focused on the use of trees built using records.
% Binary trees are represented by the following rule:
%         <btree T> ::= leaf | btree(T left:<btree T> right:<btree T>)
%
% In this exercise, you are asked to check if a tree is balanced.
% A tree is balanced if its two subtrees have the same amount of leaves (with a difference of maximum 1)
% and are balanced themselves. A leaf is a balanced tree. Your function has
% to return true if the tree is balanced and false otherwise. Here is the function signature:
%         fun {IsBalanced Tree}
%
% To write this function, you are asked to create and use a function that
% counts the number of leaves in a tree. The signature of this function is: 
%         fun {NumLeaves Tree}
% The function receives a tree (named Tree) as input and returns the total number of leaves contained in it.
declare
T=btree(4 left:btree(2
                     left:btree(1 left:leaf right:leaf)
                     right:btree(3 left:leaf right:leaf))
        right:btree(6
                    left:btree(5 left:leaf right:leaf)
                    right:btree(7 left:leaf right:leaf)))


fun {NumLeaves Tree}
   case Tree of leaf then 1
   [] btree(T left:T1 right:T2) then
      {NumLeaves T1} + {NumLeaves T2}
   end
end


fun {Mod N}
   if (N < 0) then ~N
   else N end
end


fun {IsBalanced Tree}
   case Tree of leaf then true
   [] btree(T left:T1 right:T2) then
      if ({Mod {NumLeaves T1} - {NumLeaves T2}} < 2) then
         if ({IsBalanced T1}) then {IsBalanced T2}
         else false end
      else false end
   end
end


{Show '--------IsBalanced---------'}
{Show {IsBalanced leaf} == true}
{Show {IsBalanced T} == true}
{Show {IsBalanced btree(1 left:leaf right:leaf)} == true}
{Show {IsBalanced btree(1 left:leaf right:btree(2 left:leaf right:leaf))} == true}
{Show {IsBalanced btree(1 left:leaf right:btree(2 left:leaf right:btree(3 left:leaf right:leaf)))} == false}