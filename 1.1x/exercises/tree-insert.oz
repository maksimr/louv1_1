declare
T=tree(key:horse value:cheavl left:tree(key:dog value:chien left:leaf right:leaf) right:leaf)

fun {Insert K V T}
   case T of leaf then tree(key:K value:V left:leaf right:leaf)
   [] tree(key:X value:Y left:T1 right:T2) andthen K==X then tree(key:X value:V left:T1 right:T2)
   [] tree(key:X value:Y left:T1 right:T2) andthen K>X then tree(key:X value:Y left:T1 right:{Insert K V T2})
   [] tree(key:X value:Y left:T1 right:T2) andthen K<X then tree(key:X value:Y left:{Insert K V T1} right:T2)
   end
end


{Show '--------Insert---------'}
{Show {Insert cat chat T} == tree(key:horse value:cheavl
                                  left:tree(key:dog value:chien
                                            left:tree(key:cat value:chat
                                                      left:leaf
                                                      right:leaf)
                                            right:leaf)
                                  right:leaf)}