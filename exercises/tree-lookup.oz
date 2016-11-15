declare
T=tree(key:horse value:cheavl
       left:tree(key:dog value:chien
                 left:tree(key:cat value:chat left:leaf right:leaf)
                 right:tree(key:elephant value:elephant left:leaf right:leaf))
       right:tree(key:mouse value:souris
                  left:tree(key:monkey value:singe left:leaf right:leaf)
                  right:tree(key:tiger value:tiger left:leaf right:leaf)))


fun {Lookup K T}
   case T of leaf then notfound
   [] tree(key:X value:V left:T1 right:T2) andthen K==X then found(V)
   [] tree(key:X value:V left:T1 right:T2) andthen K>X then {Lookup K T2}
   [] tree(key:X value:V left:T1 right:T2) andthen K<X then {Lookup K T1}
   end
end


{Show '--------Lookup---------'}
{Show {Lookup elephant T} == found(elephant)}
{Show {Lookup mouse T}    == found(souris)}
{Show {Lookup pig T}      == notfound}