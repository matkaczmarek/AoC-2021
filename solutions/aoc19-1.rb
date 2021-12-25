file = File.open('inputs/aoc19.in')
lines = file.readlines.map(&:chomp)

scanners = []
curr_scanner = []
total_beacons = 0
lines.each do |line|
  next if line[0..1] == '--'

  if line.length == 0
    scanners.push(curr_scanner)
    curr_scanner = []
    next
  end

  total_beacons += 1
  curr_scanner.push(line.split(',').map(&:to_i))
end

def dist(b1, b2, m, perm)
  [b1[0] + b2[perm[0]] * m[0], b1[1] + b2[perm[1]] * m[1], b1[2] + b2[perm[2]] * m[2]]
end

overlapping = 0
mul = [[1, 1, 1], [1, 1, -1], [1, -1, 1], [-1, 1, 1], [1, -1, -1], [-1, 1, -1], [-1, -1, 1], [-1, -1, -1]]
perm = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 1, 0], [2, 0, 1]]
all = []
scanners.each do |scanner1|
  scanners.each do |scanner2|
    next if scanner1 == scanner2

    distances = []
    dict = {}
    scanner1.each do |beacon1|
      scanner2.each do |beacon2|
        mul.each do |m|
          perm.each do |p|
            d = dist(beacon1, beacon2, m, p)
            distances.push(d)
            if dict[d].nil?
              dict[d] = [[beacon1, beacon2]]
            else
              dict[d].push([beacon1, beacon2])
            end
          end
        end
      end
    end

    freq = distances.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
    #puts freq
    most = distances.max_by { |v| freq[v] }
    #puts freq[most]
    if freq[most] >= 12
      dict[most].each do |pair|
        first = all.include?(pair[0])
        second = all.include?(pair[1])
        overlapping += 1 unless first && second

        all.push(*pair)
      end
    end
  end
end

puts total_beacons
puts total_beacons - overlapping
