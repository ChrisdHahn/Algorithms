def collatz(n)
  sequence = 1
  until n == 1
    n = (n.even?) ? (n/2) : (n*3+1)
    sequence += 1
  end
  sequence
end

def longest_sequence(number)
  cache = { 1 => 1 }
  start_num = 1
  longest = 1
  while start_num < number
    n = start_num
    sequence = 0
    while n != 1 && n >= start_num
      if n.even?
        n = n/2
      else
        n = 3*n+1
      end
      sequence += 1
    end
    sequence += cache[n]
    if sequence > longest
      longest = sequence
      longest_start = start_num
    end
    cache[start_num] = sequence
    start_num += 1
  end
  return longest_start
end

puts longest_sequence(1000000)