file = File.open('inputs/aoc8.in')
lines = file.readlines.map(&:chomp)
in_out = lines.map{ |l| l.split(' | ') }
input = in_out.map { |io| io[0] }
output = in_out.map { |io| io[1] }

output = output.map { |o| o.split(' ') }
input = input.map { |i| i.split(' ') }

output_sum = 0
input.each_with_index do |num, idx|
  sum = 0
  h = {}
  num_out = output[idx].reverse

  num.each do |n|
    case n.length
    when 2
      h[1] = n.split('')
    when 3
      h[7] = n.split('')
    when 4
      h[4] = n.split('')
    when 7
      h[8] = n.split('')
    else
      next
    end
  end

  num_out.each_with_index do |o, idx|
    case o.length
    when 2
      sum += 10**idx
    when 3
      sum += 7 * 10**idx
    when 4
      sum += 4 * 10**idx
    when 7
      sum += 8 * 10**idx
    else
      bd = h[4].select { |letter| !h[1].include?(letter) }
      if o.length == 5
        if h[1].all? { |letter| o.include?(letter) }
          sum += 3 * 10**idx
        elsif bd.all? { |letter| o.include?(letter)}
          sum += 5 * 10**idx
        else
          sum += 2 * 10**idx
        end
      else
        if !h[1].all? { |letter| o.include?(letter) }
          sum += 6 * 10**idx
        elsif h[4].all? { |letter| o.include?(letter) }
          sum += 9 * 10**idx
        end
      end
    end
  end

  output_sum += sum
end

puts output_sum
