class CodePicker
  attr_reader :code

  def initialize(code = [])
  end

  def pick_code
    colors = ["blue", "red", "green", "yellow", "orange", "purple"]
    code = []
    4.times do code.push(colors.sample)
      end
    @code = code
  end
end


class Player
  attr_reader :name
  def initialize(name)
  end
end

class Turn
  @count=0
  class << self
    attr_accessor :count
  end

  def initialize
    self.class.count += 1
  end
end



class Feedback
end

class Game
  attr_reader :code, :player, :guess
  def initialize(player, code = CodePicker.new, guess = gets.chomp)
    @guess = guess.split
    @code = code.pick_code
  end

  def play
    turn = Turn.new
    while Turn.count < 13
      puts Turn.count
      puts "Please make your guess"
      guess = Guess.new

      puts guess.answer_check
      Turn.count += 1
    end
  end

  def answer_check
    if @guess == Game.code
      puts "Winner Winner Chicken Dinner!"
    else
      "Try Again"
    end
  end

end

game = Game.new("Steven")
puts game.play
