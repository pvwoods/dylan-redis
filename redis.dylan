module: redis

define C-function freeReplyObject
  input parameter reply_ :: <C-void*>;
  c-name: "freeReplyObject";
end;

define C-pointer-type <c-string> => <C-signed-char>;
define constant <char<@128>> = <c-string>;
define constant <__darwin-size-t> = <C-unsigned-long>;

define constant <size-t> = <__darwin-size-t>;

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
define constant <redisReadTask<@9>> = <redisReadTask*>;
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

define C-function redisCommand
  input parameter c_ :: <redisContext*>;
  input parameter format_ :: <c-string>;
  result res :: <C-void*>;
  c-name: "redisCommand";
end;

define C-pointer-type <char**> => <c-string>;
define C-pointer-type <size-t*> => <size-t>;
define C-function redisCommandArgv
  input parameter c_ :: <redisContext*>;
  input parameter argc_ :: <C-signed-int>;
  input parameter argv_ :: <char**>;
  input parameter argvlen_ :: <size-t*>;
  result res :: <C-void*>;
  c-name: "redisCommandArgv";
end;

define C-function redisFree
  input parameter c_ :: <redisContext*>;
  c-name: "redisFree";
end;

