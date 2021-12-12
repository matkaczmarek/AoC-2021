file = File.open('inputs/aoc10.in')
lines = file.readlines.map(&:chomp)
lines = lines.map { |l| l.split('') }

total = [0, 0, 0, 0]
points = [3, 57, 1197, 25137]
lines.each do |line|
  stack = []
  line.each do |par|
    if %w|( { [ <|.include?(par)
      stack.push(par)
      next
    end

    case par
    when ')'
      if stack.last != '('
        total[0] += 1
        break
      else
        stack.pop
      end
    when '}'
      if stack.last != '{'
        total[2] += 1
        break
      else
        stack.pop
      end
    when ']'
      if stack.last != '['
        total[1] += 1
        break
      else
        stack.pop
      end
    when '>'
      if stack.last != '<'
        total[3] += 1
        break
      else
        stack.pop
      end
    end
  end
end
puts total
puts total[0] * points[0] + total[1] * points[1] + total[2] * points[2] + total[3] * points[3]
