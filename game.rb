class Game
    attr_reader :clues
    attr_accessor :code
    
    @code
    @clues
    
    def initialize
        @key_pegs = ["ʘ", "●"]        
        intro
    end
    
    def intro
        puts "\nMastermind is a game where a Code Breaker tries to guess an Code Maker's" 
        puts "secret code within a certain number of turns.\n\n"
        puts "Each turn the Code Breaker will get feedback about how good their guess was:"
        puts "The clues will be placed into empty holes: ◌ ◌ ◌ ◌ \n\n"
        puts " ● : a guess was the correct number and position."
        puts " ʘ : a guess was the correct number but in the wrong position."
        puts "\n\nYou can choose to be the Code Maker or the Code Breaker."
        puts "\nEnter 1 to be the Code Maker or 2 to be the Code Breaker\n"
        @player_choice = gets.chomp
        if @player_choice == "1"
            start_game(Human.new, Computer.new)
        elsif @player_choice == "2"
            start_game(Computer.new, Human.new)
        elsif @player_choice == "0"
            start_game(Human.new, Human.new)
        else puts "\n\nEnter 1 to be the Code Maker or 2 to be the Code Breaker"
        end
    end
    
    def start_game(maker, breaker)
        @breaker = breaker
        @maker = maker
        @code = @maker.make_code
        play_game
    end

    def check_clues(guess)
        @guess = guess
        @clues = []
        @guess.each_with_index do |item, index|
            if item == @code[index]
                @clues.push(@key_pegs[1])
            elsif
                @code.include?(item) && @guess.count(item) <= @code.count(item)
                @clues.push(@key_pegs[0])
            else @clues.push("◌")
            end
            @clues
        end
        puts @clues.join(" ")
        @clues
    end

    def check_win(guess)
        @guess = guess
        @win = false
        if check_clues(@guess) == ["●", "●", "●" ,"●"]
            @win = true
        end
        @win
    end

    def win_alert
        puts "Hooray! You cracked the code!"
    end 

    def tie_alert
        puts "\nThe code was #{@code.join(" ")}."
        puts "\nYou were no match for the codeman, man!"
    end
    
    def play_game
        i = 0
        while i <= 8 do
            if @breaker.instance_of?(Human)
              @guess = @breaker.make_guess
            elsif @breaker.instance_of?(Computer) && i == 0
              @guess = @breaker.first_guess(@code)
            elsif @breaker.instance_of?(Computer) && i > 0
              @guess = @breaker.next_guess
            end
            if check_win(@guess) == true
                win_alert
                break
            end
            puts "\nThe order of the clues is random."
            puts "\n● = A number exists in the correct position."
            puts "ʘ = A number exists, but in the wrong position."
            puts "\n#{8 - i} attempts remaining.\n"
            puts "\n............................................\n"
            i += 1
        end
        if check_win(@guess) == false
            tie_alert
    end
    end
end