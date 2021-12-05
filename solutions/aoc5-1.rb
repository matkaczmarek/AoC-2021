file = File.open('inputs/aoc5.in')
lines = file.readlines.map(&:chomp)

def horizontal(cords)
  cords[0] == cords[2]
end

def vertical(cords)
  cords[1] == cords[3]
end

delimiters = [',', ' -> ']
max_x = 0
max_y = 0
cords = []
lines.each do |line|
  cord = line.split(Regexp.union(delimiters)).map(&:to_i)
  cords.push(cord)
  max_x = [cord[0], cord[2], max_x].max
  max_y = [cord[1], cord[3], max_y].max
end

plane = Array.new(max_y + 1){ Array.new(max_x + 1, 0) }

cords.each do |cord|
  if vertical(cord)
    x1 = [cord[0], cord[2]].min
    x2 = [cord[0], cord[2]].max
    for row in x1..x2
      plane[cord[1].to_i][row.to_i] += 1
    end
  else
    y1 = [cord[1], cord[3]].min
    y2 = [cord[1], cord[3]].max
    for col in y1..y2
      plane[col.to_i][cord[0].to_i] += 1
    end
  end
end

sum = 0
plane.each do |row|
  row.each do |r|
    sum += 1 if r > 1
  end
end

puts sum
