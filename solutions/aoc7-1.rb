file = File.open('inputs/aoc7.in')
lines = file.readlines.map(&:chomp)
crabs = lines[0].split(',').map(&:to_i)

freq = crabs.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
most_freq = freq.sort_by { |k, v| v }.reverse

min_s = 2 << 32
most_freq.each_with_index do |crab, index|
  break if index > 100

  s = crabs.reduce(0) { |sum, c| sum + (c - crab[0]).abs }
  min_s = [s, min_s].min
end

puts min_s
