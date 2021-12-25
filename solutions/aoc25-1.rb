require 'json'
require 'byebug'

file = File.open('inputs/aoc25.in')
$cucumbers = file.readlines.map(&:chomp)
$cucumbers = $cucumbers.map { |line| line.split('')}

def move_east
  moved = false
  (0...$cucumbers.length).each do |row|
    (0...$cucumbers[row].length).each do |col|
      next if $cucumbers[row][col] != '>'
      next if $cucumbers[row][(col + 1) % $cucumbers[row].length] != '.'

      $cucumbers[row][col] = 'z'
      $cucumbers[row][(col + 1) % $cucumbers[row].length] = 'x'
      moved = true
    end
  end

  (0...$cucumbers.length).each do |row|
    (0...$cucumbers[row].length).each do |col|
      $cucumbers[row][col] = '>' if $cucumbers[row][col] == 'x'
      $cucumbers[row][col] = '.' if $cucumbers[row][col] == 'z'
    end
  end

  moved
end

def move_south
  moved = false
  (0...$cucumbers[0].length).each do |col|
    (0...$cucumbers.length).each do |row|
      next if $cucumbers[row][col] != 'v'
      next if $cucumbers[(row + 1) % $cucumbers.length][col] != '.'

      $cucumbers[row][col] = 'z'
      $cucumbers[(row + 1) % $cucumbers.length][col] = 'x'
      moved = true
    end
  end

  (0...$cucumbers.length).each do |row|
    (0...$cucumbers[row].length).each do |col|
      $cucumbers[row][col] = 'v' if $cucumbers[row][col] == 'x'
      $cucumbers[row][col] = '.' if $cucumbers[row][col] == 'z'
    end
  end

  moved
end

step = 0
while true
  # puts $cucumbers.map { |x| x.join('') }
  # puts "NEXT"
  east = move_east
  south = move_south
  step += 1

  break if !east && !south
end

puts step