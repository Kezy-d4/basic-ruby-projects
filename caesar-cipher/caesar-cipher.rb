require 'pry-byebug'

# Loop through the given string and return a new string with each letter 
# shifted the specified number of positions forward (right) in the alphabet.
# Preserve original whitespace, case, and non-letter characters, and
# wrap back to the beginning of the alphabet (from z-a) when necessary. 

# string = "What a string!"
# forward_shift = 5

# helper methods
def is_lower_letter?(string)
  ("a".."z").include?(string)
end

def is_upper_letter?(string)
  ("A".."Z").include?(string)
end

def is_letter?(string)
  is_lower_letter?(string) || is_upper_letter?(string)
end

def find_letter_index(letter)

  if is_lower_letter?(letter)
    ("a".."z").find_index(letter)

  elsif is_upper_letter?(letter)
    ("A".."Z").find_index(letter)
  end
end

def shift_letter(letter, forward_shift)
  ltr_idx = find_letter_index(letter)

  if is_lower_letter?(letter) 
    letter = ("a".."z").to_a[(ltr_idx + forward_shift) % 26]

  elsif is_upper_letter?(letter)
    letter = ("A".."Z").to_a[(ltr_idx + forward_shift) % 26]
  end
end

# main method
def caesar_cipher
  puts "Enter a message to be encrypted."
  string = gets.chomp

  puts "Enter the forward shift factor."
  forward_shift = gets.chomp.to_i

  ciphered = string.split("").map do |character|

    if is_letter?(character)
      shift_letter(character, forward_shift)

    else
      character
    end
  end

  puts "Your message has been encrypted according to your forward shift factor."
  ciphered.join
end 

p caesar_cipher






