site:
	siter gen -o docs

qsite : 
	siter gen --skip_static -o docs 

wasm:
	cd zig; zig build-exe src/dugi_wasm.zig -fno-entry -target wasm32-freestanding -rdynamic -femit-asm ../static/wasm/dugi.wasm 

converter:
	cd zig; zig build

all: converter site 


glyphgifs : static/glyphs/%.svg
	inkscape static/glyphs/$*.svg -o util/gifs/$*.gif
