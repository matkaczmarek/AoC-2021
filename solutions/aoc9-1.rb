file = File.open('inputs/aoc9.in')
lines = file.readlines.map(&:chomp)
smokes = lines.map { |l| l.split('').map(&:to_i) }

row_size = smokes.length
col_size = smokes[0].length

total_risk = 0
for i in 0...row_size
  for j in 0...col_size
    if i > 0 && smokes[i-1][j] <= smokes[i][j]
      next
    end

    if i < row_size-1 && smokes[i+1][j] <= smokes[i][j]
      next
    end

    if j > 0 && smokes[i][j-1] <= smokes[i][j]
      next
    end

    if j < col_size-1 && smokes[i][j+1] <= smokes[i][j]
      next
    end

    total_risk += smokes[i][j] + 1
  end
end

puts total_risk

