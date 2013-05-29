module Codebreaker
  class Game
    def initialize(output, input = $stdin)
      @output, @input = output, input    
    end
    
    def start(secret)
      @secret = secret
      @count = 0
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
    
    def guess(guess)
      @count += 1 

      marker = Marker.new(@secret, guess)
      @output.puts '+'*marker.exact_match_count + '-'*marker.number_match_count
        if marker.exact_match_count == 4
          game_finish
        end 
      end 
    end

    def game_finish
    
      @output.print("Enter your name: ")
      to_file(@input.gets.chomp)
      @output.puts(statistic)
      exit  
    end

    def to_file(name)
      File.open("statistic_game.txt", "w+") do |file|
        file.puts("(Name: #{name})")
      end
    end

    def statistic
      File.read("statistic_game.txt")
    end
  end