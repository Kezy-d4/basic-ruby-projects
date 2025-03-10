# integers = [4,3,78,2,0,2]
# => [0,2,2,3,4,78]

def bubble_sort(integers)
  passes_made = 0 # debugging
  
  integers.length.times do 
    swap_made = false

    integers.each_with_index do |integer, index|
      next_integer = integers[index.next]

      if next_integer
        if integer > next_integer
          integers[index], integers[index.next] = 
          integers[index.next], integers[index]
          swap_made = true
        end
      end

    end
    
    passes_made += 1 # debugging
    break unless swap_made
  end
  
  p "total passes: #{passes_made}"# debugging
  integers
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([0,1,2,3,3,4,5])
p bubble_sort([3,2,1,0])
