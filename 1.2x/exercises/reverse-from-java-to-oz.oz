%%
% public static LinkedList<Character> reverse(LinkedList<Character> s){
%     LinkedList<Character> temp = new LinkedList<Character>();
%     for(char c : s){
%         temp.addFirst(c);
%     }
%     return temp;
% }
declare
fun {Reverse S}
   local I={NewCell S} in
      local Temp={NewCell nil} in
         for C in @I do
            Temp:=C|@Temp
         end

         @Temp
      end
   end
end
