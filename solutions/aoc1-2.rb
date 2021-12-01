file = File.open('inputs/aoc1.in')
depths = file.readlines.map(&:chomp)
depths = depths.map(&:to_i)

out = 0
for counter in 3...depths.length
  out += 1 if depths[counter] > depths[counter-3]
end

puts out

