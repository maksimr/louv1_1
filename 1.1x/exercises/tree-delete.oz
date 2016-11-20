declare
T=tree(key:horse value:cheavl
       left:tree(key:dog value:chien
                 left:tree(key:cat value:chat left:leaf right:leaf)
                 right:tree(key:elephant value:elephant left:leaf right:leaf))
       right:tree(key:mouse value:souris
                  left:tree(key:monkey value:singe left:leaf right:leaf)
                  right:tree(key:tiger value:tiger left:leaf right:leaf)))


fun {RemoveSmallest T}
   case T of leaf then leaf
   [] tree(key: X value:V left:leaf right:T2) then
      tripple(X V T2)
   [] tree(key: X value:V left:T1 right:T2) then
      case {RemoveSmallest T1} of tripple(SX SV NT) then
         tripple(SX SV tree(key: X value:V left:NT right:T2))
      else
         tripple(X V T2)
      end
   end
end


fun {Delete K T}
   case T of leaf then leaf
   [] tree(key:X value:V left:T1 right:T2) andthen K==X then 
      case {RemoveSmallest T2} of tripple(SX SV NT) then
         tree(key:SX value:SV left:T1 right:NT)
      else
         T1
      end
   [] tree(key:X value:V left:T1 right:T2) andthen K>X then tree(key:X value:V left:T1 right:{Delete K T2})
   [] tree(key:X value:V left:T1 right:T2) andthen K<X then tree(key:X value:V left:{Delete K T1} right:T2)
   end
end


{Show '--------Delete---------'}
{Show {Delete horse T} == tree(key:monkey value:singe
                               left:tree(key:dog value:chien
                                         left:tree(key:cat value:chat left:leaf right:leaf)
                                         right:tree(key:elephant value:elephant left:leaf right:leaf))
                               right:tree(key:mouse value:souris
                                          left:leaf
                                          right:tree(key:tiger value:tiger left:leaf right:leaf)))}