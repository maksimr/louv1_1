%%
% BuildMyFunction
%
% This time, your math teacher asked you to write a function in Oz for him.
% He gives you the domain and the codomain of his mathematical function and
% your Oz function has to produce another Oz function representing the mathematical function of your math teacher.
% This exercise is focused on the use of functions as output.
% You are asked to provide the body of a function (named Build) that returns another function defined by a domain
% D and a codomain C given as input. Here is the signature:
%         fun {Build D C}
% D is a list representing the domain of your output function and
% C is a list representing the codomain. D and C have the same length and
% do not contain only integers, but may contain atoms or lists.
% If your output function is named f then f(D[i]) = C[i].
% This means that if we call your output function with the third element of D
% then the output has to be the third element of C. If we call your output function with an element
% that is not present in D, then you have to return "bottom" (without the quotes).
% For instance for D = [1 2 3] and C = [~1 ~2 ~3], consider the following example:
%         local F in
%             F = {Build D C}
%             {Browse {F 1}} # Prints ~1
%             {Browse {F 3}} # Prints ~3
%             {Browse {F 4}} # Prints bottom
%         end
declare
D=[ 1  2  3]
C=[~1 ~2 ~3]
fun {Build D C}
   fun {$ N}
      local Find in
         fun {Find N D C}
            if (D == nil) then 'bottom'
            else
               if (D.1 == N) then C.1
               else
                  {Find N D.2 C.2}
               end
            end
         end

         {Find N D C}
      end
   end
end
F={Build D C}
{Show {F 1} == ~1}
{Show {F 3} == ~3}
{Show {F 4} == 'bottom'}
