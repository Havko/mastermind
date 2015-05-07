
class Game
  def initialize()
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

class Turn
  @@count = 0
  class << self
    attr_accessor :count
  end
  @@code = Code.new
  @@code = @@code.pick_code
  def initialize

  end

  def player_move
    puts @@count
    while @@count < 13
    puts "Please make your guess"
    @guess = gets.chomp
    @guess = @guess.split
    @@count += 1

  end
  end

  def answer_check
    if @guess == @@code
      puts "Winner Winner Chicken Dinner!"
    else
      "Try Again"
    end
  end
end




test = Turn.new
puts test.player_move
puts test.answer_check
