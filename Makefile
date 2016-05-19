OUTPUT=output
OBJ=resume
CC=./md2resume

all: $(SRC) $(OUTPUT) $(OUTPUT)/$(OBJ).html $(OUTPUT)/$(OBJ).pdf

$(OUTPUT)/$(OBJ).pdf: $(CC) $(OBJ).md
	$(CC) pdf $(OBJ).md $(OUTPUT)

$(OUTPUT)/$(OBJ).html: $(CC) $(OBJ).md
	$(CC) html $(OBJ).md $(OUTPUT)

$(OUTPUT):
	mkdir $(OUTPUT)

$(CC):
	curl -L -O https://github.com/there4/markdown-resume/raw/master/bin/md2resume && chmod 700 $(CC)

read: $(OUTPUT)/$(OBJ).pdf
	open $(OUTPUT)/$(OBJ).pdf

find: $(OUTPUT)/$(OBJ).pdf
	open -R $(OUTPUT)/$(OBJ).pdf
