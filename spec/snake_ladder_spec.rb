require "snake_ladder"
describe SnakeLadder do 
     it "should declear winner name when we call the play method" do 
     	players = ["Style", "tag", "vinay","gupta"]
        snake_ladder_game = SnakeLadder.new(players,6,5, 5,100) 
        winner = snake_ladder_game.play 
        expect(winner).to eq winner
      end
end