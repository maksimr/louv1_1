% Functional Paradigm (Functional Programming)

% Concepts:

% (1) Immutable variable
% Variable consist from identifier(X), value(10) and sign = which
% create variable in memroy(x)
% To get value of variable we use Environment(E)
% E(X) = x

declare
X=10
{Show X}


% (2) Function
% Function consist from indentifier(SumDigits), function arguments(X), function body and
% special keyword fun which create variable in memory(f)
% so function body is simple data which saved in memroy
% E(SumDigits) -> f

declare
fun {SumDigits X}
   (X mod 10) + (X div 10) mod 10 + (X div 100) mod 10
end
{Show {SumDigits 222}}


% (3) Function composition
% When inside on function we could call another function
declare
fun {SumDigits6 X}
   {SumDigits (X div 100)} + {SumDigits (X mod 1000)}
end
{Show {SumDigits6 222222}}


% (4) Condition (if)
fun {IsZero X}
   if (X == 0) then true
   else false end
end
{Show {IsZero 0}}
{Show {IsZero 1}}


% (5) Recursion
fun {SumDigitsR X}
   if (X == 0) then 0
   else
    (X mod 10) + {SumDigitsR (X div 10)}
   end
end
{Show {SumDigitsR 12345}}