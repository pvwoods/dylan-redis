module: redis

define interface
  #include {
    "hiredis.h"
  },

  equate: {"char *" => <c-string>},

  import: all

end;
