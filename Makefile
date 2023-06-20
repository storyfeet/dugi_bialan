site:
	siter gen -o docs


wasm:
	cd zig; zig build-lib main.zig -target wasm32-freestanding -dynamic
	cp zig/main.wasm static/wasm/main.wasm
