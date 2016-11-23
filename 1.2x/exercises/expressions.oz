%%
% Expressions may contain sub-expressions. When you perform a computation mentally, you often "cut" the expression to make it easier. For instance, if you have to compute the difficult calculus (5+4)*(5-4), you will compute (5+4)=9, then (5-4)=1 and finally 9*1=9. Because your math teacher want to make explicit this process, you will write a program that represents this kind of expression hierarchy.
%
% In this exercise, you will create a class for each possible expression. Then, it will be possible to combine sub-expressions to form new expressions. Here are the classes (corresponding to expressions) you have to create:
%
% Addition : the initialization takes two expressions as input
% Subtraction : the initialization takes two expressions as input
% Multiplication : the initialization takes two expressions as input
% Division : the initialization takes two expressions as input
% and you also have to define:
%
% Variable : the initialization takes one integer as input
% Constant : the initialization takes one integer as input
% Note that Addition, Subtraction, Multiplication and Division have a method named evaluate which computes the result, considering the sub-expressions. For instance, considering S={New Subtraction init(X Y)}, the evaluate method of S computes X - Y. Variables have a method named set that allows the user to change their value
%
declare
class Variable
   attr v
   meth init(V) v:=V end
   meth set(V) v:=V end
   meth evaluate(R) R=@v end
end
class Constant
   attr v
   meth init(V) v:=V end
   meth evaluate(R) R=@v end
end
class Addition
   attr x y
   meth init(X Y)
      x:=X
      y:=Y
   end
   meth evaluate(R)
      local Rx Ry in
         {@x evaluate(Rx)}
         {@y evaluate(Ry)}
         R=Rx + Ry
      end
   end
end
class Subtraction
   attr x y
   meth init(X Y)
      x:=X
      y:=Y
   end
   meth evaluate(R)
      local Rx Ry in
         {@x evaluate(Rx)}
         {@y evaluate(Ry)}
         R=Rx - Ry
      end
   end
end
class Multiplication
   attr x y
   meth init(X Y)
      x:=X
      y:=Y
   end
   meth evaluate(R)
      local Rx Ry in
         {@x evaluate(Rx)}
         {@y evaluate(Ry)}
         R=Rx * Ry
      end
   end
end
class Division
   attr x y
   meth init(X Y)
      x:=X
      y:=Y
   end
   meth evaluate(R)
      local Rx Ry in
         {@x evaluate(Rx)}
         {@y evaluate(Ry)}
         R=Rx div Ry
      end
   end
end


{Show '------Expressions------'}
declare
VarX = {New Variable init(0)}
VarY = {New Variable init(0)}
local
   Result
   C = {New Constant init(6)}
   Expr1 = {New Addition init(VarX VarY)}
   Expr2 = {New Division init(Expr1 C)}
in
   {VarX set(3)}
   {VarY set(4)}
   {Expr2 evaluate(Result)}
   {Show Result == 1}
end