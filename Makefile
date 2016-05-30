CXX 			= g++

DEFINES 		= -DLINUX -D_GNU_SOURCE=1 -DGUI=1 -DJOY_ANALOG_DEADZONE=8192
CXXFLAGS  		= -Ofast -fdata-sections -ffunction-sections -flto -fwhole-program -march=native -mtune=native
CXXFLAGS 	   += ${DEFINES}
CXXFLAGS 	   += $(shell sdl2-config --cflags)
LDFLAGS 		= -lSDL2 -Wl,--as-needed -Wl,--gc-sections -flto -fwhole-program
OUT  			= uzem

SOURCES 		= ./src/uzerom.cpp ./src/avr8.cpp ./src/uzem.cpp
OBJS 		= ${SOURCES:.cpp=.o}

${OUT}	: ${OBJS}
		${CXX} -o ${OUT} ${SOURCES} ${CXXFLAGS} ${LDFLAGS}
		
clean	:
		rm ${OBJS}
		rm ${OUT}
