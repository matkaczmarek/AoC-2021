file = File.open('inputs/aoc15.in')
lines = file.readlines.map(&:chomp)
org_cave = lines.map { |l| l.split('').map(&:to_i) }
cave = Array.new(5*org_cave.length){ Array.new(5*org_cave[0].length, 0) }

for i in 0...5
  add = i
  for j in 0...5
    for row in 0...org_cave.length
      for col in 0...org_cave.length
        index_i = row + org_cave.length*i
        index_j = col + org_cave.length*j

        cave[index_i][index_j] = (org_cave[row][col] + add) > 9 ? (org_cave[row][col] + add)%9 : (org_cave[row][col] + add)
      end
    end
    add += 1
  end
end

# puts cave.map { |x| x.join('') }
dp = Array.new(cave.length){ Array.new(cave[0].length, -1) }

sum_row = 0
sum_col = 0
for i in 1...cave.length
  sum_col += cave[i][0]
  dp[i][0] = sum_col
  sum_row += cave[0][i]
  dp[0][i] = sum_row
end

dp[0][0] = 0

(0..10).each do |step|
  (0...cave.length).each do |i|
    (0...cave.length).each do |j|
      next if i == 0 && j == 0

      neighbours = [dp[i-1][j], dp[i][j-1]]
      neighbours.push(dp[i+1][j]) if i < cave.length - 1
      neighbours.push(dp[i][j+1]) if j < cave.length - 1

      dp[i][j] = neighbours.select { |e| !e.nil? && e != -1 }.min + cave[i][j]
    end
  end
end

puts dp[-1][-1]

