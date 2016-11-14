%%
% SORTWITHTREE
%
% This exercise is focused on the use of trees built using records. Binary trees are represented by the following rule:
%         <btree T> ::= leaf | btree(T left:<btree T> right:<btree T>). 
%
% More precisely, we deal with ordered trees. These trees respect this property: the left child has a strictly lower value than the root and the right child has a strictly higher value than the root. Equal values are replaced in the tree. This implies that a value can be present only once in the tree. Note that for the sake of simplicity, keys and values are merged. This means that the tree is ordered according to the value (a value of the type T in the grammar representation).
%
% In this exercise, you are asked to provide two complementary functions. 
%
% The first function has to build an ordered tree from a non-ordered list. For instance, from the list [42 24 12], your function has to return 
% btree(42 left:btree(24 left:btree(12 left:leaf right: leaf)
%                                       right:leaf) 
%                 right:leaf) 
%
% The list elements have to be inserted in the tree following the order of the list. Here is the function signature:
%         fun {FromListToTree L}
%
% The second function has to parse an ordered tree to produce an ordered list (from the the smaller to the larger). For instance, from the tree 
% btree(42 left:btree(24 left:btree(12 left:leaf right: leaf) 
%                                       right:leaf) 
%                 right:leaf)
% your function has to return the list [12 24 42]. Here is the function signature:
%         fun {FromTreeToList T}
%
declare
fun {FromListToTree List}
   local ListToTree Insert in

      fun {Insert Value Tree}
         case Tree of leaf then btree(Value left:leaf right:leaf)
         [] btree(V left:T1 right:T2) andthen Value == V then
            btree(V left:T1 right:T2)
         [] btree(V left:T1 right:T2) andthen Value < V then
            btree(V left:{Insert Value T1} right:T2)
         [] btree(V left:T1 right:T2) andthen Value > V then
            btree(V left:T1 right:{Insert Value T2})
         end
      end

      fun {ListToTree L T}
         if L == nil then T
         else
            {ListToTree L.2 {Insert L.1 T}}
         end
      end

      {ListToTree List leaf}
   end
end
{Show {FromListToTree [42 24 12]} == btree(42 left:btree(24 left:btree(12 left:leaf right: leaf) right:leaf) right:leaf)}
{Show {FromListToTree [24 42 12]} == btree(24 left:btree(12 left:leaf right: leaf) right:btree(42 left:leaf right:leaf))}


declare
fun {FromTreeToList T}
   case T of btree(Value left:VL right:VR) then
      {Append {FromTreeToList VL} Value|{FromTreeToList VR}}
   else
      nil
   end
end
{Show {FromTreeToList btree(42 left:btree(24 left:btree(12 left:leaf right: leaf) right:leaf) right:leaf)} == [12 24 42]}
{Show {FromTreeToList {FromListToTree [12 42 24 1]}} == [1 12 24 42]}