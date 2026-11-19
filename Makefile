CXX      = g++
CXXFLAGS = -std=c++20 -Wall -Wextra -g -MMD -MP

TARGET   = main
SRCS     = main.cpp math/mathFunction.cpp physics/physicsFunction.cpp
OBJS     = $(SRCS:.cpp=.o)
DEPS     = $(OBJS:.o=.d)

ifeq ($(OS),Windows_NT)
    EXE = $(TARGET).exe
    RUN = $(EXE)
    RM  = del /Q /F
    CLEAN_FILES = $(subst /,\,$(OBJS) $(DEPS) $(EXE))
else
    EXE = $(TARGET)
    RUN = ./$(EXE)
    RM  = rm -f
    CLEAN_FILES = $(OBJS) $(DEPS) $(EXE)
endif

.PHONY: all run clean

all: $(EXE)

$(EXE): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: $(EXE)
	$(RUN)

clean:
	$(RM) $(CLEAN_FILES)

-include $(DEPS)
