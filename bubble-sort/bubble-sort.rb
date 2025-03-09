to_sort = [4,3,78,2,0,2]
# => [0,2,2,3,4,78]

  one_pass = to_sort.each_with_index do |integer, index|
  
    next_integer = to_sort[index.next]
  
    if next_integer
      if integer > next_integer
        to_sort[index], to_sort[index.next] = to_sort[index.next], to_sort[index]
      end
    end
  
  end


