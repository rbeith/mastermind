class Human    
    attr_reader :guess, :code
    
    def make_code
        @code = self.code
    end

    def make_guess
        @guess = self.guess
    end

    private

    def code
        puts "Enter four digits to create your code:"
        @code = gets.chomp
        if @code.length != 4
            puts "Your code should be four digits. Try again."
            @code = gets.chomp
        end
        @code = @code.chars.map {|item| item.to_i}
    end

    def guess
        puts "\nEnter your guess:\n"
        @guess = gets.chomp
        if @guess.length !=4
            puts "Your guess should be four digits. Try again."
            @guess = gets.chomp
        end
        @guess = @guess.chars.map {|item| item.to_i}
    end
end 