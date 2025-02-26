------------------------ MODULE MCWriteThroughCache ------------------------
EXTENDS WriteThroughCache

(***************************************************************************)
(* The following definitions are substituted for the constants Send,       *)
(* Reply, and InitMemInt of the MemoryFace module.  See                    *)
(* MCInternalMemory.tla for their explanations.                            *)
(***************************************************************************)
MCSend(p, d, oldMemInt, newMemInt)  ==  newMemInt = <<p, d>>
MCReply(p, d, oldMemInt, newMemInt) ==  newMemInt = <<p, d>>
MCInitMemInt == {<<CHOOSE p \in Proc : TRUE, NoVal>>}

omem == vmem
octl == [p \in Proc |-> IF ctl[p] = "waiting" THEN "busy" ELSE ctl[p]]
obuf == buf

IM == INSTANCE InternalMemory WITH mem <- omem, ctl <- octl, buf <- obuf
IMTypeInvariant == IM!TypeInvariant
IMSpec == IM!ISpec
=============================================================================
