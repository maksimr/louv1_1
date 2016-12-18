declare
proc {Math M}
   case M of add(N M A) then A=N+M
   [] mul(N M A) then A=N*M
   else skip end
end

proc {ForLoop Ms P}
   case Ms of M|Mr then
      {P M}
      {ForLoop Mr P}
   else skip end
end

fun {NewAgent0 Process}
   Port Stream
in
   Port={NewPort Stream}
   thread {ForLoop Stream Process} end
   proc {$ M}
      {Send Port M}
   end
end

Ma={NewAgent0 Math}

% declare B
% {Ma add(2 8 B)}
% {Browse B}