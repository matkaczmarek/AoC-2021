file = File.open('inputs/aoc21.in')
lines = file.readlines.map(&:chomp)

first_start = 5
second_start = 9
first_score, second_score = 0, 0

$dice = 0
def roll_dice
  $dice = ($dice + 1) % 100
  $dice = 100 if $dice == 0

  $dice
end


round = 0
while first_score < 1000 && second_score < 1000
  rolled = roll_dice + roll_dice + roll_dice

  if round % 2 == 0
    puts first_start, rolled, "NEXT"
    first_start = (first_start + rolled) % 10
    first_start = 10 if first_start == 0
    first_score += first_start
  else
    second_start = (second_start + rolled) % 10
    second_start = 10 if second_start == 0
    second_score += second_start
  end

  round += 3
end

puts round
puts first_score
puts second_score
puts round * (first_score >= 1000 ? second_score : first_score)
