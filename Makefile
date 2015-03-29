PKGS=--pkg gtk+-3.0 --pkg gobject-introspection-1.0 --vapidir ./vapi --pkg seed
SOURCES=hello.vala

hello: $(SOURCES)
	valac $(PKGS) $^
clean:
	rm -f hello
