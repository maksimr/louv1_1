declare
proc {ForCollect Xs P Ys}
   Acc={NewCell Ys}
   proc {C X} R2 in @Acc=X|R2 Acc:=R2 end
in
   for X in Xs do
      {P C X}
   end
   @Acc=nil
end


R={ForCollect [1 2 3] proc {$ C I} {C I*I} end}
{Show R}