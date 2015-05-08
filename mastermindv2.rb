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
