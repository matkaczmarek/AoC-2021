file = File.open('inputs/aoc20.in')
lines = file.readlines.map(&:chomp)

$decode = lines[0]
lines = lines[2..]
rows = lines.length
cols = lines[0].length

plane = Array.new(rows + 300){ Array.new(cols + 300, '.') }
(0...rows).each do |row|
  (0...cols).each do |col|
    plane[row+100][col+100] = lines[row][col]
  end
end

def get_sign(i, j, plane)
  out = ""
  (i-1..i+1).each do |row|
    (j-1..j+1).each do |col|
      out += plane[row][col] == '.' ? "0" : "1"
    end
  end

  $decode[out.to_i(2)]
end


(1..50).each do |step|
  new_plane = Array.new(rows + 300){ Array.new(cols + 300, step % 2 == 1 ? '#' : '.') }
  (3...plane.length-3).each do |row|
    (3...plane[0].length-3).each do |col|
      new_plane[row][col] = get_sign(row, col, plane)
    end
  end

  plane = new_plane
  #puts plane.map { |x| x.join('') }
  #puts "NEXT"
end

out = 0
plane[3...-3].each do |row|
  out += row[3...-3].count("#")
end

puts out
