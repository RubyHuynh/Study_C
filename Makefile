SRCDIR := .
OBJDIR := obj
DEPDIR := dep
ASMDIR := asm

SRCS     := $(shell find $(SRCDIR) -name "*.c")
OBJS     := $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
ASMS     := $(SRCS:$(SRCDIR)/%.c=$(ASMDIR)/%.s)
DEPS     := $(SRCS:$(SRCDIR)/%.c=$(DEPDIR)/%.d)
TREE     := $(patsubst %/,%,$(dir $(OBJS)))
CPPFLAGS  = -MMD -MP -MF $(@:$(OBJDIR)/%.o=$(DEPDIR)/%.d)
MKDIR_PS := $(shell mkdir -p asm obj dep)

#TEE      := mkdir -p $(@:$(OBJDIR)%) $(@:$(DEPDIR)%) $(@:$(ASMDIR)%)
.PHONY: $(MKDIR_PS) all clean

all: $(MKDIR_PS) $(OBJS)

#$(CC) $(CXXFLAGS) -S $< -o $(ASMDIR)/$*.s $(INCLUDE_PATHS) -masm=intel
.SECONDEXPANSION:
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $$(@D)
	$(CC) $(CXXFLAGS) -S $< -o $(ASMDIR)/$*.s $(INCLUDE_PATHS)
	gcc $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<



clean:
	rm -r $(OBJDIR)/*.* $(DEPDIR)/*.* $(ASMDIR)/*.*

ifeq "$(MAKECMDGOALS)" ""
-include $(DEPS)
endif


#cat -e -t -v Makefile
