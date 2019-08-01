require './lib/connect_four'

RSpec.describe ConnectFour do
  connect_four = ConnectFour.new
  describe "#ConnectFour" do
    it "returns width of 8" do
      expect(connect_four.board.show[0].length).to eql (8)
    end

    it "returns height of 6" do
      expect(connect_four.board.show.length).to eql (6)
    end

    it "players name entered and returned" do
      puts 
      connect_four.play
      puts "Enter name to match"
      expect(connect_four.player_one.name).to eql (gets.chomp)
    end
  end
end

