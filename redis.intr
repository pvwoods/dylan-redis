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

define method main ()
  let context = redisConnect("127.0.0.1", 6379);
  redisCommand(context, "SET dylan rocks");
end method main;

main();
