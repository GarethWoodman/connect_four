require './lib/connect_four'

RSpec.describe ConnectFour do
  connect_four = ConnectFour.new
  describe "#ConnectFour" do
    it "returns width of 8" do
      expect(connect_four.board.board[0].length).to eql (8)
    end

    it "returns height of 6" do
      expect(connect_four.board.board.length).to eql (6)
    end

    it "players name entered and returned" do
      puts 
      connect_four.enter_player_info
      expect(connect_four.player_one.name.is_a? String).to eql (true)
      expect(connect_four.player_one.colour).to eql ("r")
      expect(connect_four.player_two.name.is_a? String).to eql (true)
      expect(connect_four.player_two.colour).to eql ("y")
    end

    xit "players inserts colour into a column" do
      skip
      puts
      connect_four.start_round
      expect(connect_four.board.board[5].include?("r")).to eql (true)
      expect(connect_four.board.board[5].include?("y")).to eql (true)
    end

    it "returns no wins because there's no 4" do
      puts
      connect_four.board.check_board
      expect(connect_four.board.check_board).to eql ("No wins")
    end

    it "red wins if horrizontal" do
      puts
      connect_four.board.insert_colour_into(5, "r")
      connect_four.board.insert_colour_into(4, "r")
      connect_four.board.insert_colour_into(3, "r")
      connect_four.board.insert_colour_into(2, "r")
      expect(connect_four.board.check_board).to eql("Red wins!")
    end

    it "red wins if vertical" do
      puts
      connect_four.board.insert_colour_into(0, "r")
      connect_four.board.insert_colour_into(0, "r")
      connect_four.board.insert_colour_into(0, "r")
      connect_four.board.insert_colour_into(0, "r")
      expect(connect_four.board.check_board).to eql("Red wins!")
    end
  end
end

