require 'colorize'

class Player

  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def check_lives
    @lives == 0
  end

  def new_question
    question = Question.new
    question.question_prompt(name)
    @answer = $stdin.gets.chomp.to_i

    if question.answer_check?(@answer) 
       puts "YES! You are correct.".green
    else 
      puts "Seriously? No.".red
      @lives -= 1
    end
  end

end