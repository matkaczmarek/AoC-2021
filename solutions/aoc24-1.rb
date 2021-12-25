require 'json'
require 'byebug'

file = File.open('inputs/aoc24.in')
lines = file.readlines.map(&:chomp)
lines = lines.map { |line| line.split(' ') }

$vars = {}
def init_vars
  $vars["w"] = 0
  $vars["x"] = 0
  $vars["y"] = 0
  $vars["z"] = 0
end

$ctr = 0
def perform_op(line, num)
  case line[0]
  when 'inp'
    $vars[line[1]] = num.to_s[$ctr].to_i
    $ctr += 1
  when 'add'
    if %w[x y z w].include?(line[2])
      $vars[line[1]] += $vars[line[2]]
    else
      $vars[line[1]] += line[2].to_i
    end
  when 'mul'
    if %w[x y z w].include?(line[2])
      $vars[line[1]] *= $vars[line[2]]
    else
      $vars[line[1]] *= line[2].to_i
    end
  when 'div'
    if %w[x y z w].include?(line[2])
      $vars[line[1]] = ($vars[line[1]]/$vars[line[2]]).floor
    else
      $vars[line[1]] = ($vars[line[1]]/line[2].to_i).floor
    end
  when 'mod'
    if %w[x y z w].include?(line[2])
      $vars[line[1]] %= $vars[line[2]]
    else
      $vars[line[1]] %= line[2].to_i
    end
  when 'eql'
    if %w[x y z w].include?(line[2])
      $vars[line[1]] = $vars[line[1]] == $vars[line[2]] ? 1 : 0
    else
      $vars[line[1]] = $vars[line[1]] == line[2].to_i ? 1 : 0
    end
  end
end

(99999999999999).downto(10000000000000).each do |num|
  next if num.to_s.include?('0')

  $ctr = 0
  init_vars
  lines.each do |line|
    perform_op(line, num)
  end

  if $vars['z'] == 0
    puts num
    break
  end
end
