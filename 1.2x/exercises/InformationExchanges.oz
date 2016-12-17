% In this exercise, you will work with ports.

% You are asked to produce a function that receives a port as input and returns a port as output.
% This function is named Eval and is characterized as follow:

% The signature is: fun {Eval Port}
% Port is the port that has to be used to send your answer
% Another port has to be sent as output to receive the elements you will have to work on.
% Therefore, you will create a port P and a stream S (linked to this port).
% The Eval function has to return this port P and you will have to work on the stream S that will be completed over time.
% The stream S will contain pairs Function#Input,
% where Function is a function of one argument and Input
% is an element that will be given to Function as input.
% For each of these pairs, you will have to send on Port (the port received as input)
% the result of the call {Function Input}.
% Hint: Think about the fact that you can create another procedure in Eval,
% which may deal with the stream S.
% Therefore, it is possible to call this other procedure in a thread and then return the port P.
declare
fun {Eval Port}
   local P S Listen in
      P={NewPort S}

      proc {Listen S}
         case S of Function#Input|Sr then
            {Send Port thread {Function Input} end}
            {Listen Sr}
         end
      end

      thread {Listen S} end

      P
   end
end

fun {Pow X}
   X * X
end


S
MyPort={NewPort S}
EvalPort={Eval MyPort}

thread
   case S of Result then
      {Browse Result}
   end
end

{Send EvalPort Pow#2}