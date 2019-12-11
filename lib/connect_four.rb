require "byebug"

class Player
    attr_accessor :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end

end

class Board
    attr_reader :board

    def initialize
        @board = create_board()
    end

    def create_board
        initial_board =            
            [
             [nil," 1 ","  2 ", "  3 ",  " 4 ",  " 5 ",  " 6 ",  " 7 "],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", nil, nil, nil, nil, nil, nil, nil],
             ["E", nil, nil, nil, nil, nil, nil, nil],
             ["F", nil, nil, nil, nil, nil, nil, nil],
             ["G", nil, nil, nil, nil, nil, nil, nil],
            ]
        
        initial_board.each do |row|
            row.each do |cell|
                if cell == nil
                    cell = "\u25a2".encode("utf-8")
                end
            end
        end
        return initial_board
    end
end

class Game
    attr_reader :player1, :player2
    attr_accessor :board

    def initialize
        @board = Board.new
        @player1 = get_player()
        @player2 = get_player()
        play()
    end

    def get_player
        if @player1 == nil
            p "Player 1, what is your name?"
            name = gets.chomp
            color = get_color(name)
            player = Player.new(name, color)
            return player1
        else
            p "Player 2, what is your name?"
            name = gets.chomp
            color = get_color(name)
            player = Player.new(name, color)
            return player2
        end
    end

    def get_color(player) ###need to check and make sure input is valid
        if @player1 == nil
            p "#{name}, what color do you, Black or White?"
            color = gets.chomp
            return color
        else
            if @player1.color == "Black"
                color = "White"
            else
                color = "Black"
            end
            p "#{name}, your color is #{color}!"
            return color
        end
    end

    def game_over
    end

    def play 
    end

    def get_move
    end

    def diagonal_victory_conditions(board)
    end

    def row_column_victory_conditions(board)
    end
end
