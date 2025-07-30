class WordList {
  constructor(wordList) {
    this.startList = wordList;
    this.activeList = [];
  }

  nextWord() {
    let ready = this.activeList
      .filter((item) => item.nextReady < time.Now())
      .sort((a, b) => a.nextReady - b.nextReady);

    if (ready.length == 0) {
      /// Choose a new word
      return;
    }

    let n = Math.floor(
      Math.min(Math.rand(), Math.rand(), Math.rand()) * ready.length,
    );
  }
}

if (require?.main === module) {
  console.log("Is running main");
}
