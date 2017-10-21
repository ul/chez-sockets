SCHEMEH=/usr/local/lib/csv9.5.1/ta6osx

.SUFFIXES: .c .so

all: sockets libs

libs: sockets-stub.so socket-ffi-values.so

sockets: sockets.w
	cheztangle sockets.w
	chezweave sockets.w
	pdftex sockets

.c.so:
	cc -O3 -dynamiclib -Wl,-undefined -Wl,dynamic_lookup -I${SCHEMEH} -o $@ $<
