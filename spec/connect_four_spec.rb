require 'connect_four'

RSpec.describe Player do
    describe "name" do
        it "should display the name of the given player" do
            player = Player.new("Robin", "black")
            expect(player.name).to eql "Robin"
        end
    end
        

    describe "color" do
        it "should display the color of the given player" do
            player = Player.new("Robin", "black")
            expect(player.color).to eql "black" 
        end
    end
    
end

RSpec.describe Board do
    describe "create_board" do
        it "should create a 2D array with 7-rows" do

            board = Board.new
            board.create_board()
            expect(board.length).to eql(7)
        end

        it "should have a sub-array for each row that is 8-columns wide" do
            board = Board.new
            board.create_board()
            expect(board[0].length).to eql(8)
        end

        it "will fill the 2D array with the unicode character for an empty square" do
            square = "\u25a2"
            board = Board.new
            array = board.create_board()
            expect(array[1][1]).to eql(square.encode("utf-8"))
        end

        it "will fill the first column with capital letters, A thru G" do
            board = Board.new
            array = board.create_board()
            expect(array[1][0]).to eql("A")
        end  
    end
end

RSpec.describe Game do
    before do
        player1 = "Robin"
        player2 = "Whitney"
        @victory_diagonal_left =
            [
             [nil,   1,   2,   3,   4,   5,   6,   7],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", player1, nil, nil, nil, nil, nil, nil],
             ["E", player2, player1, nil, nil, nil, nil, nil],
             ["F", player2, player2, player1, nil, nil, nil, nil],
             ["G", player2, player2, player2, player1, nil, nil, nil],
            ]
        @victory_diagonal_right =
            [
             [nil,   1,   2,   3,   4,   5,   6,   7],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", nil, nil, nil, player1, nil, nil, nil],
             ["E", nil, nil, player1, player2, nil, nil, nil],
             ["F", nil, player1, player2, player2, nil, nil, nil],
             ["G", player1, player2, player2, player2, nil, nil, nil],
            ]
        @victory_vertical =
            [
             [nil,   1,   2,   3,   4,   5,   6,   7],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", player1, nil, nil, nil, nil, nil, nil],
             ["E", player1, nil, nil, nil, nil, nil, nil],
             ["F", player1, nil, nil, nil, nil, nil, nil],
             ["G", player1, nil, nil, nil, nil, nil, nil],
            ]
        @victory_horizontal = 
            [
             [nil,   1,   2,   3,   4,   5,   6,   7],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", nil, nil, nil, nil, nil, nil, nil],
             ["E", nil, nil, nil, nil, nil, nil, nil],
             ["F", nil, nil, nil, nil, nil, nil, nil],
             ["G", player1, player1, player1, player1, nil, nil, nil],
            ]
        @nil_board = 
            [
             [nil,   1,   2,   3,   4,   5,   6,   7],
             ["A", nil, nil, nil, nil, nil, nil, nil],
             ["B", nil, nil, nil, nil, nil, nil, nil],
             ["C", nil, nil, nil, nil, nil, nil, nil],
             ["D", nil, nil, nil, nil, nil, nil, nil],
             ["E", nil, nil, nil, nil, nil, nil, nil],
             ["F", nil, nil, nil, nil, nil, nil, nil],
             ["G", nil, nil, nil, nil, nil, nil, nil],
            ]
    end
    describe "new_game" do
        it "should create a new instance of the Board class" do
            board = Board.new
            expect(board).to_not eql(nil)
        end
    end

    describe "game_over" do
        it "should accept a 2D array with victory conditions met as an argument and return true" do
            expect(game_over(@victory_vertical)).to eql([true, player1])
        end

        it "should return the color of the piece that accomplished victory conditions" do
            expect(game_over(@victory_vertical)).to eql([true, player1])
        end

        it "should accept a 2D array without victory conditions and return false" do
            expect(game_over(@nil_board)).to eql false
        end
    end

    describe "diagonal_victory_conditions" do
        it "should accept a board as an argument" do
            expect(diagonal_victory_conditions(@nil_board)).to_not raise_error
        end

        it "should determine if 4 diagonally adjacent cells, to the right, are the same" do
            expect(diagonal_victory_conditions(@victory_diagonal_right)).to eql true
        end

        it "should determine if 4 diagonally adjacent cells, to the left, are the same" do
            expect(diagonal_victory_conditions(@victory_diagonal_left)).to eql true
        end

        it "should not allow 'nil' adjacent cells to trigger victory" do
            expect(diagonal_victory_conditions(@nil_board)).to eql false
        end
    
    end

    describe "row_column_victory_conditions" do
        it "should accept a board as an argument" do
            expect(row_column_victory_conditions(@nil_board)).to_not raise_error
        end
        
        it "should determine if 4 horizontally adjacent cells are the same" do
            expect(row_column_victory_conditions(@victory_horizontal)).to eql true
        end

        it "should determine if 4 vertically adjacent cells are the same" do
            expect(row_column_victory_conditions(@victory_vertical)).to eql true
        end

        it "should not allow 'nil' adjacent cells to trigger victory" do
            expect(row_column_victory_conditions(@nil_board)).to eql false
        end
    end

    describe "get_players" do
        it "should ask for a user name by asking for user input" do
            
        end

        it "should assign user input to the variable name in a new instance of the Player class" do
            
        end
    end

    describe "get_color" do
        it "should ask for a users color choice by asking for user input" do
            
        end

        it "should assign user input for color choice to variable color of the established instance of the Player class" do
            
        end

        it "should require player 2 to be assigned the color choice player 1 did not choose -- if player 1 exists" do
            
        end
        
    end

    describe "play" do
        it "should display the board" do
            
        end

        it "should #get_move to allow a player to take a turn" do
            
        end

       

        it "should call #game_over after every move to determine if victory conditions had been met" do
            
        end

        it "should display the updated board after every move" do
            
        end


        
    end

    describe "get_move" do
        it "should ask for a column number to play from user" do
            
        end

        it "should check move choice for validity" do
            
        end

        it "should return a column number stipulating the move to be made" do
            
        end
        
    end
end