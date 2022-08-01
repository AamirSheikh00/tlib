CC=gcc
CFLAGS=
SUBDIRS = doxygen

.PHONY: init

init:
	@for dir in $(SUBDIRS); \
		do \
			if [ ! -d $$dir ]; \
			then \
				mkdir $$dir; \
			fi \
		done

test: caller.c thread.c 
	$(CC) -c caller.c thread.c 
	$(CC) caller.o thread.o -o tout

clean:
	@rm *.o

docs:
	doxygen doxyconfig
