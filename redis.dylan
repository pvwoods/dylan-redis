module: redis

define C-pointer-type <c-string> => <C-signed-char>;
define constant <__darwin-size-t> = <C-unsigned-long>;

define constant <size-t> = <__darwin-size-t>;

define C-pointer-type <redisReply*> => <redisReply>;
define C-pointer-type <redisReply**> => <redisReply*>;
define C-struct <redisReply>
  slot redisReply$type :: <C-signed-int>;
  slot redisReply$integer :: <C-signed-long>;
  slot redisReply$len :: <C-signed-int>;
  slot redisReply$str :: <c-string>;
  slot redisReply$elements :: <C-unsigned-long>;
  slot redisReply$element :: <redisReply**>;
end;

define C-pointer-type <redisReadTask*> => <redisReadTask>;
define C-struct <redisReadTask>
  slot redisReadTask$type :: <C-signed-int>;
  slot redisReadTask$elements :: <C-signed-int>;
  slot redisReadTask$idx :: <C-signed-int>;
  slot redisReadTask$obj :: <C-void*>;
  slot redisReadTask$parent :: <redisReadTask*>;
  slot redisReadTask$privdata :: <C-void*>;
end;

define C-pointer-type <redisReadTask*> => <redisReadTask>;
define constant <createString> = <C-function-pointer>;
define constant <createArray> = <C-function-pointer>;
define constant <createInteger> = <C-function-pointer>;
define constant <createNil> = <C-function-pointer>;
define constant <freeObject> = <C-function-pointer>;
define C-struct <redisReplyObjectFunctions>
  slot redisReplyObjectFunctions$createString :: <createString>;
  slot redisReplyObjectFunctions$createArray :: <createArray>;
  slot redisReplyObjectFunctions$createInteger :: <createInteger>;
  slot redisReplyObjectFunctions$createNil :: <createNil>;
  slot redisReplyObjectFunctions$freeObject :: <freeObject>;
end;

define constant <char<@128>> = <c-string>;
define constant <redisReadTask<@9>> = <redisReadTask*>;
define C-pointer-type <redisReplyObjectFunctions*> => <redisReplyObjectFunctions>;
define C-struct <redisReader>
  slot redisReader$err :: <C-signed-int>;
  array slot redisReader$errstr :: <C-signed-char>, length: 128;
  slot redisReader$buf :: <c-string>;
  slot redisReader$pos :: <C-unsigned-long>;
  slot redisReader$len :: <C-unsigned-long>;
  slot redisReader$maxbuf :: <C-unsigned-long>;
  array slot redisReader$rstack :: <redisReadTask>, length: 9;
  slot redisReader$ridx :: <C-signed-int>;
  slot redisReader$reply :: <C-void*>;
  slot redisReader$fn :: <redisReplyObjectFunctions*>;
  slot redisReader$privdata :: <C-void*>;
end;

define C-pointer-type <redisReader*> => <redisReader>;
define C-function redisReaderCreate
  result res :: <redisReader*>;
  c-name: "redisReaderCreate";
end;

define C-function redisReaderFree
  input parameter r_ :: <redisReader*>;
  c-name: "redisReaderFree";
end;

define C-function redisReaderFeed
  input parameter r_ :: <redisReader*>;
  input parameter buf_ :: <c-string>;
  input parameter len_ :: <size-t>;
  result res :: <C-signed-int>;
  c-name: "redisReaderFeed";
end;

define C-pointer-type <statically-typed-pointer*> => <C-void*>;
define C-function redisReaderGetReply
  input parameter r_ :: <redisReader*>;
  input parameter reply_ :: <statically-typed-pointer*>;
  result res :: <C-signed-int>;
  c-name: "redisReaderGetReply";
end;

define C-function freeReplyObject
  input parameter reply_ :: <C-void*>;
  c-name: "freeReplyObject";
end;

define C-pointer-type <char**> => <c-string>;
define constant <__darwin-va-list> = <C-void*>;

define constant <va-list> = <__darwin-va-list>;

define C-function redisvFormatCommand
  input parameter target_ :: <char**>;
  input parameter format_ :: <c-string>;
  input parameter ap_ :: <va-list>;
  result res :: <C-signed-int>;
  c-name: "redisvFormatCommand";
end;

define C-function redisFormatCommand
  input parameter target_ :: <char**>;
  input parameter format_ :: <c-string>;
  result res :: <C-signed-int>;
  c-name: "redisFormatCommand";
end;

define C-pointer-type <size-t*> => <size-t>;
define C-function redisFormatCommandArgv
  input parameter target_ :: <char**>;
  input parameter argc_ :: <C-signed-int>;
  input parameter argv_ :: <char**>;
  input parameter argvlen_ :: <size-t*>;
  result res :: <C-signed-int>;
  c-name: "redisFormatCommandArgv";
end;

define C-struct <redisContext>
  slot redisContext$err :: <C-signed-int>;
  array slot redisContext$errstr :: <C-signed-char>, length: 128;
  slot redisContext$fd :: <C-signed-int>;
  slot redisContext$flags :: <C-signed-int>;
  slot redisContext$obuf :: <c-string>;
  slot redisContext$reader :: <redisReader*>;
end;

define C-pointer-type <redisContext*> => <redisContext>;
define C-function redisConnect
  input parameter ip_ :: <c-string>;
  input parameter port_ :: <C-signed-int>;
  result res :: <redisContext*>;
  c-name: "redisConnect";
end;

define constant <__darwin-time-t> = <C-signed-long>;

define constant <__int32-t> = <C-signed-int>;

define constant <__darwin-suseconds-t> = <__int32-t>;

