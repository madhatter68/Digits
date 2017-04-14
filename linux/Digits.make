TARGET = DigitsVST.so 

CPP = g++
CXXFLAGS = -fPIC -DPIC -Wall -O3 -D__cdecl="" -DNO_EDITOR -DBUILTINPATCHES -I../vstsdk2.4 -fvisibility=hidden
#CXXFLAGS = -fPIC -DPIC -Wall -g -O3 -D__cdecl="" -DNO_EDITOR -DBUILTINPATCHES -I../vstsdk2.4 -fvisibility=hidden

CSOURCES  = BufferManager.cpp \
		Chorus.cpp Contour.cpp Patches.cpp PhaseDist.cpp ResoGen.cpp SndBuf.cpp Tables.cpp Voice.cpp VstCore.cpp
OBJS      = $(CSOURCES:.cpp=.o)
ALLOBJ       = $(OBJS) $(VSTSDKDIR)/public.sdk/source/vst2.x/vstplugmain.o $(VSTSDKDIR)/public.sdk/source/vst2.x/audioeffect.o $(VSTSDKDIR)/public.sdk/source/vst2.x/audioeffectx.o
SRCDIR    = ../src
VSTSDKDIR = ../vstsdk2.4

${TARGET} : $(ALLOBJ)
	$(CPP) -fPIC -DPIC -shared ${CXXFLAGS} -o ${TARGET} ${ALLOBJ}  
#	strip ${TARGET}

bench : ${TARGET} DigitsBench.cpp
	$(CPP) ${CXXFLAGS} -o DigitsBench DigitsBench.cpp ${TARGET}


%.o : $(SRCDIR)/%.cpp
	$(CPP) -c $< -o $@ $(CXXFLAGS)

#.c.o : 
#	${CC} ${CC_FLAGS} -c $<

#.cpp.o: 
#	${CC} ${CC_FLAGS} -c $<

clean :
	rm -f ${TARGET}
	rm -f ${ALLOBJ}
	rm -f *~
	rm -f source/*~


