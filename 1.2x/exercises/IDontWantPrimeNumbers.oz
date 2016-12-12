% In this exercise, you have to create an agent which, based on the Sieve
% function seen in the course, returns a stream which contains numbers that are not prime numbers.
%
% The first thing to do is to implement the non-optimized form of Sieve,
% which "removes" integers that are not prime numbers from the input stream.
% Note that you also have to write the Prod function that creates a stream of consecutive integers.
% For instance, {Prod 2 10} returns a stream of consecutive integers that begins with 2.
% The stream is closed when 10 is inserted in the stream.
%
% The second thing is to create a new function NotPrime
% that takes S1 and S2 as inputs. S1 is the same input as the Sieve input.
% S2 is the output of Sieve. The output of your agent is a new stream of integers
% that does not contain any prime number.
% Therefore, you will have to remove from S1 the elements of S2.
% The signature of this function has to be fun {NotPrime S1 S2}
declare
fun {Prod A B}
   thread
      if (A > B) then nil
      else
         A|{Prod A+1 B}
      end
   end
end

fun {Sieve Xs}
   local Filter in
      fun {Filter Xs X}
         if Xs == nil then nil
         else
            if (Xs.1 mod X) == 0 then {Filter Xs.2 X}
            else
               Xs.1|{Filter Xs.2 X}
            end
         end
      end

      case Xs of nil then nil
      [] X|Xr then X|{Sieve thread {Filter Xr X} end}
      end
   end
end

fun {NotPrime Xs Ys}
   local Filter in
      fun {Filter Xs X}
         if Xs == nil then nil
         else
            if Xs.1 == X then {Filter Xs.2 X}
            else
               Xs.1|{Filter Xs.2 X}
            end
         end
      end

      case Ys of nil then Xs
      [] X|Xr then
         {NotPrime thread {Filter Xs X} end Xr}
      end
   end
end

Xs={Prod 2 10}
{Browse {NotPrime Xs {Sieve Xs}}}