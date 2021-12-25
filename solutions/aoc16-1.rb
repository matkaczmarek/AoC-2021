file = File.open('inputs/aoc15.in')
lines = file.readlines.map(&:chomp)
hex_code = lines[0]

hash = { '0' => '0000', '1' => '0001',
         '2' => '0010', '3' => '0011',
         '4' => '0100', '5' => '0101',
         '6' => '0110', '7' => '0111',
         '8' => '1000', '9' => '1001',
         'A' => '1010', 'B' => '1011',
         'C' => '1100', 'D' => '1101',
         'E' => '1110', 'F' => '1111'}


bits = ''
hex_code.each do |letter|
  bits += hash[letter]
end

def parse_sub_codes_0(bits)
  ctr = 0
  while(ctr < bits.length)
    version = bits[0...3].to_i(base = 2)
    type_id = bits[3..6].to_i(base = 2)

  end
end

def parse_code(bits)
  version = bits[0...3].to_i(base = 2)
  type_id = bits[3..6].to_i(base = 2)
  return version if type_id == 4

  length_type = bits[6]
  if length_type == '0'
    ctr = 7
    len = bits[7...22].to_i(base = 2)

  end
end