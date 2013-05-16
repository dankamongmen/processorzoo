.DELETE_ON_ERROR:
.PHONY: all validate clean

RELAXNG:=processorzoo.rng
XML:=$(wildcard *.xml)

all: validate

validate: $(RELAXNG) $(XML)
	for i in $(XML) ; do xmlstarlet val -e -r $(RELAXNG) $$i ; done

clean:
