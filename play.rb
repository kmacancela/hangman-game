class Hangman
    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
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

    def begin
        # will ask use to select a letter
        puts "New game started...your clue is: #{ @word.first.size } characters long"
        word_teaser = ""
        @word.first.size.times do
            word_teaser += "_ "
        end
        puts word_teaser
        puts "Your clue is: #{ @word.last }"
        puts "Enter a letter"
        guess = gets.chomp
        # puts "You guessed #{ guess }"
    end

end

game = Hangman.new 
game.begin