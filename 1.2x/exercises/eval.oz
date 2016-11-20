%%
% Eval
% In this exercise, you are asked to produce a calculator in the postfix notation. Here is an example of such a notation: [2 3 + 4 * 2 /]. In this example, here is the following steps:
%         Init stack: [2 3 '+' 4 '*' 10 '/'] and Result stack: []
%         Init stack: [3 '+' 4 '*' 10 '/'] and Result stack: [2]
%         Init stack: ['+' 4 '*' 10 '/'] and Result stack: [3 2]
%         Init stack: [4 '*' 10 '/'] and Result stack: [5]
%         Init stack: ['*' 10 '/'] and Result stack: [4 5]
%         Init stack: [10 '/'] and Result stack: [20]
%         Init stack: ['/'] and Result stack: [10 20] (Note that we have divided (use "div" in oz) the second by the first element on the stack. This is the same for the minus.)
%         Init stack: [] and Result stack: [2]
declare
fun {Eval L}
   local
      EvalImpl

      Add
      Sub
      Mul
      Div
   in
      fun {Add L} (L.2.1 + L.1)|L.2.2 end
      fun {Sub L} (L.2.1 - L.1)|L.2.2 end
      fun {Mul L} (L.2.1 * L.1)|L.2.2 end
      fun {Div L} (L.2.1 div L.1)|L.2.2 end
      fun {EvalImpl E R}
         if E == nil then R.1
         else
            case E.1 of
               '+' then {EvalImpl E.2 {Add R}}
            [] '-' then {EvalImpl E.2 {Sub R}}
            [] '*' then {EvalImpl E.2 {Mul R}}
            [] '/' then {EvalImpl E.2 {Div R}}
            else
               {EvalImpl E.2 E.1|R}
            end
         end
      end

      {EvalImpl L nil}
   end
end


{Show '------Eval------'}
{Show {Eval [1 2 '+']} == 3}
{Show {Eval [2 2 '*']} == 4}
{Show {Eval [2 2 '/']} == 1}
{Show {Eval [2 3 '+' 4 '*' 10 '/']} == 2}
{Show {Eval [13 45 '+' 89 17 '-' '*']} == 4176}
