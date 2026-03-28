
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
		let p = 0;
		outer: while (p < s.length){
			for (let look = s.length - p; look > 0 ; look --){
				let curr = s.slice(p,p + look);
				if (lmap[curr]){
					res += lmap[curr];
					p += curr.length;	
					continue outer;
				}
				if (wmap[curr]){
					res += wmap[curr];
					p += curr.length;
					continue outer;
				}
			}
			res += s[p];
			p+=1;
		}

		return res;
	}
}


