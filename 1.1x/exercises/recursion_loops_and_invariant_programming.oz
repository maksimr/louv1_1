% Factorial


%%
% Реализация факториала на основе математической
% формулировки
% Рекурентная формула для факториала:
%       | 0! = 1        n = 0,
% n! =  |
%       | n * (n - 1)!  n > 0
declare
fun {Fact1 N}
   if (N == 0) then 1 
   else
      N * {Factorial (N - 1)}
   end
end
{Show {Fact1 3}}


%%
% Реализация факториала по принципу сообщающихся сосудов
% В качестве сосудов выступают переменные i и a.
% Мы можешь уменьщать значение переменной i и в
% тоже вермя увеличивать значение переменной a,
% так, что-бы результирующее значение(n!) оставалось
% неизменным (Инвариант)
% 
% n! = i! * a
% n! = i * (i - 1)! * a
% n! = (i - 1)! * (a * i)
% n! = i'! * a' where i' = (i - 1) and a' = (a * i)
%
% 4! = 4! * 1
% 4! = 3! * 4
% 4! = 2! * 12
% 4! = 1! * 24
% 4! = 0! * 24
% 4! = 24
declare
fun {Fact2 I A}
   if (I == 0) then A
   else
      {Fact2 (I - 1) (I * A)}
   end
end
{Show {Fact2 10 1}}


%%
% Реализация фукнции которая считает сумму чисел
% использую принцип сообщающихся сосудов
%
%  s(n) = s(i)   + a ,    s(i)  = s(d1,d2,d3,...,dn), a = 0
%  s(n) = s(i')  + a',    s(i') = s(d1,d2,d3,...,d(n-1)), a = 0 + bn
%
%  s(123) = s(123) + 0
%  s(123) = s(23)  + (0 + 3)
%  s(123) = s(3)   + (3 + 2)
%  s(123) = (1 + 5)
%  s(123) = 6
declare
fun {SumDigits I A}
   if (I == 0) then A
   else
      {SumDigits (I div 10) (A + (I mod 10))}
   end
end
{Show {SumDigits 1234 0}}


%%
% Функция которая переворачивает число,
% без учета нуля
%
% n = s(d1,d2,...,dn) + 0
% n = s(d1,d2,...,dn-1) + (0*10 + dn)
% n = s(d1,d2,...,dn-2) + (dn*10 + d(n-1))
declare
fun {ReverseDigit Int}
   local Reverse in
      fun {Reverse Int Acc}
         if (Int == 0) then Acc
         else
            {Reverse (Int div 10) ((Acc * 10) + (Int mod 10))}
         end
      end
      {Reverse Int 0}
   end
end
{Show {ReverseDigit 1234}}


%%
% True Loop
% Реализация цикла(loop) через рекурсивный вызов функции
% и хвоставую рекурсию
declare
fun {While S}
   if ({IsDone S}) then S
   else
      {While {Transform S}}
   end
end


%%
% Реализация фукнции которая проверяет простое число или
% нет
declare
fun {Prime N}
   local PrimeImpl in
      fun {PrimeImpl I}
         if ((N mod I) == 0) then N == I
         else
            {PrimeImpl (I + 1)}
         end
      end

      if (N > 1) then {PrimeImpl 2}
      else false end
   end
end
{Show {Prime 1}}
{Show {Prime 3}}
{Show {Prime 4}}
{Show {Prime 5}}


%%
% Pow
% Функция возведения числа в степень
%       | 1            n = 0,
% x^n = |
%       | x * x^(n-1)  n > 0
declare
fun {Pow X N}
   if (N == 0) then 1
   else
      X * {Pow1 X (N - 1)}
   end
end
{Show {Pow 2 3}}


%%
% Pow2
% Оптимизация вычисления возведения в степень для четных чисел
%       | 1            n = 0,
% x^n = | x * x^(n-1)  когда n > 0 и нечетный
%       | y^2          когда n > 0 и четный, y = x^(n/2)
declare
fun {Pow2 X N}
   if (N == 0) then 1
   else
      if ((N mod 2) == 0) then
         local Y in
            Y={Pow2 X (N div 2)}
            Y * Y
         end
      else
         X * {Pow2 X (N - 1)}
      end
   end
end
{Show {Pow2 2 8}}


%%
% Pow3
% Реализация через инвариант
% x^n = y^i * a
% x^n = y^(i-1) * (a * y)  когда i нечетное
% x^n = (y*y)((n-2)/2) * a когда i четное
% x^n = a когда i = 0
declare
fun {Pow2 X N}
   local PowImpl in
      fun {PowImpl Y I A}
         if (I == 0) then A
         else
            if ((I mod 2) == 0) then
               {PowImpl (Y * Y) (I div 2) A}
            else
               {PowImpl Y (I - 1) (Y * A)}
            end
         end
      end
      {PowImpl X N 1}
   end
end
{Show {Pow2 2 8}}


%%
% Fibonacci
%          | 0                    n = 0,
% fib(n) = | 1                    n = 1,
%          | fib(n-1) + fib(n-2)  n > 1
declare
fun {Fib1 N}
   if (N == 0) then 0
   else
      if (N == 1) then 1
      else
         {Fib1 (N - 1)} + {Fib1 (N - 2)}
      end
   end
end
{Show {Fib1 10}}


%%
% Fib2
% Вычисление числа фибоначчи используя инвариант
%
% fib(n) = fib(y) + b + a
% fib(n) = fib(y-1) + (b + a) + b
declare
fun {Fib2 N}
   local FibImpl in
      fun {FibImpl Y A B}
         if (Y == 0) then A
         else
            if (Y == 1) then B
            else
               {FibImpl (Y-1)  B (A + B)}
            end
         end
      end
      {FibImpl N 0 1}
   end
end
{Show {Fib2 10}}