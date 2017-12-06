class Queens

  def start
    init
  end

  def init
    @board = Array.new(8)
    @board.map! { Array.new(8, '-') }
  end

  def display_board
    @board.each_index do |row|
      @board.each_index do |col|
        print " #{@board[row][col]} "
      end
      puts
    end
    puts ""
  end

  def find_solutions(row)

    for col in 0..7
      if valid(row, col)
        @board[row][col] = '*'
        if row == 7
          display_board
        else
          find_solutions(row+1)
        end
        @board[row][col] = '-'
      end
    end
  end

  # Valid if check_row, check_col, and check_diag all return true
  def valid(row, col)
    if check_row(row) and check_col(col) and check_diag(row, col)
      return true
    else
      return false
    end
  end

  # For each column in given row, check if value is '*' or '-'
  def check_row(row)
    for col in 0..7
        if @board[row][col] == '*'
          return false
        end
    end
    return true
  end

  # For each row in given column, check if value is '*' or '-'
  def check_col(col)
    for row in 0..7
      if @board[row][col] == '*'
        return false
      end
    end
    return true
  end

  # For a given position (row, col) check in 4 diagonal directions for '*'
  def check_diag(row, col)

    # North-East diagonal
    row_i = row-1
    col_i = col+1
    while row_i > -1 and col_i < 8
      if @board[row_i][col_i] == '*'
        return false
      end
      row_i -= 1
      col_i += 1
    end

    # North-West diagonal
    row_i = row-1
    col_i = col-1
    while row_i > -1 and col_i > -1
      if @board[row_i][col_i] == '*'
        return false
      end
      row_i -= 1
      col_i -= 1
    end

    # South-East diagonal
    row_i = row+1
    col_i = col+1
    while row_i < 8 and col_i < 8
      if @board[row_i][col_i] == '*'
        return false
      end
      row_i += 1
      col_i += 1
    end

    # South-West diagonal
    row_i = row+1
    col_i = col-1
    while row_i < 8 and col_i > -1
      if @board[row_i][col_i] == '*'
        return false
      end
      row_i += 1
      col_i -= 1
    end

    return true
  end

#class ends
end

newQ = Queens.new
newQ.start
newQ.find_solutions(0)