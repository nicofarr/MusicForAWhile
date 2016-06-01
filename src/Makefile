CC=g++
CFLAGS=-std=c++11 -O3 -Wno-write-strings -Wall -fdiagnostics-color=always

TARGET=../bin/mfaw
SRC=main.cpp

OBJS=$(SRC:.cpp=.o)

LIB=-lmidifile

LIB_SEARCH=../lib/midfile/lib
LIB_SEARCH_INCLUDE=../lib/midfile/include

all: $(TARGET)
		@echo END

$(TARGET): $(PRELOG) $(OBJS)
		$(CC) $(CFLAGS) -L $(LIB_SEARCH) -o $(TARGET) $(OBJS) $(LIB)

.cpp.o:
		$(CC) $(CFLAGS) -c $<  -o $@

clean:
		rm -f $(OBJS) $(TARGET)
