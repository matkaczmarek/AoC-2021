file = File.open('inputs/aoc15.in')
lines = file.readlines.map(&:chomp)
cave = lines.map { |l| l.split('').map(&:to_i) }

dp = Array.new(cave.length){ Array.new(cave[0].length, 0) }

sum_row = 0
sum_col = 0
for i in 1...cave.length
  sum_col += cave[i][0]
  dp[i][0] = sum_col
  sum_row += cave[0][i]
  dp[0][i] = sum_row
end

dp[0][0] = 0

for i in 1...cave.length
  for j in 1...cave.length
    dp[i][j] = cave[i][j] + [dp[i-1][j], dp[i][j-1]].min
  end
end

puts dp[-1][-1]

