CXX=g++

EXEC=test_protoc
PBGEN_INSRC =./test.proto
PBGEN_OUTSRC=./test.pb.cc
PBGEN_OUTOBJ=$(OBJDIR)/test.pb.o
ALIB=libproto.a

OBJDIR=./obj
PROTODIR=./obj_proto
LDFLAGS=-lprotobuf -pthread

$(EXEC): $(OBJDIR)/test.pb.o $(OBJDIR)/test.o
	$(CXX) -L. $(COMMON) $(CXXFLAGS) -o $@ $(OBJDIR)/*.o $(LDFLAGS)

$(OBJDIR)/%.o: %.cc Makefile
	$(CXX) $(COMMON) $(CXXFLAGS) -c $< -o $@

$(PBGEN_OUTOBJ): $(PBGEN_OUTSRC) Makefile
	$(CXX) $(COMMON) $(CXXFLAGS) -c $< -o $@

$(PBGEN_OUTSRC): $(PBGEN_INSRC)
	protoc $< --cpp_out=./
