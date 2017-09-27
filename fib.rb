def iterative_fib(n)
    sequence = []
    (0..n).each do |n|
        if n < 2
            sequence << n
        else
            sequence << sequence[-1] + sequence[-2]
        end
    end
    sequence.last
end

def recursive_fib(n)
  return n if n < 2
  return recursive_fib(n - 1) + recursive_fib(n - 2)
end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end 