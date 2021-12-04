file = File.open('inputs/aoc3.in')
codes = file.readlines.map(&:chomp)[0...-1]

ones = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
codes.each do |code|
  for i in 0..ones.length-1
    ones[i] += code[i].to_i
  end
end

gamma = ""
epsilon = ""
for i in 0..ones.length-1
  gamma += ones[i] > codes.length/2 ? "1" : "0"
  epsilon += ones[i] > codes.length/2 ? "0" : "1"
end

puts gamma.to_i(2) * epsilon.to_i(2)
