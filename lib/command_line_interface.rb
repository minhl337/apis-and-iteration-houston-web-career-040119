def welcome
  # puts out a welcome message here!
  puts "Hello, young Padiwan."
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  user_character=gets.chomp
  puts "You picked #{user_character}."
  user_character
end
