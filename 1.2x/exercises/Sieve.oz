declare
fun {Filter Xs X}
   if Xs == nil then nil
   else
      if (Xs.1 mod X) == 0 then {Filter Xs.2 X}
      else
         Xs.1|{Filter Xs.2 X}
      end
   end
end

fun {Sieve Xs}
   case Xs of nil then nil
   [] X|Xr then
      X|{Sieve thread {Filter Xr X} end}
   end
end


{Show {Sieve [2 3 4 5 6 7 8 9 10 11]}}