require_relative 'Player'
require_relative 'Question'

class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @questions = Question.new
  end

  def start_game
    current_player = 0

    loop do
      player = @players[current_player]

      ask_question(player)

      # Switch to the other player for the next turn
      current_player = 1 - current_player

      # Check if the game is over
      if player.lives == 0
        end_game
        break
      end
    end
  end

  def ask_question(player)
    question = @questions.generate_question
    puts "#{player.name}: #{question}"
    answer = gets.chomp.to_i

    correct_answer = evaluate_question(question, answer)

    if answer == correct_answer
      puts "#{player.name}: Yes! You are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.lose_life
    end

    display_score
    puts "--------- New Turn ---------"
  end

  def end_game
    player1, player2 = @players

    if player1.lives > player2.lives
      puts "#{player1.name} wins with a score of #{player1.lives}/3"
    elsif player2.lives > player1.lives
      puts "#{player2.name} wins with a score of #{player2.lives}/3"
    else
      puts "It's a tie! Both players have a score of #{player1.lives}/3"
    end

    puts "--------- Game over ---------"
    puts "Goodbye!"
  end

  def display_score
    player1, player2 = @players
    puts "#{player1.name}: #{player1.lives}/3 vs #{player2.name}: #{player2.lives}/3"
  end

  def evaluate_question(question, answer)
    if question.include?("plus")
      numbers = question.scan(/\d+/).map(&:to_i)
      correct_answer = numbers[0] + numbers[1]
      return correct_answer
    else
      # Handle questions with other operators or unexpected formats
      return nil
    end
  end
  
end

player1 = Player.new("John")
player2 = Player.new("Mike")

game = Game.new(player1, player2)
game.start_game
