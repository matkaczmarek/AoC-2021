file = File.open('inputs/aoc10.in')
lines = file.readlines.map(&:chomp)
lines = lines.map { |l| l.split('') }

total = []
points = [1, 2, 3, 4]
correct_lines = []
lines.each do |line|
  stack = []
  valid = true
  line.each do |par|
    if %w|( { [ <|.include?(par)
      stack.push(par)
      next
    end

    case par
    when ')'
      if stack.last != '('
        valid = false
        break
      else
        stack.pop
      end
    when '}'
      if stack.last != '{'
        valid = false
        break
      else
        stack.pop
      end
    when ']'
      if stack.last != '['
        valid = false
        break
      else
        stack.pop
      end
    when '>'
      if stack.last != '<'
        valid = false
        break
      else
        stack.pop
      end
    end
  end
  correct_lines.push(line) if valid
end

correct_lines.each do |line|
  stack = []
  valid = true
  line.each do |par|
    if %w|( { [ <|.include?(par)
      stack.push(par)
    else
      stack.pop
    end
  end

  sub_score = 0
  while !stack.empty?
    sub_score *= 5
    case stack.last
    when '('
      sub_score += 1
    when '{'
      sub_score += 3
    when '['
      sub_score += 2
    when '<'
      sub_score += 4
    end

    stack.pop
  end

  total.push(sub_score)
end

puts total.sort[total.length / 2]
