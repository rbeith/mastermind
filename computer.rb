class Computer
    attr_reader :guess, :code

    def make_code
        @code = self.code
    end

    def first_guess(code)
        @guess = self.initial_guess(code)
    end

    def next_guess(clues)
        @guess = self.subsequent_guess(clues)
    end

    private

    def initialize
        @code_pegs = [1, 2, 3, 4, 5, 6]
        @possible_guesses = (1111..6666).to_a
    end

    def code
        @code = []
        i = 0
        while i < 4 do
            @code[i] = @code_pegs.shuffle.pop
            i += 1
        end
        puts "The code has been selected."
        return @code
    end

    def make_computer_think
        puts "\nComputer calculating possible combinations"
        3.times { print "."; sleep 1}
        puts "\nOK, here's my guess: #{@guess.join.bold.red}"
    end

    def initial_guess(code)
        @code = code
        @guess = @possible_guesses.sample.digits
        make_computer_think 
        @guess
    end
    
    def subsequent_guess(clues)
        @clues = clues
        @new_guess = []
        @guess.each_with_index do |item, index|
        if item != @code[index]
            @new_guess[index] = @code_pegs.shuffle.pop
            @new_guess.shuffle
        elsif @code.include?(item) && @code.count(item) > @new_guess.count(item) && item != @code[index]
            @new_guess[index] = item
            @new_guess.shuffle
        elsif item == @code[index]
            @new_guess[index] = item
        elsif p @guess == @new_guess
            puts @guess
            puts @new_guess
            @new_guess.shuffle
        end
            @guess = @new_guess
        end        
        make_computer_think
        @guess
    end
end

# Knuth Algorithm? 

# @possible_guesses.each_with_index do |item, index|
#     if item == @guess[index]
#         @possible_guesses.delete_at[index]
#     end
# cheater AI code
# compare the random guess to the code and keep the values that are the same and guess random for others
# puts "The length of the set is NOW #{@possible_guesses.length}"