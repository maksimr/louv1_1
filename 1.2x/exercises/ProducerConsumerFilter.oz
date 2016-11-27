%%
% Reminder: "A stream is a list that ends in an unbound variable. The stream can be closed by binding the end to nil." (see the lesson on streams).
%
% In this exercise, we will work with the Producer-Consumer system using filters. More precisely, you are asked to provide these three agents:
%
% {Producer N}: this agent produces a stream of consecutive integers beginning with 1 and ending with N (the stream is closed when N is inserted).
% {Consumer S}: this agent receives a stream of integers S and returns the sum of these elements.
% {Filter S}: this agent receives a stream of integers S and returns a stream based on S containing only odd numbers.
% You have to produce a stream using Producer and consume this stream using Consumer. This stream has to pass through the filter named Filter. For instance, if N = 5 then {Producer N} returns a steam of consecutive integers beginning with 1 and ending with 5. Meanwhile, {Filter S} receives the stream and creates another stream containing only the odd numbers and {Consumer S} receives the stream with odd numbers and computes the sum.
%
% Create the three agents, use them with N = 20 and Browse the resulting sum. Do not forget to use threads.
declare
fun {Producer N}
   thread
      local ProducerImpl in
         fun {ProducerImpl V N}
            if (V > N) then nil
            else
               V|{ProducerImpl (V + 1) N}
            end
         end

         {ProducerImpl 1 N}
      end
   end
end
fun {Consumer N}
   thread
      case N of nil then 0
      [] H|T then H + {Consumer T}
      end
   end
end
fun {Filter S}
   thread
      case S of nil then nil
      [] H|T then
         if (H mod 2) == 0 then
            {Filter T}
         else
            H|{Filter T}
         end
      end
   end
end

proc {Print S}
   {Wait S}
   {Show S}
end

local V N in
   V = {Consumer {Filter {Producer N}}}
   N=20
   {Print V}
end