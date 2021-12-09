file = File.open('inputs/aoc9.in')
lines = file.readlines.map(&:chomp)
$smokes = lines.map { |l| l.split('').map(&:to_i) }

row_size = $smokes.length
col_size = $smokes[0].length

$visited = Array.new(row_size){ Array.new(col_size, false) }

def visit_basin(i, j, acc)
  return acc if i < 0 || i >= $smokes.length || j < 0 || j >= $smokes[0].length || $smokes[i][j] == 9 || $visited[i][j]

  $visited[i][j] = true
  acc += 1
  acc = visit_basin(i+1, j, acc)
  acc = visit_basin(i-1, j, acc)
  acc = visit_basin(i, j+1, acc)
  acc = visit_basin(i, j-1, acc)
  acc
end

basins_sizes = []
for i in 0...row_size
  for j in 0...col_size
    next if $visited[i][j] || $smokes[i][j] == 9

    basins_sizes.append(visit_basin(i, j, 0))
  end
end

basins_sizes = basins_sizes.sort.reverse
puts basins_sizes[0] * basins_sizes[1] * basins_sizes[2]


