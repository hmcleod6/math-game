require "./player"
require "./question"
require 'colorize'

class Game
  
  def initialize
    @player1 = Player.new("Player 1")
    @player2 =  Player.new("Player 2")
  end
  
  def new_game
    puts "---- START GAME ----"
    game_start
  end

  def game_start
      @player1.new_question
      show_lives
      winner_check
      puts "---- NEW TURN ----"
      @player2.new_question
      show_lives
      puts "---- NEW TURN ----"
      game_start
  end

  def show_lives
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3".yellow
    puts "---- GAME OVER ----"
    puts "Good bye!"
    exit
  end

  def winner_check
   if @player1.check_lives
    winner(@player2)
   elsif @player2.check_lives
    winner(@player1)
    end
  end


end 