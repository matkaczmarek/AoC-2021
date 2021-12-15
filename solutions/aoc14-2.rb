file = File.open('inputs/aoc14.in')
lines = file.readlines.map(&:chomp)

polymer = lines[0]
hash = {}
counter_hash = {}
lines[2..].map{|p| p.split(' -> ')}.map{|p| hash[p[0]] = p[1]}
lines[2..].map{|p| p.split(' -> ')}.map{|p| counter_hash[p[0]] = 0}

for i in (0...polymer.length-1)
  pair = polymer[i..i+1]
  counter_hash[pair] += 1
end

for steps in (1..40)
  puts steps
  new_counter_hash = {}
  counter_hash.each do |k, v|
    new_counter_hash[k] = 0
  end

  counter_hash.each do |key, value|
    m = hash[key]
    new_counter_hash[key[0] + m] += value
    new_counter_hash[m + key[1]] += value
  end

  new_counter_hash.each do |k, v|
    counter_hash[k] = v
  end
end



letter_hash = {}
#counter = ('A'..'Z').map {|letter| [letter, lines[0][0] == letter || lines[0][-1] == letter ? (polymer.count(letter) + 1)/2 : polymer.count(letter)/2 ] }
('A'..'Z').map {|letter| letter_hash[letter] = 0}
counter_hash.each do |key, value|
  letter_hash[key[0]] += value
  letter_hash[key[1]] += value
end

letter_hash[lines[0][0]] += 1
letter_hash[lines[0][-1]] += 1

most = letter_hash.max_by{|k, v| v}
least = letter_hash.min_by{|k, v| v == 0 ? 2192039569602 : v }
puts  most
puts most[1]/2 - least[1]/2
