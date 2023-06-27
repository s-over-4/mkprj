PREFIX			:= /usr/local
BINDIR			:= $(PREFIX)/bin
BIN 				:= $(shell echo $(NAME) | tr '[:upper:]' '[:lower:]')
TMPBIN			:= $(BIN).out
CC					:= gcc
FLAGS				:= -O3 -s
DEVFLAGS			:= -ggdb -fsanitize=leak,address,undefined -fno-omit-frame-pointer
SRCS 				:= $(wildcard src/*.c)
OBJS 				:= $(SRCS:.c=.o)

all: options $(NAME)

options:
	@$(eval $@_TITLE := "$(NAME) build options")
	@$(eval $@_ULINE := $(shell echo "$($@_TITLE)" | tr '[:print:]' '='))
	@echo -e "\e[1m$($@_TITLE)\e[0m"
	@echo -e "\e[1m$($@_ULINE)\e[0m"
	@echo -e "\e[1mcc:\e[0m			$(CC)"
	@echo -e "\e[1mflags:\e[0m		$(FLAGS)"
	@echo 

devoptions:
	@$(eval $@_TITLE := "$(NAME) build options \(development\)")
	@$(eval $@_ULINE := $(shell echo "$($@_TITLE)" | tr '[:print:]' '='))
	@echo -e "\e[1m$($@_TITLE)\e[0m"
	@echo -e "\e[1m$($@_ULINE)\e[0m"
	@echo -e "\e[1mcc:\e[0m			$(CC)"
	@echo -e "\e[1mflags:\e[0m		$(DEVFLAGS)"
	@echo 

$(NAME): $(OBJS)
	$(CC) $(OBJS) $(FLAGS) -o $(TMPBIN)

dev: devoptions $(OBJS)
	$(CC) $(OBJS) $(DEVFLAGS) -o $(TMPBIN)

install:
	make
	cp ./$(BIN).out $(BINDIR)/$(BIN)

uninstall:
	rm -f $(BINDIR)/$(BIN)

clean:
	rm -f $(TMPBIN) src/*.o

%.o: %.c include/%.h
	$(CC) -c $(FLAGS) $< -o $@

# fun
me:
	@[ "$(USER)" = "root" ] && echo "Okay." || echo "What? Make it yourself."

a sandwich:
	@exit

.PHONY: all options devoptions dev install uninstall clean
