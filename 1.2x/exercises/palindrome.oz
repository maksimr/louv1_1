%
% We can check if a string is a palindrome by checking two times this string (from the beginning to the end, and from the end to the beginning). However, we can also make this check using a data structure that allows us to remove the first and the last elements to compare them. You will have to write such a data structure to implement the palindrome function, with the help of the algorithm given below.
%
% In this exercise, you are asked to implement the Sequence class and to write the Palindrome function. Here are the methods of the Sequence class:
%
% init : initialization of the sequence
% isEmpty($) : checks if the sequence is empty
% first($) : returns the first element
% last($) : returns the last element
% insertFirst(X) : inserts X at the start of the sequence
% insertLast(X) : inserts X at the end of the sequence
% removeFirst : removes the first element of the sequence
% removeLast : removes the last element of the sequence
% When the class Sequence is implemented, you have to implement the Palindrome function. The Palindrome function takes a list Xs as input and returns true if and only if Xs is a palindrome. Here is the structure of this function with an algorithm described in the comments:
declare
class Sequence
   attr x
   meth init x:=nil end
   meth isEmpty(R)
      if (@x == nil) then
         R=true
      else
         R=false
      end
   end
   meth first(R)
      R=@x.1
   end
   meth last(R)
      local I in
         I={NewCell nil}
         for V in @x do
            I:=V
         end
         R=@I
      end
   end
   meth insertFirst(X)
      x:=X|@x
   end
   meth insertLast(X)
      local InsertLast R in
         fun {InsertLast L}
            if (L == nil) then X|nil
            else
               L.1|{InsertLast L.2}
            end
         end

         R={InsertLast @x}
         x:=R
      end
   end
   meth removeFirst
      x:=@x.2
   end
   meth removeLast
      local RemoveLast R in
         fun {RemoveLast L}
            if (L == nil) then nil
            else
               if (L.2 == nil) then nil
               else
                  L.1|{RemoveLast L.2}
               end
            end
         end

         R={RemoveLast @x}
         x:=R
      end
   end
end


fun {Palindrome Xs}
   local S Check in
      S = {New Sequence init}

      for V in Xs do
         {S insertLast(V)}
      end

      fun {Check}
        % If S is empty then Xs is a palindrome
        % Otherwise, we compare the first and the last element of S
        % If they are equal, remove them and continue
        % Otherwise, Xs is not a palindrome

         local R E1 E2 in
            {S isEmpty(R)}

            if (R == true) then true
            else
               {S first(E1)}
               {S last(E2)}

               if (E1 == E2) then
                  {S removeFirst}
                  {S removeLast}
                  {Check}
               else
                  false
               end
            end
         end
      end

      {Check}
   end
end


{Show {Palindrome nil} == true}
{Show {Palindrome [1]} == true}

{Show {Palindrome [1 1]} == true}
{Show {Palindrome [1 2]} == false}

{Show {Palindrome [1 2 2 1]} == true}
{Show {Palindrome [1 2 3 1]} == false}