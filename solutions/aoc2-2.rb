file = File.open('inputs/aoc2.in')
instructions = file.readlines.map(&:chomp).map(&:split)

depth = 0
forward = 0
aim = 0
instructions.each do |ins|
  case ins[0]
  when 'forward'
    forward += ins[1].to_i
    depth += aim * ins[1].to_i
  when 'up'
    aim -= ins[1].to_i
  when 'down'
    aim += ins[1].to_i
  end
end

puts depth * forward
