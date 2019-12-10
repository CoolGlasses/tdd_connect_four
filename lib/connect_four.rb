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
    end

    def create_board
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

    def diagonal_victory_conditions
    end

    def row_column_victory_conditions
    end
end
