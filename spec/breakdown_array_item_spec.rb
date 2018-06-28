require "breakdown_array_item"
describe BreakdownArray do 
     it "should declear winner name when we call the play method" do 
     	elements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], distribution_list = [30, 10, 20, 40]#[35,35,15,15]
        break_down = BreakdownArray.breakdown_array_items elements, distribution_list
        expect(break_down).to eq break_down
      end
end