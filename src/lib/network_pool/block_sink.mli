open Network_peer
open Mina_transition

include
  Mina_net2.Sink.S_with_void
    with type msg :=
          [ `Transition of External_transition.t Envelope.Incoming.t ]
          * [ `Time_received of Block_time.t ]
          * [ `Valid_cb of Mina_net2.Validation_callback.t ]

val create :
     logger:Logger.t
  -> slot_duration_ms:Block_time.Span.t
  -> ( [ `Transition of External_transition.t Envelope.Incoming.t ]
     * [ `Time_received of Block_time.t ]
     * [ `Valid_cb of Mina_net2.Validation_callback.t ] )
     Pipe_lib.Strict_pipe.Reader.t
     * t
