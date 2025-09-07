
function nextReady(now,score,error){
	Date(now.getTime()+ 1000 * Math.pow(2,score));
}



export class QuizManager {
  constructor(wordList) {
	//StartList should not change after construction
    this.wordList = wordList;
	//active list shold change regularly
    this.activeList = [];
	this.nextAdd = 0;

  }

	nextQuestion(){
		// Create a set of optional words, 
		let ans = this.nextWord();
		if (! ans){
			return null;
		}

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
			name: this.wordList[nextAdd].Name,
			nextReady : Date.now(),
			score: 0,
			error: false,
			buddies: [],
		};
		this.activeList.push(res);
		return res; 
	}

	/**
	* @return Active Element
	*/
  nextWord() {
    let ready = this.activeList
      .filter((item) => item.nextReady < Date.now())
      .sort((a, b) => a.nextReady - b.nextReady);

    if (ready.length == 0) {
		return this.addWord(); 
    }

    let n = Math.floor(
      Math.min(Math.random(), Math.random(), Math.random()) * ready.length,
    );
	return ready[n];
  }


	findBuddy(name){
		for(let a of this.activeList){
			if (a.name === name){
				return a;
			}
		}
		for (let i = 0; i < this.wordList.length; i++){
			if (this.wordList[i].Name === name){
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
		let res = activity.buddies.map((bud)=>this.findBuddy(bud));
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


	success(index){
	}
	
	fail(index,mistakeSelected){
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

	console.log(quizMan.nextQuestion());

}
