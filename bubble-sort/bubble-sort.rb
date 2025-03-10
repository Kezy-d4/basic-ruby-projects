# integers = [4,3,78,2,0,2] => [0,2,2,3,4,78]

def bubble_sort(integers)

  puts "original: #{integers}" # DEBUGGING
  worst_case = integers.length
  pass_throughs = 0
  
  worst_case.times do
    swap_counter = 0
    indexes_to_check = integers.take(integers.length - pass_throughs).length - 2

    integers.each_with_index do |integer, index|
      next_integer = integers[index.next]

      if next_integer && index <= indexes_to_check && integer > next_integer
        integers[index], integers[index.next] = 
        integers[index.next], integers[index]
        swap_counter += 1
      end
    end

    pass_throughs += 1
    puts "#{swap_counter} swaps performed on pass #{pass_throughs}: #{integers}" # DEBUGGING

    break if swap_counter == 0
  end

  integers 
end

# TESTS
p bubble_sort([4,3,78,2,0,2]) 
p bubble_sort([3,2,1]) 
p bubble_sort([1,2,3]) 
p bubble_sort([3,1,2])
p bubble_sort([1,2])
p bubble_sort([2,1])
p bubble_sort([1])