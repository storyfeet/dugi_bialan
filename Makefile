site:
	siter gen -o docs

qsite : 
	siter gen --skip_static -o docs 

jsfont : 
	cd zig; zig build-exe --name jsfontmapper jsfontmapper.zig; ./jsfontmapper > ../static/js/jsfontmapper.js

wasm:
	cd zig; zig build-exe dugi_wasm.zig -fno-entry -target wasm32-freestanding -rdynamic
	cp zig/dugi_wasm.wasm static/wasm/dugi.wasm

converter:
	cd zig; zig build-exe --name convert dugi_convert.zig

all: jsfont converter  wasm  site 


glyphgifs : static/glyphs/%.svg
	inkscape static/glyphs/$*.svg -o util/gifs/$*.gif
