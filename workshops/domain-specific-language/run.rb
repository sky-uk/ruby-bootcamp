company do

  department 'Development' do

    employee do
      first_name 'Josh'
      last_name 'Nesbitt'
      role 'Software Engineer'
    end

    employee do
      first_name 'Leon'
      last_name 'Davis'
      role 'Software Engineer'
    end

  end

  department 'Management' do

    employee do
      first_name 'Tracy'
      last_name 'Myers'
      role 'Scrum Master'
    end

  end

end

company.departments.each do |department|

  puts department.name

  department.employees.each do |person|

    puts "  #{person.first_name} #{person.last_name}: #{person.role}"

  end

end
