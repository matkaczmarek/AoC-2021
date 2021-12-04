file = File.open('inputs/aoc4.in')
bingo = file.readlines.map(&:chomp)
numbers = bingo[0].split(',').map(&:to_i)

bingo = bingo[2...]
boards = []
curr_board = []
for i in 0..bingo.length-1
  line = bingo[i]
  if line.length == 0
    boards.push(curr_board)
    curr_board = []
    next
  end

  curr_board.push(line.split.map(&:to_i))
end

def check_bingo(board, row, col)
  row_check = true
  for i in 0..4
    if board[row][i] > 0
      row_check = false
      break
    end
  end

  col_check = true
  for i in 0..4
    if board[i][col] > 0
      col_check = false
      break
    end
  end

  col_check || row_check
end

def output(board, win_num)
  sum = 0
  for i in 0..4
    for j in 0..4
      if board[i][j] == win_num
        board[i][j] *= -1
      else
        sum += board[i][j] if board[i][j] > 0
      end
    end
  end

  sum * win_num
end

last_win = 0
won = Array.new(boards.length, false)
numbers.each do |num|
  boards.each_with_index do |board, index|
    next if won[index]
    for i in 0..4
      for j in 0..4
        if board[i][j] == num
          board[i][j] *= -1
          if check_bingo(board, i, j)
            last_win = output(board, num)
            won[index] = true
          end
        end
      end
    end
  end
end
puts last_win
