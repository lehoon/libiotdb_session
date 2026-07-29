CXX = g++
CC  = gcc

OPT ?= -O2 
# -g

#iotdb
IOTDB_INCLUDE_PATH=../iotdb_session
IOTDB_LIB_PATH=../iotdb_session/build

#thrift
THRIFT_INCLUDE_PATH=../thrift/lib/cpp/src
THRIFT_LIB_PATH=../thrift/lib/cpp/.libs

#默认值
CFLAGS = -std=c++11 -c -I$(IOTDB_INCLUDE_PATH) -I$(THRIFT_INCLUDE_PATH)	$(OPT)
#lib source path
LIBS = -L$(IOTDB_LIB_PATH) -L$(THRIFT_LIB_PATH)

#连接动态库
LDFLAGS = -lpthread -lrt -ldl -liotdb_session -lthrift

BASE_OBJS = \

OBJS = \
	demo.o \

PROGRAM = demo

all : $(PROGRAM)
	@echo ===$(PROGRAM) compiler done!=== 

$(PROGRAM) : $(BASE_OBJS) $(OBJS)
	$(CXX) -o $@ $(BASE_OBJS) $(OBJS) $(LIBS) $(LDFLAGS)

clean:
	-rm -f *.o $(PROGRAM)

.cc.o:
	$(CXX) $(CFLAGS) $< -o $@

.cpp.o:
	$(CXX) $(CFLAGS) $< -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@
