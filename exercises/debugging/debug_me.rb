require 'ostruct'

def create_person(firstname, surname, claim_to_fame)
  OpenStruct.new(
    firstname: firstname,
    surname: surname,
    claim_to_fame: claim_to_fame
  )
end

john = create_person('John', 'Mair', 'Creator of Pry')
david = create_person('David', 'Rodriguez', 'Creator of pry-byebug')
matz = create_person('Yukihiro', 'Matsumoto', 'Creator of Ruby')

people = [ john, david, matz ].shuffle

people.each do |person|
  puts "#{person.firstname} #{person.surname} was the: #{person.claim_to_fame}"
end
