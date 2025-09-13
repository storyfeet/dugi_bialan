
function nextReady(score, now = null){	
	now = now ?? new Date();
	return new Date(now.getTime()+ 1000 * Math.pow(2,score));
}



export class QuizManager {
  constructor(wordList) {
	//StartList should not change after construction
    this.wordList = wordList;
	//active list shold change regularly
    this.activeList = [];
	this.buddyList = new BuddyList();
	this.nextAdd = 0;

  }

	nextQuestion(){
		// Create a set of optional words, 
		let ans = this.nextWord();
		if (! ans){
			return null;
		}

		// Make Ticket
		return {
			active:ans,	
			options: this.chooseOptions(ans),
		};
		
	}


	nextToAdd(){
		outer: for (let i = 0 ;i < this.wordList.length; i++){
			for(let a of this.activeList){
				if (a.index == i){
					continue outer;
				}
			}
			return i;
		}
		return null;
	}

	
	addWord(toAdd = null){
		let nextAdd = toAdd ?? this.nextToAdd();
		if (nextAdd == null){
			return null;
		}
		let res = {
			index: nextAdd,
			name: this.wordList[nextAdd],
			nextReady : nextReady(0),
			score: 0,
			error: false,
		};
		this.activeList.push(res);
		return res; 
	}

	/**
	* @return Active Element
	*/
  nextWord() {
	let now = new Date();
    let ready = this.activeList
      .filter((item) => (item.nextReady.getTime() < now.getTime()))
      .sort((a, b) => a.nextReady - b.nextReady);

    if (ready.length == 0) {
		return this.addWord(); 
    }

    let n = Math.floor(
      Math.min(Math.random(), Math.random(), Math.random()) * ready.length,
    );
	return ready[n];
  }


	findByName(name){
		for(let a of this.activeList){
			if (a.name === name){
				return a;
			}
		}
		for (let i = 0; i < this.wordList.length; i++){
			if (this.wordList[i] === name){
				return this.addWord(i);
			}
		}
		return null;
	}

	randomOption(){
		let i = Math.floor(Math.random() * (this.activeList.length + 3));
		if (i < this.activeList.length){
			return this.activeList[i];
		}
		return this.addWord();
	}

	chooseOptions(activity){
		let res = this.buddyList.buddyNames(activity.name).map((bud)=>this.findByName(bud));
		for (let i = 1; i < 20; i++){
			let op = this.randomOption();
			if (
				op && 
				(!res.find((item)=>item.name === op.name)) &&
				(activity.name !== op.name)
			) {
				res.push(op);
			}
			if (res.length >= 4){
				return res;
			}
		}
		return res;
	}


	success({active}){
		
		active.score += 1;
		let minScore = active.score;
		this.buddyList.onEach(active.name,(bud,dat)=>{
			//Consider if not all buddies are shown,
			dat.score += 1;
			minScore = Math.min(minScore,dat.score);
			return dat.score < 6;
		});
		
		active.nextReady = nextReady(minScore);
	}
	
	fail({active,options},selected){
		active.score = Math.floor(ticket.active.score / 2);

		active.nextReady = nextReady(0);

		// Make buddies	
		err = options[selected];
		
		if (! this.buddyList.addBuddy(active.name, err.name,{score:0})){
			this.buddyList.onPair(active.name,err.name,(dat)=>{dat.score=0;});
		}
	}
}


class BuddyList {
	constructor(){
		this.list = [];
	}

	/**
	* Find a buddy pair, if found perform the action required
	* @param a,b: the two names of the buddies
	* @param fn: a callback that will operate on internal data
	*/
	onPair(a,b,fn){
		this.list = this.list.filter(
			(bud)=>{
				if (bud.a == a && bud.b ==b){
					return fn(bud.data) ?? true;
				}
				if (bud.b == a && bud.a == b){
					return fn(bud.data) ?? true;
				}
				return true;
			}
		);
	}

	/**
	* For each buddy of this 
	*/
	onEach(name,fn){
		this.list = this.list.filter(
			(bud)=>{
				if(bud.a == name) {
					return fn(bud.b,bud.data) ?? true;
				}
				if (bud.b == name){
					return fn(bud.a,bud.data) ?? true;
				}
				return true;
			}
		);
	}

	buddyNames(name){
		let res = [];
		this.onEach(name,(bud)=>{
			res.push(bud);
		});
		return res;
	}

	/**
	* @return true if added
	*/
	addBuddy(a,b,data){
		if (
			this.list.find((bd)=>(
				(bd.a == a || bd.b == a) &&
				(bd.b == b || bd.a == b)
			))
		) return false;
		
		this.list.push({a:a,b:b,data:data});
		return true;
	}

	
}


class WebDisplay{
		
	renderQuestion(word,score){
		return 
	}
}


class CliDisplay{
	getMode(score){
		return 1;
	}
	renderQuestion(word,mode){
		return word.q;
	}

	renderOption(word,mode){
		return word.a;
	}
	
	renderAnswer(word,mode){
		return "${word.q} = ${word.a}";
	}
}






//if (require?.main === module) {
if (false){
	//MAIN
	let quizMan = new QuizManager([
		{name:"Hello",a:"o buna"},
		{name:"Goodbye",a:"o yawin buna"},
		{name:"Fish",a:"gela zo"},
		{name:"This",a:"this"},
		{name:"That",a:"that"},
		{name:"Open",a:"ubin"},
	]);

	while (true){
		let next = quizMan.nextQuestion();
	}


}
