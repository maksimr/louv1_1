%%
% Reverse
% You are asked to transform Reverse in order
% to use explicit states (cells). In other words, you will not
% have to use recursion anymore, but "for loops". Here is an usage
% of "for loops":
declare
fun {Reverse1 L}
   local ReverseAux in
      fun {ReverseAux L Acc}
         case L of nil then Acc
         [] H|T then {ReverseAux T H|Acc}
         end
      end
      {ReverseAux L nil}
   end
end

%%
% Reverse реализованный через цикл и явное состояние
fun {Reverse L}
   local Acc in
      Acc={NewCell nil}
      for I in L do
         Acc:=I|@Acc
      end
      @Acc
   end
end

{Show {Reverse [1 2 3 4]} == [4 3 2 1]}