define C-struct <timeval>
  slot timeval$tv-sec :: <C-signed-long>;
  slot timeval$tv-usec :: <C-signed-int>;
end;

define C-function redisConnectWithTimeout
  input parameter ip_ :: <c-string>;
  input parameter port_ :: <C-signed-int>;
  input parameter tv_ :: <timeval>;
  result res :: <redisContext*>;
  c-name: "redisConnectWithTimeout";
end;

define C-function redisConnectNonBlock
  input parameter ip_ :: <c-string>;
  input parameter port_ :: <C-signed-int>;
  result res :: <redisContext*>;
  c-name: "redisConnectNonBlock";
end;

define C-function redisConnectUnix
  input parameter path_ :: <c-string>;
  result res :: <redisContext*>;
  c-name: "redisConnectUnix";
end;

define C-function redisConnectUnixWithTimeout
  input parameter path_ :: <c-string>;
  input parameter tv_ :: <timeval>;
  result res :: <redisContext*>;
  c-name: "redisConnectUnixWithTimeout";
end;

define C-function redisConnectUnixNonBlock
  input parameter path_ :: <c-string>;
  result res :: <redisContext*>;
  c-name: "redisConnectUnixNonBlock";
end;

define C-function redisSetTimeout
  input parameter c_ :: <redisContext*>;
  input parameter tv_ :: <timeval>;
  result res :: <C-signed-int>;
  c-name: "redisSetTimeout";
end;

define C-function redisEnableKeepAlive
  input parameter c_ :: <redisContext*>;
  result res :: <C-signed-int>;
  c-name: "redisEnableKeepAlive";
end;

define C-function redisFree
  input parameter c_ :: <redisContext*>;
  c-name: "redisFree";
end;

define C-function redisBufferRead
  input parameter c_ :: <redisContext*>;
  result res :: <C-signed-int>;
  c-name: "redisBufferRead";
end;

define C-pointer-type <int*> => <C-signed-int>;
define C-function redisBufferWrite
  input parameter c_ :: <redisContext*>;
  input parameter done_ :: <int*>;
  result res :: <C-signed-int>;
  c-name: "redisBufferWrite";
end;

define C-function redisGetReply
  input parameter c_ :: <redisContext*>;
  input parameter reply_ :: <statically-typed-pointer*>;
  result res :: <C-signed-int>;
  c-name: "redisGetReply";
end;

define C-function redisGetReplyFromReader
  input parameter c_ :: <redisContext*>;
  input parameter reply_ :: <statically-typed-pointer*>;
  result res :: <C-signed-int>;
  c-name: "redisGetReplyFromReader";
end;

define C-function redisvAppendCommand
  input parameter c_ :: <redisContext*>;
  input parameter format_ :: <c-string>;
  input parameter ap_ :: <va-list>;
  result res :: <C-signed-int>;
  c-name: "redisvAppendCommand";
end;

define C-function redisAppendCommand
  input parameter c_ :: <redisContext*>;
  input parameter format_ :: <c-string>;
  result res :: <C-signed-int>;
  c-name: "redisAppendCommand";
end;

define C-function redisAppendCommandArgv
  input parameter c_ :: <redisContext*>;
  input parameter argc_ :: <C-signed-int>;
  input parameter argv_ :: <char**>;
  input parameter argvlen_ :: <size-t*>;
  result res :: <C-signed-int>;
  c-name: "redisAppendCommandArgv";
end;

define C-function redisvCommand
  input parameter c_ :: <redisContext*>;
  input parameter format_ :: <c-string>;
  input parameter ap_ :: <va-list>;
  result res :: <C-void*>;
  c-name: "redisvCommand";
end;

define C-function redisCommand
  input parameter c_ :: <redisContext*>;
  input parameter format_ :: <c-string>;
  result res :: <C-void*>;
  c-name: "redisCommand";
end;

define C-function redisCommandArgv
  input parameter c_ :: <redisContext*>;
  input parameter argc_ :: <C-signed-int>;
  input parameter argv_ :: <char**>;
  input parameter argvlen_ :: <size-t*>;
  result res :: <C-void*>;
  c-name: "redisCommandArgv";
end;

define constant $HIREDIS-MAJOR = 0;

define constant $HIREDIS-MINOR = 11;

define constant $HIREDIS-PATCH = 0;

define constant $REDIS-ERR = -1;

define constant $REDIS-OK = 0;

define constant $REDIS-ERR-IO = 1;

define constant $REDIS-ERR-EOF = 3;

define constant $REDIS-ERR-PROTOCOL = 4;

define constant $REDIS-ERR-OOM = 5;

define constant $REDIS-ERR-OTHER = 2;

define constant $REDIS-BLOCK = 1;

define constant $REDIS-CONNECTED = 2;

define constant $REDIS-DISCONNECTING = 4;

define constant $REDIS-FREEING = 8;

define constant $REDIS-IN-CALLBACK = 16;

define constant $REDIS-SUBSCRIBED = 32;

define constant $REDIS-MONITORING = 64;

define constant $REDIS-REPLY-STRING = 1;

define constant $REDIS-REPLY-ARRAY = 2;

define constant $REDIS-REPLY-INTEGER = 3;

define constant $REDIS-REPLY-NIL = 4;

define constant $REDIS-REPLY-STATUS = 5;

define constant $REDIS-REPLY-ERROR = 6;

define constant $REDIS-READER-MAX-BUF = 16384;

define constant $REDIS-KEEPALIVE-INTERVAL = 15;

define constant redisReplyReaderCreate = redisReaderCreate;

define constant redisReplyReaderFree = redisReaderFree;

define constant redisReplyReaderFeed = redisReaderFeed;

define constant redisReplyReaderGetReply = redisReaderGetReply;

