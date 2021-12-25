target_x = [155, 182]
target_y = [-117, -67]

counter = 0
(-300..2000).each do |y|
  (0..300).each do |x|
    cur_x = 0
    cur_y = 0
    velo_x = x
    velo_y = y
    highest_y = 0
    (1..20000).each do |step|
      break if cur_y < target_y[0]
      break if cur_x > target_x[1] || cur_x < 0

      cur_x += velo_x
      cur_y += velo_y
      velo_y -= 1
      if velo_x != 0
        velo_x -= 1
      end
      highest_y = [highest_y, cur_y].max

      next unless cur_x >= target_x[0] && cur_x <= target_x[1] && cur_y >= target_y[0] && cur_y <= target_y[1]

      counter += 1
      break
    end
  end
end

puts counter
