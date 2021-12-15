file = File.open('inputs/aoc13.in')
lines = file.readlines.map(&:chomp)

points = []
folds = []
p = true
max_x = 0
max_y = 0

lines.each do |line|
  if line.length == 0
    p = false
    next
  end

  if p
    point = line.split(',').map(&:to_i)
    points.push(point)
    max_x = [point[0], max_x].max
    max_y = [point[1], max_y].max
    next
  end

  f = line.split('=')
  folds.push([f[0][-1], f[1].to_i])
end

first_x = 0
last_y = max_y
plane = Array.new(max_y + 1){ Array.new(max_x + 1, 0) }

points.each do |point|
  plane[point[1]][point[0]] = 1
end

c = 0
folds.each do |fold|
  is_x = fold[0] == 'x'

  if is_x
    counter = 1
    for col in (fold[1]-1).downto(first_x)
      for row in 0..last_y
        plane[row][fold[1]+counter] += plane[row][col]
      end
      counter += 1
    end

    first_x = fold[1]
  else
    counter = 1
    for row in fold[1]+1..last_y
      for col in first_x..max_x
        plane[fold[1]-counter][col] += plane[row][col]
      end
      counter += 1
    end

    last_y = fold[1]
  end

  # puts plane.map { |x| x.join('') }
  # puts "NEXT"

  c += 1
  if c == 1
    break
  end
end

out = 0
for j in 0..last_y
  for i in first_x..max_x
    out += 1 if plane[j][i] > 0
  end
end

puts out
