module Codebreaker
  class Game
    def initialize(output, input = $stdin)
      @output, @input = output, input    
    end
    
    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
    
    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+'*marker.exact_match_count + '-'*marker.number_match_count
    end 
  end

  def over
    #@output.puts()
    @output.print("Enter your name: ")
    to_file(@input.gets.chomp)
    @output.puts(statistic)    
  end

  def to_file(name)
    File.open("statistic_game.txt", "w+") do |file|
      file.puts("(Name: #{name}) (Code: #{secret_code})")
    end
  end

  def statistic
    File.read("statistic_game.txt")
  end
end