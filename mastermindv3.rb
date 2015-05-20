
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
    end
end




class Game
  attr_reader :new_code

  def initialize(player, new_code = Code.new.pick_code )
    @new_code = new_code
    @player = player
  end

  def play
    puts @player.role
    if @player.role == "codebreaker"
      turn = Turn.new
        while (Turn.count <= 12)
          @player_guess = @player.guess
          if (@new_code.check_code(@player_guess, @new_code) == true)
            puts "You Win!"
          break
          elsif Turn.count == 12
            puts "you lose"
            puts "the answer is #{@new_code}"
          break
          else
            puts @player_guess.feedback(@player_guess, @new_code)
            puts "Guess again"
            turn = Turn.new

          end
         end
    elsif @player.role == "codemaker"
      puts "Please enter your code now"
      @player_code = gets.chomp.split
      @ai_guess = Code.new.pick_code
      puts @ai_guess.check_code(@aiguess, @new_code)
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

    def feedback(guess, secret)
  		unmatched_guess = []
  		unmatched_secret = []
  		blacks = 0 # right color right place
  		whites = 0 # right color wrong place

  		guess.each_with_index do |a_guess, index|
  			if a_guess == secret[index]
  				blacks += 1
  			else
  				unmatched_guess << a_guess
  				unmatched_secret << secret[index]
  			end
  		end

  		unmatched_guess.each do |a_guess|
  			index = unmatched_secret.index(a_guess)
  			unless index.nil?
  				unmatched_secret.delete_at(index)
  				whites += 1
  			end
  		end
  		puts "correct color correct placement = #{blacks}"
      puts "correct color wrong placement = #{whites}"
    	end



end





class Player
  attr_accessor :guess, :role, :name
  def initialize(name, role)
    @name = name
    @role = role
  end
  def guess(guess = gets.chomp)
    @guess = guess.split
  end

end


steven = Player.new("Steven", "codebreaker")
game = Game.new(steven)
puts game.play
