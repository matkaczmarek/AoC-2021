file = File.open('inputs/aoc6.in')
lines = file.readlines.map(&:chomp)
fishes = lines[0].split(',').map(&:to_i)

f_hash = {}
for i in 0..9
  f_hash[i] = fishes.count(i)
end

for day in 1...256
  for i in 1..9
    f_hash[i-1] = f_hash[i]
  end

  f_hash[9] = f_hash[0]
  f_hash[7] += f_hash[0]
  f_hash[0]= 0
end

puts f_hash.values.sum
