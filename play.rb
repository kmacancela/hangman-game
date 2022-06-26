class Hangman
    def initialize
        # @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        # @correct_guesses = []

        @word_teaser = ""
        @word.first.size.times do
            @word_teaser += "_ "
        end
    end

    def words # words we want to guess and the clue provided to user
        [
            ["cricket", "A game played by gentlemen"],
            ["jogging", "We ain't walkin"],
            ["celebrate", "A gathering of joyful people"],
            ["continent", "There are 7 of these in the world..."],
            ["exotic", "Not from around these woods..."],
        ]
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split
        new_teaser.each_with_index do |letter, index|
            # replace blank values (_) with the guessed letter
            if letter == "_" && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end
        @word_teaser = new_teaser.join(" ")
    end

    def teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def make_guess 
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp
            # puts "You guessed #{ guess }"
            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "Thank you for playin, byeeee"
            elsif good_guess
                puts "Correct!"
                # @correct_guesses << guess
                # @letters.delete guess

                teaser guess
                if @word.first == @word_teaser.split.join
                    puts "Wise one you are! May the force be with you."
                else
                    make_guess
                end
            else
                @lives -= 1
                puts "Sorry...you have #{ @lives } lives left, try again"
                make_guess
            end
        else 
            puts "Game over!"
        end
    end

    def begin
        # will ask user to select a letter
        puts "New game started...your clue is: #{ @word.first.size } characters long"
        puts "To exit the game, type 'exit' and press enter"
        teaser
        puts "Your clue is: #{ @word.last }"
        make_guess
    end

end

game = Hangman.new 
game.begin