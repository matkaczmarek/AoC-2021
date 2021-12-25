file = File.open('inputs/aoc21.in')
lines = file.readlines.map(&:chomp)

first_start = 5
second_start = 9

dp = {}

(21..30).each do |first_score|
  (0..20).each do |second_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        dp[[first_score, second_score, first_pos, second_pos, 0]] = [1, 0]
        dp[[first_score, second_score, first_pos, second_pos, 1]] = [1, 0]
      end
    end
  end
end

(0..20).each do |first_score|
  (21..30).each do |second_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        dp[[first_score, second_score, first_pos, second_pos, 0]] = [0, 1]
        dp[[first_score, second_score, first_pos, second_pos, 1]] = [0, 1]
      end
    end
  end
end

(20).downto(0).each do |score|
  (0..score).each do |second_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        out = [0, 0]
        (1..3).each do |dice1|
          (1..3).each do |dice2|
            (1..3).each do |dice3|
              next_pos = (first_pos + dice1) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice2) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice3) % 10
              next_pos = 10 if next_pos == 0
              first_score = score + next_pos
              rec = dp[[first_score, second_score, next_pos, second_pos, 1]]
              #puts score, second_score, first_score, second_score, next_pos, second_pos, "NEXT"
              out[0] += rec[0]
              out[1] += rec[1]
            end
          end
        end
        dp[[score, second_score, first_pos, second_pos, 0]] = out
        if score == 19
          puts score, second_score, first_pos, second_pos, out, "NEXT"
        end
      end
    end
  end

  (0..score).each do |first_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        out = [0, 0]
        (1..3).each do |dice1|
          (1..3).each do |dice2|
            (1..3).each do |dice3|
              next_pos = (second_pos + dice1) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice2) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice3) % 10
              next_pos = 10 if next_pos == 0
              second_score = score + next_pos
              rec = dp[[first_score, second_score, first_pos, next_pos, 0]]
              out[0] += rec[0]
              out[1] += rec[1]
            end
          end
        end
        dp[[first_score, score, first_pos, second_pos, 1]] = out
      end
    end
  end

  (score).downto(0).each do |second_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        out = [0, 0]
        (1..3).each do |dice1|
          (1..3).each do |dice2|
            (1..3).each do |dice3|
              next_pos = (second_pos + dice1) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice2) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice3) % 10
              next_pos = 10 if next_pos == 0
              new_score = second_score + next_pos
              rec = dp[[score, new_score, first_pos, next_pos, 0]]
              #puts score, second_score, first_score, second_score, next_pos, second_pos, "NEXT"
              out[0] += rec[0]
              out[1] += rec[1]
            end
          end
        end
        dp[[score, second_score, first_pos, second_pos, 1]] = out
      end
    end
  end

  (score).downto(0).each do |first_score|
    (1..10).each do |first_pos|
      (1..10).each do |second_pos|
        out = [0, 0]
        (1..3).each do |dice1|
          (1..3).each do |dice2|
            (1..3).each do |dice3|
              next_pos = (first_pos + dice1) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice2) % 10
              next_pos = 10 if next_pos == 0
              next_pos = (next_pos + dice3) % 10
              next_pos = 10 if next_pos == 0
              new_score = first_score + next_pos
              rec = dp[[new_score, score, next_pos, second_pos, 1]]
              #puts score, second_score, first_score, second_score, next_pos, second_pos, "NEXT"
              out[0] += rec[0]
              out[1] += rec[1]
            end
          end
        end

        dp[[first_score, score, first_pos, second_pos, 0]] = out
      end
    end
  end
end

puts dp[[0, 0, first_start, second_start, 0]]
