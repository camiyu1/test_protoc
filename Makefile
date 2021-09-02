CXX=g++

EXEC=test_protoc
PBGEN_INSRC =./test.proto
PBGEN_OUTSRC=./test.pb.cc
PBGEN_OUTOBJ=$(OBJDIR)/test.pb.o
ALIB=libproto.a

OBJDIR=./obj
PROTODIR=./obj_proto
LDFLAGS=-lprotobuf -pthread -fsanitize=address -lasan

$(EXEC): $(OBJDIR)/test.pb.o $(OBJDIR)/test.o | prepare
	$(CXX) -L. $(COMMON) $(CXXFLAGS) -o $@ $(OBJDIR)/*.o $(LDFLAGS)

$(OBJDIR)/%.o: %.cc Makefile | prepare
	$(CXX) $(COMMON) $(CXXFLAGS) -c $< -o $@

$(PBGEN_OUTOBJ): $(PBGEN_OUTSRC) Makefile | prepare
	$(CXX) $(COMMON) $(CXXFLAGS) -c $< -o $@

$(PBGEN_OUTSRC): $(PBGEN_INSRC) | prepare
	protoc $< --cpp_out=./

prepare: obj

obj:
	mkdir -p obj

clean:
	rm $(EXEC) obj/* test.pb.*; rmdir obj