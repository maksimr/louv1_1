% TreesAsObjects
% In this exercise, you are asked to build a tree in object-oriented programming.

% We have seen, in a previous lesson, how to build trees using records in the functional paradigm. To observe the difference, you will do the same work with objects.

% Binary trees can be represented following this rule:

% <btree T> ::= leaf | btree(T left:<btree T> right:<btree T>)
% In this exercise, create a class containing these attributes and methods:

% attr: value : the value of this node of the tree (T in the previous grammar)
% attr: left : left tree
% attr: right : right tree
% meth: init(V) : Initializes the tree with the value V and its left and right subtrees to leaf
% meth: setLeft(T) : The new left tree is T
% meth: setRight(T) : The new right tree is T
% meth: setValue(V) : The new value is V
% meth: getLeft($) : Returns the left tree
% meth: getRight($) : Returns the right tree
% meth: getValue($) : Returns the value
% meth: isBalanced($) : Returns true if the tree is balanced
% Reminder: A tree is balanced if its two subtrees have the same amount of leaves (with a difference of maximum 1) and are balanced themselves.

% The name of the class you have to build is: Tree

declare

class Tree
   attr value left right

   meth init(V)
      value:=V
      left:=leaf
      right:=leaf
   end

   meth setLeft(T)
      left := T
   end
   meth setRight(T)
      right := T
   end
   meth setValue(V)
      value := V
   end
   meth getLeft(R) R=@left end
   meth getRight(R) R=@right end
   meth getValue(R) R=@value end
   meth isBalanced(R)
      local RT LT RB LB RL LL NumLeaves IsBalanced Mod in
         fun {NumLeaves T}
            case T of leaf then 1
            else
               local LT RT in
                  {T getLeft(LT)}
                  {T getRight(RT)}
                  {NumLeaves LT} + {NumLeaves RT}
               end
            end
         end
         fun {IsBalanced T}
            local R in
               if (T == leaf) then true else {T isBalanced(R)} R end
            end
         end
         fun {Mod N}
            if (N < 0) then ~N
            else N end
         end

         {self getRight(RT)}
         {self getLeft(LT)}

         RB={IsBalanced RT}
         LB={IsBalanced LT}

         case RB#LB of true#true then
            if ({Mod {NumLeaves LT} - {NumLeaves RT}} < 2) then
               R=true
            else
               R=false
            end
         else
            R=false
         end
      end
   end
end


T={New Tree init(0)}
T1={New Tree init(1)}
T2={New Tree init(2)}
T3={New Tree init(1)}
T4={New Tree init(2)}

{T setLeft(T1)}
{T setRight(T4)}

{T1 setRight(T2)}
{T2 setRight(T3)}

TN = {New Tree init(0)}

{Show '------'}
B {T isBalanced(B)}
BN {TN isBalanced(BN)}
{Show B}
{Show BN}