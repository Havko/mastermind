
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




class Game
  attr_reader :new_code

  def initialize(new_code = Code.new.pick_code )
    @new_code = new_code
  end

  def play
  puts @new_code
  turn = Turn.new
    if (@new_code.check_code(turn.round, @new_code) != true)
    puts "debug"
  else
   puts "debug2"
    end
  end
end






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
end








  class Array
    def check_code(guess, code)
      @guess = guess
      @code = code
      if @guess == @code
        return true
      else
        return false
      end
    end
  end






class Player
  attr_accessor :guess
  def guess(guess = gets.chomp)
    @guess = guess.split
  end

end



game = Game.new
puts game.play
