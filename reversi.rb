
# need a way to verify move for your color
# need to have 2 players, players each take a color
# board looks at the peices, and calls that method for them
# valid move method, that says if there is possible move, returns true w/first affirmative
# pieces to flip -> returns an array of each (coordinate that needs to flip)/object
# victory -> one of players cant make move, or all tiles are filled
# points -> method to find players points. (board class > passed color as argument)

module Reversi
  class Piece
    attr_reader :color

    def initialize(color)
      @color = color
    end

    def flip
      # MZ: These things are gonna look like cirque du solei when flipping
      @color = ( @color == :pink ? :teal : :pink )
    end
  end

  class Board
    DELTAS = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]

    attr_reader :rows

    def initialize
      @rows = Array.new(8) { Array.new(8) }
      init_play
    end

    def init_play
      @rows[3][3] = Piece.new(:pink)
      @rows[3][4] = Piece.new(:teal)
      @rows[4][3] = Piece.new(:teal)
      @rows[4][4] = Piece.new(:pink)
    end

    def place(row, column, color)
      @rows[row][column] = Piece.new(color)
    end

    def valid_move?(row, column, color)
      return false if @rows[row][column]

      opposing_slopes = opposing_neighbor_slopes(row, column, color)

    end

    # MZ: RE this method and your comment on line 91... I think this is a good strategy.
    # We converged on basically an identical strategy where
    # we just keep incrementing(or decrementing) the row/column by the corrisponding
    # directional delta coord (i hope that made sense lol).
    # Just like your comment says, when we hit a sister piece or get off the board we would stop
    def opposing_neighbor_slopes(row, column, color)
        DELTAS.select do|(x,y)|
          r = row + x
          c = column + y
          on_board?(r, c) &&
          @rows[r][c] &&
          @rows[r][c].color != color
        end
      end
    end

    # MZ: Clean check -- very readable.
    def on_board?(row, col)
      (0..7).include?(row) && (0..7).include?(col)
    end

    def get_paths(from, opposing_slopes)
      r, c = from
      paths = []
      opposing_slopes.each do
        7.times do
        while on_board
        end
      end

      # take in opp_neighbor and from coords.
      # find which path/slope of line you are on, travel down till find your
      # color OR go off board
    end
  end
end

