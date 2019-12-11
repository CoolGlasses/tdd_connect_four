require "byebug"

class Player
    attr_accessor :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end

end

class Board
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
    def initialize
    end

    def get_players
    end

    def get_color
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
