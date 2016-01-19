.PHONY: all clean

#CC:=arm-hisi-linux-gcc
CC:=g++
CFLAGS:=-Wall -g 
LDFLAGS:=-rdynamic
LDLIBS:=-ldl

srcs:=sigsegv.c
objsdir:=objdir
objs:=$(srcs:%.c=$(objsdir)/%.o)

exe:=sigsegv

all: $(exe)

$(exe): $(objs)
	$(CC) -o $@ $^ $(LDFLAGS) $(LDLIBS)

$(objs): | $(objsdir)
$(objsdir):
	@mkdir -p $@

$(objsdir)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	-rm -rf $(exe) $(objsdir)
