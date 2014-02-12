Module: dylan-user

define library redis
  use common-dylan;
  use io;
end library;

define module redis
  use common-dylan, exclude: { format-to-string };
  use format-out;
end module;
