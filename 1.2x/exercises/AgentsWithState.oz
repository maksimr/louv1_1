declare

% This function describes state transition
% State * Message -> State
fun {CellProcess S M}
   case M of assign(New) then
      New
   [] access(Old) then
      Old=S S
   else S end
end

fun {NewAgent Process InitState}
   Port Stream
in
   Port={NewPort Stream}
   thread
      LastState
      fun {Execute S Ms}
         case Ms of M|Mr then
            {Execute {Process S M} Mr}
         end
      end
   in
      LastState={Execute InitState Stream}
   end

   proc {$ M}
      {Send Port M}
   end
end

C={NewAgent CellProcess 0}

% declare R {C access(R)} {Browse R}
% declare R {C assign(3)} {C access(R)} {Browse R}