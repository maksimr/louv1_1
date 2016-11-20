%%
% You are a "record expert", specialized in the fabric of records. Your boss asked you to write an algorithm from all the machines that only consider lists as input. Your job is to write a function that takes a list as input and produces a record, in order for these machines to deal with records as input, despite the fact that they consider only lists as input.
%
% You are asked to provide the body of the function Transform, which takes a list and returns a record. The list contains the components to build the record. Here is the function signature:
%                 fun {Transform L}
%
% The list (named L) always contains three elements:
%
% The first element is the label of the record;
% The second element is a list containing the features of the record;
% The third element is a list, which has the same length as the second element, containing the values stored in the fields of the record.
% The nth element of the L second element is the field name corresponding to the field value represented by the nth element of the L third element. This explains why the two lists have the same length. For instance, from [z [3 a] [b 5]], Transform produces z(3:b a:5).
%
% Be careful! If one of the field values (third element) is a list, then this list has the same format as L and has also to be transformed into a record!
%
% Think about the AdjoinAt function. {AdjoinAt z(3:b a:5) p 5} produces z(3:b a:5 p:5).
%
% It may be useful to use {Record.make Label Features}. For instance, {Record.make x [a b c]} produces x(a:_ b:_ c:_). After that, you can bound the unbound variables (e.g. R.a = 3, which produces x(a:3 b:_ c:_), if R = {Record.make x [a b c]} ).
%
declare
fun {Transform L}
   case L of Label|Keys|Values|nil then
      local R MakeRecord in
         R={Record.make Label Keys}
         fun {MakeRecord R FieldsName FieldsValue}
            if (FieldsName == nil) then R
            else
               {
                MakeRecord
                {AdjoinAt R FieldsName.1 {Transform FieldsValue.1}}
                FieldsName.2
                FieldsValue.2
               }
            end
         end

         {MakeRecord R Keys Values}
      end
   else
      L
   end
end

{Show {Transform [z [3 a] [b 5]]} == z(3:b a:5)}
{Show {Transform [z [a] [[b [c] [1]]]]} == z(a:b(c: 1))}