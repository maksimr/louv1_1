%%
% Shuffle
%
% In this exercise, you are asked to shuffle a list. More precisely,
% you have to shuffle the elements of a list such that {Shuffle [1 2 3 4]}
% can give [4 3 2 1], but also [1 2 4 3], [4 3 1 2], etc.
% Note that {Shuffle nil} returns nil.
declare
fun {Shuffle L}
   % algorithm:
   % first, create an array which contains
   % the same elements than the input list L.
   % Take a random number i between 1 and n (n is the number of elements left in the list).
   % Put this ith element at the end of the array and put the
   % last element at i in the created array.
   % Then, reduce the length of the array by 1 and continue.
   if (L == nil) then nil
   else
      local ListToArray ShuffleArray ArrayToList A N in
         fun {ListToArray L}
            local A I in
               I={NewCell 1}
               A={NewArray 1 {Length L} 0}
               for V in L do
                  A.@I:=V
                  I:=@I+1
               end
               A
            end
         end

         fun {ArrayToList A N}
            if (N == 0) then nil
            else
               A.N|{ArrayToList A N-1}
            end
         end

         fun {ShuffleArray A N} 
            if N == 1 then A
            else
               local I V in
                  I={Number.abs ({OS.rand} mod N) } + 1

                  V=A.N
                  A.N:=A.I
                  A.I:=V

                  {ShuffleArray A N-1}
               end
            end
         end
                             
         N={Length L}
         A={ListToArray L}

         {ArrayToList {ShuffleArray A N} N}
      end
   end
end



{Show {Shuffle nil} == nil}
{Show {Shuffle [1 2 3 4]}}