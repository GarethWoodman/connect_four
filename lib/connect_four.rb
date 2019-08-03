class ConnectFour
  attr_accessor :board, :player_one, :player_two

  def initialize
    @board = Board.new
  end

  def enter_player_info
    players = Array.new
    2.times do |i|
      puts "Player #{i+1}: Enter name:"
      name = gets.chomp
      puts "Player #{i+1}: Enter colour:"
      colour = gets.chomp
      players << [name, colour]
    end
    @player_one = Player.new(players[0][0], players[0][1])
    @player_two = Player.new(players[1][0], players[1][1])
    @players = [@player_one, @player_two]
    puts "entered player info"
  end

  def start_round
    2.times do |i|
      puts "Player #{i+1}: choose column from 0-7"
      column = gets.chomp
      @board.insert_colour_into(column, @players[i].colour)
    end
  end
end

class Board
  attr_reader :board
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

  def insert_colour_into(column, player_colour)
    x = column.to_i
    6.times do |y|
      if @board[y][x] != "O"
        @board[y-1][x] = player_colour
        return
      end
    end
    @board[5][x] = player_colour
  end

  def check_board
    6.times do |y|
      8.times do |x|
        wins = possible_wins(y, x)
        if wins.include?("rrrr")
          return "Red wins!"
        elsif wins.include?("yyyy")
          return "Yellow wins!"
        end
      end
    end
    "No wins"
  end

  def show
    display_board = String.new
    for row in @board
      puts row.join("-")
    end
  end

  private
  def possible_wins(y, x)
    wins = Array.new

    horizontal = String.new
    4.times do |i|
      break if x+i > 7
      horizontal += @board[y][x+i].to_s
    end
    wins << horizontal

    return wins

    vertical = String.new
    4.times do |i|
      break if y+i > 5
      vertical += @board[y+i][x].to_s
    end
    wins << vertical

    left_diagonal = String.new
    4.times do |i|
      break if y+i > 5
      left_diagonal += @board[y+i][x-i].to_s
    end
    wins << left_diagonal

    right_diagonal = String.new
    4.times do |i|
      break if y+i > 5 or x+i > 7
      right_diagonal += @board[y+i][x+i].to_s
    end
    wins << right_diagonal

    wins
  end
end

class Player
  attr_reader :name, :colour

  def initialize(name, colour)
    @name = name
    @colour = colour
  end
end

#connect_four = ConnectFour.new
#connect_four.enter_player_info
#connect_four.start_round