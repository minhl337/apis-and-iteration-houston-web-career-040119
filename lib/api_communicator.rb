require 'rest-client'
require 'json'
require 'pry'

response_string = RestClient.get('http://www.swapi.co/api/people/')
response_hash = JSON.parse(response_string)

# lol=[]
# swap={}

# response_hash.each do |x,y|
#   if x == "results"
#     y.each do |a,b|
#       lol.push(a["name"])
#       swap[a["name"]]=a["films"]
#     end
#   end
# end

# binding.pry




def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  
  swap={}
  
  response_hash.each do |x,y|
    if x == "results"
      y.each do |a,b|
        if a["name"]=character_name
          swap[a["name"]]=a["films"]
        end
      end
    end
  end

  swap
end



def print_movies(films)
  # some iteration magic and puts out the movies in a nice list

  films.each do |x,y|
    counter=1
    y.each do |a|
      url=a
      aa=RestClient.get(url)
      bb=JSON.parse(aa)
      movie_name=bb["title"]
      puts "#{counter} #{movie_name}"
      counter +=1
    end
  end
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
