declare
fun {GateMaker F}
   fun {$ Xs Ys}
      fun {GateLoop Xs Ys}
         case Xs#Ys of (X|Xr)#(Y|Yr) then
            {F X Y}|{GateLoop Xr Yr}
         else
            nil
         end
      end
   in
      thread {GateLoop Xs Ys} end
   end
end

AndG={GateMaker fun {$ X Y} X*Y end}
OrG={GateMaker fun {$ X Y} X+Y-X*Y end}
NandG={GateMaker fun {$ X Y} 1-X*Y end}
NorG={GateMaker fun {$ X Y} 1-X-Y+X*Y end}
XorG={GateMaker fun {$ X Y} X+Y-2*X*Y end}


proc {FullAdder X Y Z C S}
   A B D E F
in
   A={AndG X Y}
   B={AndG Y Z}
   D={AndG X Z}
   F={OrG B D}
   C={OrG A F}
   E={XorG X Y}
   S={XorG Z E}
end


fun {Adder A B}
   local CarryBit Result in
      case A#B of (X|nil)#(Y|nil) then
         {FullAdder [0] X|nil Y|nil CarryBit Result}
         (Result.1|nil)#CarryBit.1
      else
         case {Adder A.2 B.2} of ResultIn#CarryBitIn then
            {FullAdder CarryBitIn|nil A.1|nil B.1|nil CarryBit Result}
            (Result.1|ResultIn)#CarryBit.1
         end
      end
   end
end

fun {NFullAdder S1 S2}
   thread
      case S1#S2 of (L1|S1r)#(L2|S2r) then
         {Adder L1 L2}|{NFullAdder S1r S2r}
      else
         nil
      end
   end
end


S1 = [1 1 1 1 1]|[0 0 0 0 0]|[1 1 1 1 0]|_
S2 = [1 1 1 1 1]|[0 0 0 0 0]|[0 0 0 0 1]|_
{Browse {NFullAdder S1 S2}}


% S1 = [1 1 1 1]|[0 1 0 1]|[1 1 1 0]|_
% S2 = [1 1 1 1]|[1 0 1 0]|[1 0 0 0]|_
% {Browse {NFullAdder S1 S2}}
