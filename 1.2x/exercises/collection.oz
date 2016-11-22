%%
% Collection
% You are the programmer of a virtual library. In this virtual library,
% the user can put new books, get the last books from the library as well
% as remove books, check if the library is empty and merge two libraries.
% In order to implement that, you will write a class named Collection.
%
% A collection regroups values. In this exercise, you are asked to build a class named Collection.
% This class has to contain the following methods:
%
%     * init : initializes the collection
%     * put(X) : inserts X in the collection
%     * get($) : removes the last element put in the collection and returns it
%     * isEmpty($) : returns true if the collection is empty and false otherwise
%     * union(C) : performs the union of the current collection and the collection C. This means that each element of C must be put at the beginning of the current collection. After the call, C is left empty and the current collection contains the union of both collections.
declare
class Collection
   attr x
   meth init x:=nil end
   meth put(X) x:=X|@x end
   meth get(Y)
      Y=@x.1
      x:=@x.2
   end
   meth isEmpty(Y)
      if (@x == nil) then
         Y=true
      else
         Y=false
      end
   end
   meth union(C)
      local E V in
         {C isEmpty(E)}

         if E == false then
            {C get(V)}
            {self put(V)}
            {self union(C)}
         end
      end
   end
end

local
   C1
   C2
   V1
   V2
   R1
   R2
   E1
   E2
   E3
in
   C1 = {New Collection init}
   C2 = {New Collection init}
   V1=1
   V2=2
   {C1 isEmpty(E1)}
   {Show E1 == true}


   {C1 put(V1)}
   {C1 isEmpty(E2)}
   {Show E2 == false}


   {C1 get(R1)}
   {Show R1 == V1}

   {C1 put(V1)}
   {C2 put(V2)}
   {C1 union(C2)}

   {C1 get(R2)}
   {Show R2 == V2}

   {C2 isEmpty(E3)}
   {Show E3 == true}
end