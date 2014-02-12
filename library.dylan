Module: dylan-user

define library redis
  use dylan;
  use common-dylan;
  use c-ffi;
  use io;
  
  export redis;

end library;

define module redis
  use common-dylan;
  use byte-vector;
  use c-ffi;
  use dylan-direct-c-ffi;
  use streams;
	

  export
    redisConnect,
    redisCommand,
    freeReplyObject,
    redisFree,
    redisCommandArgv;

end module;
