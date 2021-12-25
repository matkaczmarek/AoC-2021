require 'json'
require 'byebug'

file = File.open('inputs/aoc18.in')
lines = file.readlines.map(&:chomp)
lines = lines.map { |line| JSON.parse(line) }

class Tree
  attr_accessor :val, :left, :right, :top
  attr_reader :val, :left, :right, :top
  attr_writer :val, :left, :right, :top

  def initialize(left, right, top, val)
    @val = val
    @left = left
    @right = right
    @top = top
  end

end

root = Tree.new(nil, nil, nil, -1)

def parse_tree(node, arr)
  if arr.kind_of?(Array)
    left = Tree.new(nil, nil, node, -1)
    left = parse_tree(left, arr[0])
    right = Tree.new(nil, nil, node, -1)
    right = parse_tree(right, arr[1])
    node.left = left
    node.right = right
  else
    node.val = arr.to_i
  end

  node
end

def predecessor(node)
  prev = node
  curr = node
  while curr.top != nil
    prev = curr
    curr = curr.top
    if curr.left != prev

      curr = curr.left
      if curr.nil?
        break
      end

      while curr.right != nil
        curr = curr.right
      end

      return curr
    end
  end

  nil
end

def successor(node)
  prev = node
  curr = node
  while curr.top != nil
    prev = curr
    curr = curr.top
    if curr.right != prev
      curr = curr.right

      while curr.left != nil
        curr = curr.left
      end

      return curr
    end
  end

  nil
end

def check_exp(node, depth)
  return false if node == nil
  if depth == 4 && node.left != nil && node.right != nil
    nex_left = predecessor(node)
    nex_right = successor(node)
    nex_left.val += node.left.val if nex_left != nil
    nex_right.val += node.right.val if nex_right != nil


    node.val = 0
    node.left = nil
    node.right = nil
    return true
  end

  left = check_exp(node.left, depth + 1)
  return left if left

  check_exp(node.right, depth + 1)
end

def dfs_print(node)
  return if node.nil?
  if node.left.nil? && node.right.nil?
    puts node.val
  end

  dfs_print(node.left)
  dfs_print(node.right)
end

def check_split(node)
  return false if node.nil?
  if node.left.nil? && node.right.nil?
    if node.val >= 10
      node.left = Tree.new(nil, nil, node, node.val/2)
      node.right = Tree.new(nil, nil, node, (node.val + 1)/2)
      node.val = -1
      return true
    end

    return false
  end

  left = check_split(node.left)
  return left if left

  right = check_split(node.right)
  right
end

def dfs(node)
  return 0 if node.nil?
  if node.left.nil? && node.right.nil?
    return node.val
  end

  sum = 0
  sum += 3 * dfs(node.left)
  sum += 2 * dfs(node.right)
  return sum
end

maxi = 0
lines.each do |line1|
  lines.each do |line2|
    next if line1 == line2

    root1 = Tree.new(nil, nil, nil, -1)
    root1 = parse_tree(root1, line1)

    root2 = Tree.new(nil, nil, nil, -1)
    root2 = parse_tree(root2, line2)

    new_root = Tree.new(root1, root2, nil, -1)
    root1.top = new_root
    root2.top = new_root

    while(true)
      next if check_exp(new_root, 0)
      next if check_split(new_root)

      break
    end

    maxi = [maxi, dfs(new_root)].max
  end
end

puts maxi
