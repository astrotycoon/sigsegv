.PHONY: all clean

CC:=arm-hisi-linux-gcc
CFLAGS:=-Wall -g 
LDFLAGS:=-rdynamic
LDLIBS:=-ldl

SRCS:=sigsegv.c
OBJSDIR:=objdir
OBJS:=$(SRCS:%.c=$(OBJSDIR)/%.o)

EXE:=sigsegv

all: $(EXE)

$(EXE): $(OBJS)
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^

$(OBJS): | $(OBJSDIR)
$(OBJSDIR):
	@mkdir -p $@

$(OBJSDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	-rm -rf $(EXE) $(OBJSDIR)
