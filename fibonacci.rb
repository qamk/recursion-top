# frozen-string-literal: true

# Fibonnaci sequence using recursion
@fib_cache = [0, 1] # memoisation -- use @ (or $) in front of {hash} or [array] otherwise you get a NameError.
def fib(nth)
  return @fib_cache[nth] if @fib_cache[nth]

  @fib_cache[nth] = fib(nth - 1) + fib(nth - 2)
end

nth = 0
loop do
  puts "Hi! Welcome to this \e[35mfibonnaci sequence\e[0m program. Please type the nth term (between 1 and 55)"
  nth = gets.chomp.to_i
  break if nth.is_a?(Integer) && nth.between?(1, 55)
end
fib(nth)
(1..nth).each { |term| print "\e[38;5;#{140 + term}m#{@fib_cache[term]}\e[0m " }
puts
