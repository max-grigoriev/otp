%%--------------------------------------------------------------------
%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2001-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%
%%
%%--------------------------------------------------------------------
%% File    : orber_iiop_tracer.erl
%% Purpose : Use for debugging only.
%%--------------------------------------------------------------------

-module(orber_iiop_tracer).





%% Interceptor functions.
-export([new_out_connection/5,
	 new_in_connection/5,
	 closed_in_connection/1,
	 closed_out_connection/1,
	 in_request_encoded/6,
	 in_reply_encoded/6,
	 out_reply_encoded/6,
	 out_request_encoded/6,
	 in_request/6,
	 in_reply/6,
	 out_reply/6,
	 out_request/6]).


%%--------------- INTERCEPTOR FUNCTIONS ----------------------
%%------------------------------------------------------------
%% function : new_in_connection
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
new_in_connection(_Arg, PHost, PPort, SHost, SPort) ->
    error_logger:info_msg("=============== new_in_connection ========~n"
			  "Node      : ~p~n"
			  "From      : ~s:~p~n"
			  "To        : ~s:~p~n"
			  "==========================================~n", 
			  [node(), PHost, PPort, SHost, SPort]),
    {PHost, PPort, SHost, SPort}.
 
%%------------------------------------------------------------
%% function : new_out_connection
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
new_out_connection(_Arg, PHost, PPort, SHost, SPort) ->
    error_logger:info_msg("=============== new_out_connection =======~n"
			  "Node      : ~p~n"
			  "From      : ~s:~p~n"
			  "To        : ~s:~p~n"
			  "==========================================~n", 
			  [node(), SHost, SPort, PHost, PPort]),
    {PHost, PPort, SHost, SPort}.

%%------------------------------------------------------------
%% function : closed_in_connection
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
closed_in_connection(Arg) ->
    error_logger:info_msg("=============== closed_in_connection =====~n"
			  "Node      : ~p~n"
			  "Connection: ~p~n"
			  "==========================================~n", 
			  [node(), Arg]),
    Arg.
 
%%------------------------------------------------------------
%% function : closed_out_connection
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
closed_out_connection(Arg) ->
    error_logger:info_msg("=============== closed_out_connection ====~n"
			  "Node      : ~p~n"
			  "Connection: ~p~n"
			  "==========================================~n", 
			  [node(), Arg]),
    Arg.
 
%%------------------------------------------------------------
%% function : in_request_encoded
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
in_request_encoded(Ref, _ObjKey, Ctx, Op, Bin, Args) ->
    error_logger:info_msg("=============== in_request_encoded =======~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Body      : ~p~n"
			  "Context   : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Bin, Ctx]),
    {Bin, Args}.
 
%%------------------------------------------------------------
%% function : in_reply_encoded
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
in_reply_encoded(Ref, _ObjKey, Ctx, Op, Bin, Args) ->
    error_logger:info_msg("============== in_reply_encoded ==========~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Body      : ~p~n"
			  "Context   : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Bin, Ctx]),
    {Bin, Args}.
 
%%------------------------------------------------------------
%% function : out_reply_encoded
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
out_reply_encoded(Ref, ObjKey, Ctx, Op, Bin, Args) ->
    error_logger:info_msg("============== out_reply_encoded =========~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Body      : ~p~n"
			  "Context   : ~p~n"
			  "Object    : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Bin, Ctx, ObjKey]),
    {Bin, Args}.
 
%%------------------------------------------------------------
%% function : out_request_encoded
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
out_request_encoded(Ref, _ObjKey, Ctx, Op, Bin, Args) ->
    error_logger:info_msg("============== out_request_encoded =======~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Body      : ~p~n"
			  "Context   : ~p~n"
			  "==========================================~n", 
              [Ref, Op, Bin, Ctx]),
    {Bin, Args}.
 
%%------------------------------------------------------------
%% function : in_request
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
in_request(Ref, ObjKey, Ctx, Op, Params, Args) ->
    error_logger:info_msg("=============== in_request ===============~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Parameters: ~p~n"
			  "Context   : ~p~n"
			  "Object    : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Params, Ctx, ObjKey]),
    {Params, Args}.
 
%%------------------------------------------------------------
%% function : in_reply
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
in_reply(Ref, _ObjKey, Ctx, Op, Reply, Args) ->
    error_logger:info_msg("=============== in_reply =================~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Reply     : ~p~n"
			  "Context   : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Reply, Ctx]),
    {Reply, Args}.
 
%%------------------------------------------------------------
%% function : out_reply
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
out_reply(Ref, ObjKey, Ctx, Op, Reply, Args) ->
    error_logger:info_msg("=============== out_reply ================~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Reply     : ~p~n"
			  "Context   : ~p~n"
			  "Object    : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Reply, Ctx, ObjKey]),
    {Reply, Args}.
 
%%------------------------------------------------------------
%% function : out_request
%% Arguments: 
%% Returns  : 
%%------------------------------------------------------------
out_request(Ref, _ObjKey, Ctx, Op, Params, Args) ->
    error_logger:info_msg("=============== out_request ==============~n"
			  "Connection: ~p~n"
			  "Operation : ~p~n"
			  "Parameters: ~p~n"
			  "Context   : ~p~n"
			  "==========================================~n", 
			  [Ref, Op, Params, Ctx]),
    {Params, Args}.




%%======================================================================
%% END OF MODULE
%%======================================================================

