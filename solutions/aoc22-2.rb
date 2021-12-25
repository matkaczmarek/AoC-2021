file = File.open('inputs/aoc22.in')
lines = file.readlines.map(&:chomp)

parsed = []
lines.each do |line|
  new_parsed = []
  new_parsed.push(line.split(' ')[0])
  line.split(',').each do |part|
    dim = part.split('=')[1].split('..').map(&:to_i)
    new_parsed.push(dim)
  end

  parsed.push(new_parsed)
end

on = {}

parsed.each do |cube|
  x_min = cube[1][0]
  x_max = cube[1][1]
  y_min = cube[2][0]
  y_max = cube[2][1]
  z_min = cube[3][0]
  z_max = cube[3][1]

  next if x_max < x_min || y_max < y_min || z_max < z_min
  (x_min..x_max).each do |x|
    (y_min..y_max).each do |y|
      (z_min..z_max).each do |z|
        if cube[0] == 'on'
          on[[x, y, z]] = true
        else
          on.delete([x, y, z])
        end
      end
    end
  end
end

puts on.length
