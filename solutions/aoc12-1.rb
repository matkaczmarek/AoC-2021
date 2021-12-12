file = File.open('inputs/aoc12.in')
lines = file.readlines.map(&:chomp)

$graph = {}
visited = {}
lines.each do |line|
  s = line.split('-')
  if $graph.key?(s[0])
    $graph[s[0]].push(s[1])
  else
    $graph[s[0]] = [s[1]]
    visited[s[0]] = false
  end

  if $graph.key?(s[1])
    $graph[s[1]].push(s[0])
  else
    $graph[s[1]] = [s[0]]
    visited[s[1]] = false
  end
end

def capitalized?(str)
  str.match?(/\A[A-Z]/)
end

def rec_find(node, visited)
  return 1 if node == 'end'
  return 0 if visited[node]

  visited[node] = true unless capitalized?(node)
  total = 0
  $graph[node].each do |n|
    total += rec_find(n, visited)
  end

  visited[node] = false
  total
end

puts rec_find('start', visited)
