import std.socket;
import std.stdio;
import std.conv;

bool connect(string host , ushort port , int seconds)
{
     import std.stdio;

     string strPort = to!string(port);
     AddressInfo[] arr = getAddressInfo(host , strPort ,
         AddressInfoFlags.CANONNAME);
     if(arr.length == 0)
     {
        writeln("getAddressInfo error");
        return false;

     }
     writeln(arr);

    Socket socket = new Socket(arr[0].family , arr[0].type , arr[0].protocol);
    socket.blocking(false);
    writeln(arr[0].address);
    socket.connect(arr[0].address);

    SocketSet[3] sets = new SocketSet[3];
    foreach (ref set; sets)
    {
        set = new SocketSet();
        set.reset();
        set.add(socket);
    }

    TimeVal val;

    val.seconds = seconds ;
    val.microseconds = 0;


    int ret = Socket.select(sets[0], sets[1], sets[2]  , &val);
    if(ret < 0)
    {
        writeln("some error or interput");
        return false;

    }
    else if(ret == 0)
    {
        writeln("timeout");
        return false;

    }
    else
    {
        writeln("Readable: ", sets[0].isSet(socket));
        writeln("Writable: ", sets[1].isSet(socket));
        writeln("Errored : ", sets[2].isSet(socket));
        writeln(socket.remoteAddress);
        if(sets[1].isSet(socket))
        {
            writeln("connected");
            return true;               
        }

        return false;           
    }
}

void main()
{
    //1234 not listen in my OS. but socket.select show me connected.
    connect("127.0.0.1" , 1234 ,3);
}
