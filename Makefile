site:
	siter gen -o docs

qsite : 
	siter gen --skip_static -o docs 

wasm:
	cd zig; zig build-lib dugi_wasm.zig -target wasm32-freestanding -dynamic
	cp zig/dugi_wasm.wasm static/wasm/dugi.wasm

converter:
	cd zig; zig build-exe --name convert dugi_convert.zig

all: converter  wasm  site


glyphgifs : static/glyphs/%.svg
	inkscape static/glyphs/$*.svg -o util/gifs/$*.gif
