declare
fun {Fact I}
   local FactImp in
      fun {FactImp I A}
         if (I == 0) then A
         else {FactImp (I - 1) (I * A)} end
      end

      {FactImp I 1}
   end
end

fun {ProductDigits A B}
   local ProductDigitsImpl in
      fun {ProductDigitsImpl X Y A}
         if (X == Y) then A
         else
            {ProductDigitsImpl (X - 1) Y (X * A)}
         end
      end

      {ProductDigitsImpl A (B - 1) 1}
   end
end


%%
% Функция вычисляющая число комбинаций
% N - количество элементов
% K - из скольки элементов состоит комбинация
fun {Comb1 N K}
   {Fact N} div ({Fact K} * {Fact (N - K)})
end

{Show 'Comb1'}
{Show {Comb1 10 3} == 120}
{Show {Comb1 10 0} == 1}


%%
% Оптимизация (a): Избавляемся от лишних факториалов
fun {Comb2 N K}
   {ProductDigits N (N - K + 1)} div ({Fact K})
end

{Show 'Comb2'}
{Show {Comb2 10 3} == 120}
{Show {Comb2 10 0} == 1}


%%
% Оптимизация (b)
fun {Comb3 N K}
   if (K > (N div 2)) then
      {Comb2 N (N - K)}
   else
      {Comb2 N K}
   end
end

{Show 'Comb3'}
{Show {Comb3 10 3} == 120}
{Show {Comb3 10 0} == 1}


%%
% Применение математической индукции для проверки
% корректности функции Pascal
% Pascal(1) =  1
% Pascal(n) =  2^n
% Pascal(n + 1) =  2^n * 2 = 2^(n + 1)
%
%            1           - 1
%           1 1          - 2
%          1 2 1         - 4
%         1 3 3 1        - 8
%        1 4 6 4 1       - 16
%      1 5 10 10 5 1     - 32