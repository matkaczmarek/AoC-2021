target_x = [155, 182]
target_y = [-117, -67]

good_y = []
(-300..3000).each do |y|
  (0..182).each do |x|
    cur_x = 0
    cur_y = 0
    velo_x = x
    velo_y = y
    highest_y = 0
    good = false
    (1..10000).each do |step|
      break if cur_y < target_y[1]
      break if cur_x > target_x[1] || cur_x < 0

      cur_x += velo_x
      cur_y += velo_y
      velo_y -= 1
      if velo_x != 0
        velo_x -= 1
      end
      highest_y = [highest_y, cur_y].max

      next unless cur_x >= target_x[0] && cur_x <= target_x[1] && cur_y >= target_y[0] && cur_y <= target_y[1]

      good_y.push(highest_y)
      good = true
      break
    end
    break if good
  end
end

puts good_y.max
