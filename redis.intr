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
