CC = g++

#compiler options
CFLAGS = -Wall -c

#linker options
LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system

SOURCEDIR = src
BUILDDIR = build
BINDIR = build/bin
SOURCES = $(SOURCEDIR)/snake.cpp
OBJS = $(SOURCES:$(SOURCEDIR)/%.cpp=$(BUILDDIR)/%.o)
EXECUTABLE = snake

all: dir $(BINDIR)/$(EXECUTABLE)

dir:
	mkdir -p $(BUILDDIR) $(BINDIR)

$(BINDIR)/$(EXECUTABLE): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

$(OBJS): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.cpp
	$(CC) $< $(CFLAGS) -o $@

clean:
	rm -f $(BUILDDIR)/*.o $(BINDIR)/$(EXECUTABLE)
