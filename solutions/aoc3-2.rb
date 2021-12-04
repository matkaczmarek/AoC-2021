file = File.open('inputs/aoc3.in')
codes = file.readlines.map(&:chomp)

codes_co2 = codes[0...]
codes_oxygen = codes[0...]
for i in 0..13

  ones_co2 = 0
  ones_oxygen = 0
  codes_co2.each do |code|
    ones_co2 += code[i].to_i
  end

  codes_oxygen.each do |code|
    ones_oxygen += code[i].to_i
  end

  if ones_oxygen >=  codes_oxygen.length - ones_oxygen
    codes_oxygen = codes_oxygen.select { |code| code[i].to_i == 1 } if codes_oxygen.length > 1
  else
    codes_oxygen = codes_oxygen.select { |code| code[i].to_i == 0 } if codes_oxygen.length > 1
  end

  if ones_co2 >=  codes_co2.length - ones_co2
    codes_co2 = codes_co2.select { |code| code[i].to_i == 0 } if codes_co2.length > 1
  else
    codes_co2 = codes_co2.select { |code| code[i].to_i == 1 } if codes_co2.length > 1
  end
end

puts codes_co2, codes_oxygen
puts codes_co2[0].to_i(2) * codes_oxygen[0].to_i(2)
