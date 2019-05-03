city: city.ml
	ocamlfind ocamlopt -package cairo2 -linkpkg -o mycity city.ml

clean:
	-rm *.o *.cmi *cmx mycity mycity.pdf
