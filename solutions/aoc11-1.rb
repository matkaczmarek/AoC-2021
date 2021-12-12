file = File.open('inputs/aoc11.in')
lines = file.readlines.map(&:chomp)
octo = lines.map { |l| l.split('').map(&:to_i) }

total_exp = 0
for round in 1..100
  # puts octo.map { |x| x.join('') }
  # puts "NEXT"

  exp_queue = []
  for i in 0...octo.length
    for j in 0...octo[i].length
      octo[i][j] += 1
      if octo[i][j] == 10
        exp_queue.push([i, j])
        total_exp += 1
      end
    end
  end

  until exp_queue.empty?
    o = exp_queue.pop
    for i in o[0]-1..o[0]+1
      for j in o[1]-1..o[1]+1
        next if i < 0 || j < 0 || i >= octo.length || j >= octo[0].length

        octo[i][j] += 1
        if octo[i][j] == 10
          exp_queue.push([i, j])
          total_exp += 1
        end
      end
    end
  end

  for i in 0...octo.length
    for j in 0...octo[i].length
      octo[i][j] = 0 if octo[i][j] >= 10
    end
  end
end

puts total_exp
