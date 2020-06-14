class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil, player_2=nil, board=Board.new)
    @player_1 = player_1 == nil ? Players::Human.new("X") : player_1
    @player_2 = player_2 == nil ? Players::Human.new("O") : player_2
    @board = board == nil ? Board.new : board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player
    board.turn_count % 2 == 0 ?  @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      tokens = combo.map {|position| @board.cells[position]}
      if tokens.all? {|t| t == "X"} or tokens.all? {|t| t == "O"}
        return combo
      else
        next
      end
    end
    false
  end

  def draw?
    if @board.cells.all? {|cell| @board.taken?(cell)} && won? == false
      return "Draw"
    end
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    position =  current_player.move(@board)
    binding.pry
    while @board.valid_move?(position) == false
      position = current_player.move(@board)
     end
  end
end
