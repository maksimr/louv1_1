%%
% In this exercise, you will have to track characters in a stream. In order to do that, you have
% to create a filter named Counter that takes a stream
% of characters as input and returns another stream in which every
% element is a list of couples structured as
%
% Character#Number of time this Character appears
%
% For instance, from the stream a|b|a|c|_, your filter Counter should produce:
%
% [a#1]|[a#1 b#1]|[a#2 b#1]|[a#2 b#1 c#1]|_
% Your filter will be tested in the following framework for several input streams InS:
declare
fun {Counter S}
   local CounterImpl IsContains Append Increment in
      fun {Increment L X}
         if L == nil then nil
         else
            case L.1 of A#B then
               if (A == X) then
                  A#(B + 1)|L.2
               else
                  L.1|{Increment L.2 X}
               end
            end
         end
      end
      fun {Append L X}
         if L == nil then
            X#1|nil
         else
            L.1|{Append L.2 X}
         end
      end
      fun {IsContains L X}
         if L == nil then false else
            case L.1 of A#_ then
               if (A == X) then
                  true
               else
                  {IsContains L.2 X}
               end
            end
         end
      end
      fun {CounterImpl S L}
         if S == nil then nil
         else
            case S of H|T then
               if ({IsContains L H}) then
                  local L2 in
                     L2={Increment L H}
                     (L2)|{CounterImpl T L2}
                  end
               else
                  local L2 in
                     L2={Append L H}
                     (L2)|{CounterImpl T L2}
                  end
               end
            end
         end
      end

      thread
         {CounterImpl S nil}
      end
   end
end

proc {Print S}
   {Wait S}
   {Show S}
end

{Print {Counter nil}}
{Print {Counter a|a|a|a|a|nil}}
{Print {Counter a|b|c|nil}}
{Print {Counter a|b|c|a|b|c|nil}}