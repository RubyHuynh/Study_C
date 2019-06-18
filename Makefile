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

.PHONY: all clean

all: $(OBJS)

.SECONDEXPANSION:
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $$(@D)
	$(CC) $(CXXFLAGS) -S $< -o $(ASMDIR)/$*.s $(INCLUDE_PATHS) # -masm=intel
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<


$(TREE):
	mkdir -p $@
	mkdir -p $(@:$(OBJDIR)%=$(DEPDIR)%)
	mkdir -p $(@:$(ASMIR)%)


clean:
	rm -r $(OBJDIR)/*.* $(DEPDIR)/*.* $(ASMDIR)/*.*

ifeq "$(MAKECMDGOALS)" ""
-include $(DEPS)
endif


#cat -e -t -v Makefile
