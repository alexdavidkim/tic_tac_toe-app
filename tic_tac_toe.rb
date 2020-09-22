class Board

  @@current_turn = 1

  def initialize
    @row1 = [1, 2, 3]
    @row2 = [4, 5, 6]
    @row3 = [7, 8, 9]
    @x_player = "X"
    @o_player = "O"
  end

  def show_board
    p @row1
    p @row2
    p @row3
  end

  def start_game
    puts "Welcome to the Tic Tac Toe App!"
    puts "(If at any time you wish to exit the game, press CTRL-C)"
    puts ""
    show_board
    move
  end

  def move
    if @@current_turn % 2 != 0 ? current_player = @x_player : 
                                 current_player = @o_player
    end
    puts ""
    puts "#{current_player}'s move, pick a square."
    print "> "
    number = gets.chomp.to_i
    if number_valid?(number)
      change_square(number, current_player)
    else
      puts "Please input a valid number."
      move
    end
    game_over?(current_player)
    show_board
    @@current_turn += 1
    move
  end

  def change_square(number, current_player)
    @row1.map! { |elem| elem == number ? current_player : elem }
    @row2.map! { |elem| elem == number ? current_player : elem }
    @row3.map! { |elem| elem == number ? current_player : elem }
  end

  def number_valid?(number)
    if @row1.include?(number) || @row2.include?(number) || @row3.include?(number)
      true
    end
  end

  def game_over?(current_player)
    column1 = [@row1[0], @row2[0], @row3[0]]
    column2 = [@row1[1], @row2[1], @row3[1]]
    column3 = [@row1[2], @row2[2], @row3[2]]
    diag1 = [@row1[0], @row2[1], @row3[2]]
    diag2 = [@row1[2], @row2[1], @row3[0]]
    victory_combos = [@row1, @row2, @row3, column1, column2, column3,
                      diag1, diag2]
    if victory_combos.any? { |arr| arr.all?(current_player) == true }
      show_board
      puts ""
      puts "GAME OVER - PLAYER #{current_player} WINS!"
      exit
    elsif victory_combos.all? { |arr| arr.any?(Integer) == false }
      show_board
      puts "GAME OVER - NO PLAYER WON"
      exit
    end        
  end

end



board = Board.new

board.start_game
