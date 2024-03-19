CXX      ?= g++
CXXFLAGS ?= -std=c++20
LINK.o := $(LINK.cc) 


CPPFLAGS ?= -O3 -Wall -I. -I${mkEigenInc}


SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
HEADERS = $(wildcard *.hpp)

exe_sources = $(filter main%.cpp,$(SRCS))
EXEC = $(exe_sources:.cpp=)

.PHONY = all clean distclean


all: $(EXEC)

$(EXEC): $(OBJS)

$(OBJS): $(SRCS) $(HEADERS)

clean:
	$(RM) -f $(OBJS)

distclean: clean
	$(RM) -f $(EXEC)
	$(RM) *.out *.bak *~