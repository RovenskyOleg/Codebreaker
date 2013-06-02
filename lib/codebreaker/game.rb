module Codebreaker
  class Game
    def initialize(output, input = $stdin)
      @output, @input = output, input    
    end
    
    def start(secret)
      @count = 0 
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end
    
    def save(name)
      File.open("statistic_game.txt", "a+") do |file|
        file.puts("(Name: #{name} - attempts: #{@count} - Secret code: #{@secret} - Play date: #{Time.now})" )
      end
    end

    def statistic
      File.read("statistic_game.txt")
    end

    def hint
      index = rand(0..3)
      str = '****'
      str[index] = @secret[index]
      str
    end

    def game_finish
      @output.puts 'Enter your name: ' 
      save(@input.gets.chomp)
      @output.puts(statistic)
      @output.puts "Play again? [y/n]"
      if (gets.chomp == "y")
        @output.puts start(@secret)
      else
        exit
      end
    end

    def guess(guess)      
      if guess.length != 4
        @output.puts 'Wrong number arguments'
        else
          @count += 1
          marker = Marker.new(@secret, guess)
          @output.puts '+'*marker.exact_match_count + '-'*marker.number_match_count
          if marker.exact_match_count == 4
            game_finish
          else
            @count -= 1
            if (gets.chomp == "hint")
              @output.puts hint
        end
      end
    end 
  end    
end
end 