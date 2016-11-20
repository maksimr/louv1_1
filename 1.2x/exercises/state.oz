%%
% State - is sequence of values calculated progressively,
% which contains intermidiate results of a computation
%
% Состояние связанно с понятием времени.
% В нашем случае время это последовательность изменений
% которые мы можем отслеживать внутри программы
%
declare
A=5
B=6

C={NewCell A}
{Show @C}

C:=B
{Show @C}