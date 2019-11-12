-module(a01039859_hw12).

-export([startAppend/0, append/1,factorialTail/2,factorialAux/0,factorial/1,startFoF/2,foF/1,run/0,marco/2,polo/2, requestAux/2,create/2,request/1,deposit/2,startBank/0,widthdraw/2,balance/0,stopBank/0,depositAux/3, withdrawAux/3,menu/1]).

append(X)->
 receive
    N when (N > 0) and (is_number(N)) -> io:format("Number ~p has been added to the list.\n",[N]),
    append([N]++X);
    N when N < 1 -> io:format("The  numbers  registered  by the  process  are : ~p~n ",[X])
end.

startAppend()->
    X = [],
    Pid = spawn(?MODULE,append,[X]),
    register(appendNumber, Pid).

factorialTail(Low,Top) ->
    if Low == Top -> Top;
    true ->  Low * factorialTail(Low+1,Top)
    end.

factorialAux()->
    receive
     {Pid,Low,Top} -> Pid ! factorialTail(Low,Top)
    end.

factorial(X)->
    Pid = self(),
    PidGreater = spawn(?MODULE,factorialAux,[]),
    PidLower = spawn(?MODULE,factorialAux,[]),
    PidGreater ! {Pid,1,X/2},
    receive
        N->
            PidLower ! {Pid,X/2+1,X},
            receive
            M -> N*M
            end
    end.
    
foF(ColorInput)->
    Pid = self(),
    receive
    {Letter, Message}->
        Letter ! Pid,
        receive
            N -> 
                if ColorInput == N ->
                io:format("Received a message from a friend process ~p : ~p~n",[whereis(Letter),Message]);
                true->io:format("Process ~p is not my friend. I will ignore its message.\n",[whereis(Letter)])
                end
        end,
        foF(ColorInput);
     PidInput -> PidInput ! ColorInput,
        foF(ColorInput)
    end.


startFoF(Letter,Color)->
    Pid = spawn(?MODULE, foF,[Color]),
    register(Letter,Pid).
    
marco(X,Y)->
    receive
        {XInput,YInput} -> 
            DiffX = if XInput > 0 -> 1; 
                    XInput < 0 -> -1; 
                    true -> 0 end,
            DiffY = if YInput > 0 -> 1; 
                    YInput < 0 -> -1; 
                    true -> 0 end,
            io:format("Marco moves to (~p, ~p)~n", [X+DiffX, Y+DiffY]),
            pPolo ! {X+XInput, Y+YInput},
            marco(X+DiffX, Y+DiffY);
        finish -> io:format("Marco found me! I was hiding at position (~p, ~p)",[X,Y])
    end.

polo(X,Y)->
    receive
        {XInput, YInput} ->
            if
                (XInput == X) and (YInput == Y) -> pMarco ! finish;
                true -> pMarco ! {X-XInput, Y-YInput},
                        polo(X, Y)
                end
    end.

run()->
    X1= rand:uniform(20),
    X2= rand:uniform(20),
    Y1= rand:uniform(20),
    Y2= rand:uniform(20),
    PidPolo = spawn(?MODULE, polo,[X1,Y1]),
    register(pPolo, PidPolo),
    io:format("Marco  starts  at  position(~p,~p)",[X2,Y2]),
    PidMarco = spawn(?MODULE, marco,[X2,Y2]),
    register(pMarco, PidMarco),
    io:format("Polo is  hidden (we do not  know  where  he is)..."),
    PidMarco ! PidPolo.


create(_id, _amount)->
    if _amount < 500 -> io:format("Please enter a number greater than 500\n");
        true -> bank ! {create, _id, _amount},
                io:format("Account_id : ~p  Amount: ~p~n", [_id, _amount])
    end. 

request(_id)->
    bank ! {request, self(), _id},
    receive
        _amount -> io:format("Account_id ~p: Amount: ~p\n", [_id, _amount])
    end.

deposit(_id,_amount)->
     if
        _amount < 20 ->
            io:format("Please enter a number greater than 20~n");
        true -> bank ! {deposit, _id, _amount},
            io:format("A deposit of ~p has been made into account ~p \n", [_amount, _id])
    end. 

widthdraw(_id,_amount )->
    if
        _amount < 1 ->
            io:format("Please enter a number greater than 1~n");
        true -> bankid ! {withdraw, _id, _amount},
            io:format("A widthdrawal of ~p has been made from account ~p~n", [_amount, _id])
    end.

balance()->
    bank ! {balance, self()},
    receive
        X -> io:format("Accounts: ~p~n", [X])
    end.

stopBank()-> bank ! stop.

requestAux([], _) -> 0;
requestAux([{A, X}|XS], B) ->
    if A == B -> X;
        true -> requestAux(XS, B)
    end.

depositAux([], _, _) -> [];
depositAux([{X, A}|Xs], Y, B) ->

    if X == Y -> [{Y, A+B}|Xs];
        true -> [{Y, A}|depositAux(Xs, Y, B)]
    end.

withdrawAux([], _, _) -> [];
withdrawAux([{X, A}|Xs], Y, B) ->
    if X == Y -> [{Y, A-B}|Xs];
        true -> [{Y, A}|withdrawAux(Xs, Y, B)]
    end.

menu(X)->

    receive
        {_option, _id, _amount} 
            when _option == create ->
            menu([{_id, _amount}| X]);

        {_option, _id} 
            when _option == balance ->
            _id ! X,
            menu(X);

        {_option, _id,  _amount} 
            when _option == request ->
            _id ! requestAux(X, _amount),
            menu(X);

        {_option, _id, _amount} 
            when _option == deposit ->
            menu(depositAux(X, _id, _amount));

        {_option, _id, _amount} 
            when _option == withdraw ->
            menu(withdrawAux(X, _id, _amount));

        stop -> unregister(bank)
    end.



startBank()-> register(bank, spawn(?MODULE, menu, [[]])).



    
