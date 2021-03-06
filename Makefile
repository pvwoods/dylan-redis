MELANGE=melange

all: build

redis.dylan: hiredis
	$(MELANGE) -Tc-ffi -Iext/hiredis redis.intr redis.dylan

hiredis:
	$(MAKE) -C ext/hiredis 32bit static

build: redis.dylan
	dylan-compiler -build redis.lid
