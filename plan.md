#### Game 

  the game defines an event where two Players take Turns to answer Questions and have a final Score based on the results.
  This class will contain the game loop and should manage each player's turns, it will also be the one managing the user I/O

  - the game should keep track of the current turn, the players and the questions
  - initialize with 2 players and a set of questions.
  - methods: start_game, announce_winner

#### Question 

  Is an element of the Game that prompts a Player with a math problem during their turn.

  - initialize as an array of questions
  - method: ask_question - puts (prints) random question from an array of Questions.

#### Score 
  is the total lives remaining for the winning Player.
  
  - initialize with 3 lives for each plauer
  - method: update_score - for each wrong question subtract 1 life from player

#### Player
  
  is an agent that interacts with the Game and answers the questions.

  - initialize with player name and 3 lives
  - method: answer_question

