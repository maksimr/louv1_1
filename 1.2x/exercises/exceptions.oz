%%
% When building data structures, you have to make sure that an "alert" is raised when the user does something that he cannot do. The first step is to find where something that is not allowed can be done, and consider this case to raise an "alert", i.e. an exception.
%
% In this exercise, you are asked to write the classes Stack and Queue with exceptions.
%
% The methods of Stack are the following:
%
% init: initializes the stack.
% size($): Returns the size of the stack.
% isEmpty($): Returns true if and only if the stack is empty.
% top($): Returns the top element of the stack (without removing it). If the stack is empty, raises an exception!
% push(X): Puts X at the top of the stack.
% pop($): Removes and returns the top element of the stack. If the stack is empty, raises an exception!
% The methods of Queue are the following:
%
% init: initializes the queue.
% size($): Returns the size of the queue.
% isEmpty($): Returns true if and only if the queue is empty.
% front($): Returns the first element put in the queue (without removing it). If the queue is empty, raises an exception!
% enqueue(X): Puts X at the end of the queue.
% dequeue($): Removes and returns the first element put in the queue. If the queue is empty, raises an exception!%
declare
class Stack
   attr x
   meth init
      x:=nil
   end
   meth size(R)
      R={Length @x}
   end
   meth isEmpty(R)
      if (@x == nil) then
         R=true
      else
         R=false
      end
   end
   meth top(R)
      local IsEmpty in
         {self isEmpty(IsEmpty)}

         if (IsEmpty) then
            raise emptyStackException end
         else
            R=@x.1
         end
      end
   end
   meth push(X)
      x:=X|@x
   end
   meth pop(R)
      local IsEmpty in
         {self isEmpty(IsEmpty)}
         if (IsEmpty) then
            raise emptyStackException end
         else
            R=@x.1
            x:=@x.2
         end
      end
   end
end

class Queue
   attr x
   meth init
      x:=nil
   end
   meth size(R)
      R={Length @x}
   end
   meth isEmpty(R)
      if (@x == nil) then
         R=true
      else
         R=false
      end
   end
   meth front(R)
      local IsEmpty in
         {self isEmpty(IsEmpty)}

         if (IsEmpty) then
            raise emptyQueueException end
         else
            R=@x.1
         end
      end
   end
   meth enqueue(X)
      local L={NewCell nil} L2={NewCell X|nil} in
         for I in @x do L:=I|@L end
         for I in @L do L2:=I|@L2 end
         x:=@L2
      end
   end
   meth dequeue(R)
      local IsEmpty in
         {self isEmpty(IsEmpty)}

         if (IsEmpty) then
            raise emptyQueueException end
         else
            R=@x.1
            x:=@x.2
         end
      end
   end
end

{Show '------------Stack---------'}
declare
S
V1
V2
R
IsEmpty
SSize

V1=5
S={New Stack init}
{S push(V1)}
{S top(V2)}
{Show V2 == V1}


{S size(SSize)}
{Show SSize == 1}

{S pop(R)}
{Show R == V1}

{S isEmpty(IsEmpty)}

{Show IsEmpty == true}


{Show '------------Queue---------'}
declare
Q
V1
V2
R
QSize
IsEmpty

V1=5
Q={New Queue init}
{Q enqueue(V1)}
{Q front(V2)}
{Show V2 == V1}

{Q dequeue(R)}
{Show R == V1}

{Q isEmpty(IsEmpty)}

{Show IsEmpty == true}