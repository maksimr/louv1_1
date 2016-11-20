%%
% List
% Рекурсия используется как для вычислений так и для
% данных
%
% Список - это рекурсивная структура данных, т.e. определение
% списка содержит список
% 
% Extended Backus-Naur form (EBNF)
% <List T> ::= nil | T `|` <list T>


%%
% Реализация функции Append
{Show 'AppendLists'}
declare
L1=[1 2 3]
L2=[4 5 6]
fun {AppendLists L1 L2}
   if (L1 == nil) then L2
   else
      L1.1|{AppendLists L1.2 L2}
   end
end
{Show {AppendLists L1 L2} == {Append L1 L2}}


{Show 'Sum'}
declare
fun {Sum L}
   if (L == nil) then 0
   else
      L.1 + {Sum L.2}
   end
end
{Show {Sum [1 2 3]} == 6}


{Show 'Tail-recursive Sum'}
declare
fun {Sum2 L}
   local SumImpl in
      fun {SumImpl L A}
         if (L == nil) then A
         else
            {SumImpl L.2 (A + L.1)}
         end
      end

      {SumImpl L 0}
   end
end
{Show {Sum2 [1 2 3]} == 6}


{Show 'Nth element of a list'}
declare
fun {Nth L N}
   if (N == 0) then L.1
   else
      {Nth L.2 (N - 1)}
   end
end
{Show {Nth [1 2 3] 1} == 2}


{Show 'Find String'}
declare
fun {Prefix L1 L2}
   if (L1 == nil) then true
   else
      if (L2 == nil) then false
      else
         if (L1.1 == L2.1) then {Prefix L1.2 L2.2}
         else false
         end
      end
   end
end
fun {FindString L1 L2}
   if ({Prefix L1 L2}) then
      true
   else
      if (L2 == nil) then false
      else
         {FindString L1 L2.2}
      end
   end
end

{Show {Prefix [1 2] [1 2 3 4]} == true}
{Show {Prefix [2 1] [1 2 3 4]} == false}
{Show {FindString [2 3] [1 2 3 4]} == true}
{Show {FindString nil nil} == true}
{Show {FindString [9 9] [1 2 3 9]} == false}
{Show {FindString [9 9] [9]} == false}


{Show 'Flatten'}
declare
fun {FlattenList L}
   case L of H|T then
      case H of H2|T2 then
         {FlattenList {AppendLists H T}}
      else
         H|{FlattenList T}
      end
   else
      L
   end
end

{Show {FlattenList [[1 2 3]]} == [1 2 3]}
{Show {FlattenList [1 2 3 [4 5 6]]} == [1 2 3 4 5 6]}
{Show {FlattenList [1 [2 3 4] [5 [6]] 7 8 [9 10] 11 [[[12]]]]} == [1 2 3 4 5 6 7 8 9 10 11 12]}