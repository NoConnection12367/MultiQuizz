

class Statistics {

    int userID = 0;
    int drawGames = 0;
    int wonGames = 0;
    int lostGames = 0;
    int rightAnswers = 0;
    int totalGames = 0;

    Statistics();

    double getRightAnswerProbability() {

        return rightAnswers * 100 / (totalGames * 10);
    }

}