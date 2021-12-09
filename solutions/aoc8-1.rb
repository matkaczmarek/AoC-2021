file = File.open('inputs/aoc8.in')
lines = file.readlines.map(&:chomp)
in_out = lines.map{ |l| l.split(' | ')}
input = in_out.map { |io| io[0] }
output = in_out.map { |io| io[1] }
puts output

output = output.map { |o| o.split(' ').select { |w| [2, 3, 4, 7].include?(w.length)} }
puts output.reduce(0) { |sum, o| sum += o.length }
