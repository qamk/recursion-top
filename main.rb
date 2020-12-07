# frozen-string-literal: true

require_relative 'fibonacci.rb'
require_relative 'merge_sort.rb'

# Class to interact with the programs
class Main
  include MergeSort

  def initialize
    welcome
    start
    outro
  end

  def welcome
    puts %(
    Welcome! Here I aim to illustrate a couple of \e[96mrecursion\e[0m programs.
    If you want to change how quickly the program displays output look in:
    \e[35mFibonacci\e[0m on line 26
    \e[33mMerge Sort\e[0m on line 16
    Change the 'sleep .5' (etc.).
    Note that the values are in seconds so 'sleep 1' pauses for 1 second. Seconds will likely be longer than you think while selecting.
    If you put the value too high, press \e[4mCtrl C\e[0m to \e[1minterrupt\e[0m the program and exit.
    )
  end

  def outro
    puts 'Thank you for using this program. Hope it was enjoyable. Please let me know if you have any recommendations!'
  end

  def select_program
    prog = ''
    loop do
      puts "Which program would you like to run?\n1) \e[35;1mFibonacci\e[0m\n2) \e[33;1mMerge Sort\e[0m"
      prog = gets.chomp
      break if %w[1 2].include? prog
    end
    prog
  end

  def start
    select_program == '1' ? Fibonacci.new : choose
    loop do
      puts 'To run the main program from the beginning enter y, anything else will end the program'
      continue = gets.chomp
      break unless continue == 'y'

      system('clear')
      select_program == '1' ? Fibonacci.new : choose
    end
  end
end

Main.new
