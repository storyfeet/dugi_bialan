
export function tag(name,props,children){
	let res = document.createElement(name);
	for (let [key,val] of Object.entries(props)){
		res[key] = val;
	}
	res.append(...children);	
	return res;
}


export default {
	tag:tag,
};
