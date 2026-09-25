class GameState{
  int score = 0;

  List<int> highScores = [];

  void reset(){
    score = 0;
  }

  void addScore(){
    score++;
  }

  void saveScore() {
    highScores.add(score);
    //Tests
    /*highScores = [12, 5, 30, 18, 22];*/
    highScores.sort((b, a) => a.compareTo(b));

    if (highScores.length > 5){
      highScores = highScores.take(5).toList();
    }
  }


}