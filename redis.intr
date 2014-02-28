module: redis

define interface
  #include {
    "hiredis.h"
  },

  equate: {"char *" => <c-string>},

  import: {
    "redisConnect",
    "redisCommand",
    "freeReplyObject",
    "redisFree",
    "redisCommandArgv"
  }

end;

define class <redis-client> (<object>)

  slot connected   :: <boolean>
  slot host        :: <string>, init-keyword: host:;
  slot port        :: <integer>, init-keyword: port:;
  slot context     :: <redisContext>

  define method connect ()
    let context = redisConnect(host, port);
    if (context)
      connected = true;
    end if;
  end method;

  define method set (key :: <string>, value :: <string>)
    if (connected)
      redisCommand(context, format-to-string("SET %= %=", key, value));
    end if;
  end method;


end class;

define method main ()
  //let context = redisConnect("127.0.0.1", 6379);
  //redisCommand(context, "SET dylan rocks");
  let redis = make(<redis-client>, host:"127.0.0.1", port:6379);
  redis.set("foo", "bar");
end method main;



main();
