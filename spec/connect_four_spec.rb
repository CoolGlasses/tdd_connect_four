require 'connect_four'

RSpec.describe Player do
    describe "name" do
        it "should display the name of the given player" do
        expect(name).to eql "#{@name}"
        end
    end
        

    describe "color" do
        it "should display the color of the given player" do
           expect(color).to eql "#{@color}" 
        end
    end
    
end

RSpec.describe Board do
    describe "create_board" do
        
    end
    
end

RSpec.describe Game do
    describe "new_game" do
        
    end

    describe "game_over" do
        
    end

    describe "get_players" do
        
    end

    describe "get_color" do
        
    end

    describe "play" do
        
    end

    describe "get_move" do
        
    end
end