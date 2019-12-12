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
        return initial_board
    end

    def make_move(board, move, color)
        move = move.to_i
        i = 7
        dropped = false
        while !dropped
            if board[i][move] == nil
                board[i][move] = color
                dropped = true
            else
                i -= 1
            end
        end
        return board
    end

    def display_board(board=@board)
        puts
        print board[0]
        puts 
        print board[1]
        puts
        print board[2]
        puts 
        print board[3]
        puts
        print board[4]
        puts 
        print board[5]
        puts
        print board[6]
        puts 
        print board[7]
        puts
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

    def game_over(board)
        if diagonal_victory_conditions(board) == true || row_column_victory_conditions(board) == true
            return true
        else
            return false    
        end
    end

    def play 
        turn = @player2
        while !game_over(@board.board)
            turn = turn_check(turn)
            display_board()
            move = get_move(turn.name)
            @board.board = @board.make_move(@board.board, move, turn.color)     
        end

        p "Game over!  #{turn.name}, you win!"
    end

    def display_board
        @board.display_board
    end

    def turn_check(turn)
        if turn == @player1
            turn = @player2
        else
            turn = @player1
        end
        return turn
    end

    def get_move(name)
        p "Okay #{name}, you're up.  Whats your move? (Pick a Column Number)"
        move = gets.chomp
        if valid_move_check(move)
            return move
        else
            p "I'm sorry, that is not a valid move.  Please try again!"
            get_move(name)
        end
    end

    def valid_move_check(move)
        case move
            when "1"
                true
            when "2"
                true
            when "3"
                true
            when "4"
                true
            when "5"
                true
            when "6"
                true
            when "7"
                true
            else
                false
        end
    end

    def diagonal_victory_conditions(board, color)
        count = 0
        i = 1
        while i < 5
            row = i
            col = 1
            streak = true
            while streak
                if board[row][col] == color
                    count += 1
                    row += 1
                    col += 1

                    if count == 4
                        return true
                    end
                else
                    streak = false
                    count = 0
                    i += 1
                end
            end
        end

        i = 1
        while i < 5
            row = 1
            col = i
            streak = true
            while streak
                if board[row][col] == color
                    count += 1
                    row += 1
                    col += 1

                    if count == 4
                        return true
                    end
                else
                    streak = false
                    count = 0
                    i += 1
                end
            end
        
        i = 7
        while i > 3
            row = i
            col = 1
            streak = true
            while streak
                if board[row][col] == color
                    count += 1
                    row -= 1
                    col += 1

                    if count == 4
                        return true
                    end
                else
                    streak = false
                    count = 0
                    i -= 1
                end
            end
        end

        i = 1
        while i < 5
            row = 7
            col = i
            streak = true
            while streak
                if board[row][col] == color
                    count += 1
                    row -= 1
                    col += 1

                    if count == 4
                        return true
                    end
                else
                    streak = false
                    count = 0
                    i -= 1
                end
            end
        end
        return false
    end

    def row_column_victory_conditions(board)
    end
end
