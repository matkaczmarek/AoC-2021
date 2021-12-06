file = File.open('inputs/aoc6.in')
lines = file.readlines.map(&:chomp)
fishes = lines[0].split(',').map(&:to_i)

for day in 1...80
  fishes = fishes.map{ |x| x-1 }
  zeros = fishes.count(0)
  fishes = fishes.select{ |x| x != 0 }
  fishes.fill(7, fishes.size, zeros)
  fishes.fill(9, fishes.size, zeros)
end

puts fishes.length
