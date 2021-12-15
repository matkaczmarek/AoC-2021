file = File.open('inputs/aoc14.in')
lines = file.readlines.map(&:chomp)

polymer = lines[0]
hash = {}
lines[2..].map{|p| p.split(' -> ')}.map{|p| hash[p[0]] = p[1]}

for steps in (1..10)
  puts steps
  new_polymer = ""
  for i in (0...polymer.length-1)
    pair = polymer[i..i+1]
    new_polymer += pair[0] + hash[pair]
  end
  polymer = new_polymer + polymer[-1]
end

counter = ('A'..'Z').map {|letter| [letter, polymer.count(letter)] }
most = counter.max_by(&:last)
least = counter.select { |l| l[1] != 0 }.min_by(&:last)
puts most[1] - least[1]
