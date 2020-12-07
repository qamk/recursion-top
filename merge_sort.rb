# frozen-string-literal: true

########### Start of merge sort solution ###########

# Merge sort using recursion
def atomise(list)
  return list if list.size < 2

  puts "Splitting... \e[33m#{list}\e[0m"
  half = list.size / 2
  left_side = atomise(list.slice(0...half))
  right_side = atomise(list.slice(half..-1))
  puts "Left: \e[31m#{left_side}\e[0m\nRight: \e[94m#{right_side}\e[0m"
  puts "'''''''''''''''''''''"
  system('sleep .5')
  merge_sort(left_side, right_side)
end

def merge_sort(left, right)
  sorted = []
  while !left.empty? && !right.empty? do # 'until' does not work here
    if left[0] < right[0]
      sorted.push(left[0])
      left.shift
    else
      sorted.push(right[0])
      right.shift
    end
  end
  puts "Sorted... \e[35m#{sorted}\e[0m"
  return sorted.concat(left).concat(right) # if I remember right concat is the faster than + and <<
end

########### End of Merge Sort Solution ###########

def select_len
  length = 1
  loop do
    print 'Please enter your desired array length (between 1 and 60): '
    length = rand(1 + gets.chomp.to_i)
    break if length.between?(1, 60)
  end
  length
end

def select_range
  random_range = 0
  loop do
    print 'Please enter a max value. The values in the array will be randomly chosen up to, but not including, this value (above 30 please): '
    random_range = gets.to_i
    break if random_range > 30
  end
  random_range
end

def choose?
  puts 'Enter y to choose your own list length and range of values each list item can take (e.g. 0 to 40, 0 to 300 etc.'
  response = gets.chomp
  lst = if response == 'y'
          Array.new(select_len) { select_range }
        else
          Array.new(rand(31) + 1) { rand(104) }
        end
  print "Starting list.... #{lst}\n"
  atomise(lst).each { |item| print "\e[32m#{item} \e[0m" }
end

choose?
%(If you want to change the pace this displays at change the value on line 13 (note .5 is in seconds).
If you put the value too high, press \e[1mCtrl C\e[0m to \e[2minterrupt\e[0m the program and exit any time.)
