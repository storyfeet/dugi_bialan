
export class Converter {
	constructor(wmap, lmap) {
		this.wmap = wmap;
		this.lmap = lmap;
	}

	convert(s) {
		let sp = s.split(" ");

		let res = "";
		for (let p in sp) {
			res += this.convertSub(sp[p]);
		}

		return res;

	}
	convertSub(s) {
		let lmap = this.lmap;
		let wmap = this.wmap;
		if (s == "") {
			return " ";
		}
		if (wmap[s]) {
			return wmap[s];
		}
		let res = "";
		let skip = false;
		for (let c in s) {
			if (skip) {
				skip = false;
				continue;
			}
			if (c + 1 < lmap.length && lmap[s[c] + s[c + 1]]) {
				res += lmap[s[c] + s[c + 1]];
				skip = true;
				continue;
			}

			if (lmap[s[c]]) {
				res += lmap[s[c]];
				continue;
			}
			res += s[c];
		}
		return res;
	}
}


