
class Code
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



class Game
  attr_reader :new_code

  def initialize(new_code = Code.new.pick_code )
    @new_code = new_code
  end

  def play
  puts @new_code
  turn = Turn.new
    while (Turn.count <= 12)
      if (@new_code.check_code(turn.round) != true)
    turn = Turn.new
  else
    puts "You Win!"

    end
  end
end

class Turn
  @count = 0
  class << self
  attr_accessor :count, :guess
end
  def initialize()
    self.class.count += 1
  end

  def round
    puts "Please enter a guess"
    @guess = Player.new.guess
    end
end
end





  def check_code(guess)
    @guess = guess
    if @guess == @code
      return true
    else
      return false
    end
  end
end







class Player
  attr_reader :guess
  def guess(guess = gets.chomp)
    @guess = guess.split
  end

end



game = Game.new
puts game
