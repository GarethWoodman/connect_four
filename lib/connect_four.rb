class ConnectFour
  attr_accessor :board, :player_one

  def initialize
    @board = Board.new
  end

  def play
    puts "Player 1: Enter name"
    player_one_name = gets.chomp
    puts "Player 1: Enter colour"
    player_one_colour = gets.chomp
    @player_one = Player.new(player_one_name, player_one_colour)
  end
end

class Board
  def initialize
    create_board
  end

  def create_board
    @board = Array.new
    @row = Array.new
    6.times do
      8.times do
        @row << "O" 
      end
      @board << @row
      @row = Array.new
    end
  end

  def show
    @board
  end
end

class Player
  attr_reader :name, :colour

  def initialize(name, colour)
    @name = name
    @colour = colour
  end
end

connect_four = ConnectFour.new
puts connect_four.board.show[0].length