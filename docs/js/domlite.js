
export function tag(name,props = {},children = []){
	let res = document.createElement(name);
	for (let [key,val] of Object.entries(props)){
		res[key] = val;
	}
	if (typeof children[Symbol.iterator] === 'function'){
		res.append(...children);	
	}else {
		res.append(children);
	}
	return res;
}

export function tx(str,props = {}){
	let res = document.createTextNode(str);
	for (let [key,val] of Object.entries(props)){
		res[key] = val;
	}
	return res;

}

export function br(){
	return tag('br');
}

export default {
	tag:tag,
	tx:tx,
	br,
};
