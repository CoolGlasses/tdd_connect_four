require 'connect_four'

RSpec.describe Player do
    describe "name" do
        it "should display the name of the given player" do
            player = Player.new
            expect(player.name).to eql "#{@name}"
        end
    end
        

    describe "color" do
        it "should display the color of the given player" do
            player = Player.new
            expect(player.color).to eql "#{@color}" 
        end
    end
    
end

RSpec.describe Board do
    describe "create_board" do
        it "should create a 2D array with 7-rows" do
            board = create_board()
            expect(board.length).to eql(7)
        end

        it "should have a sub-array for each row that is 8-columns wide" do
            board = create_board()
            expect(board[0].length).to eql(8)
        end

        it "will fill the 2D array with the unicode character for an empty square" do
            square = "\u25a2"
            board = create_board()
            expect(board[1][1]).to eql(square.encode("utf-8"))
        end

        it "will fill the first column with capital letters, A thru G" do
            board = create_board()
            expect(board[1][0]).to eql("A")
        end  
    end
end

RSpec.describe Game do
    describe "new_game" do
        it "should create a new instance of the Board class" do
            expect().to eql
        end
    end

    describe "game_over" do
        it "should accept a 2D array with victory conditions met as an argument and return true" do
            expect(game_over()).to eql true
        end

        it "should return the color of the piece that accomplished victory conditions" do
        end

        it "should accept a 2D array without victory conditions and return false" do
            expect(game_over()).to eql false
        end

        it "should call helper method #diagonal_victory_conditions to determine if a diagonal win was played" do

        end
        
        it "should call helper method #row_column_victory_conditions to determine if a diagonal win was played" do
        
        end
    end

    describe "diagonal_victory_conditions" do
        it "should accept a board as an argument" do
        end

        it "should determine if 4 diagonally adjacent cells, to the right, are the same" do
        end

        it "should determine if 4 diagonally adjacent cells, to the left, are the same" do
        end

        it "should not allow 'nil' adjacent cells to trigger victory" do
        end
    
    end

    describe "row_column_victory_conditions" do
        it "should accept a board as an argument" do
        end
        
        it "should determine if 4 horizontally adjacent cells are the same" do
        end

        it "should determine if 4 vertically adjacent cells are the same" do
        end

        it "should not allow 'nil' adjacent cells to trigger victory" do
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