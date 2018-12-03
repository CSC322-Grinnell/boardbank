# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
user = User.create(firstname: 'User', lastname: 'Man', email: 'user@example.com',
	password: 'password', address: '123 Main Street', city: 'Grinnell',
	state: 'Iowa', zipcode: '50112', phonenumber: '1234567891',
	education: 'Bachelors')
User.create(firstname: 'Aaa', lastname: 'Bbb', email: 'aaabbb@example.com', password: 'password')
User.create(firstname: 'Bob', lastname: 'Smith', email: 'bobsmith@example.com', password: 'password')
User.create(firstname: 'Jane', lastname: 'Doe', email: 'janedoe@example.com', password: 'password')

# (1..30).each do |ind|
# 	User.create!(firstname: 'First ' + ind.to_s, lastname: 'Last ' + ind.to_s, email: ind.to_s + 'first_last@example.com', password: 'password')
# 	puts ind
# end
Organization.create!(name: 'Org', about: 'An organization for organizations', email: 'org@example.com', password: 'password')
Organization.create!(name: 'Happy Makers', about: 'We make people happy', email: 'happy@example.com', password: 'password')
Organization.create!(name: 'Animal Shelter', about: 'Rescuing stray animals', email: 'animals@example.com', password: 'password')
Organization.create!(name: 'Lovely', about: 'Nerb dating app', email: 'l0ve@example.com', password: 'password')

Skill.create([{ name: 'Advocacy' }, { name: 'Governmental Relations' }, { name: 'Business or Management' }, 
			  { name: 'Communications' }, { name: 'Diversity Issues' }, { name: 'Finance and Accounting' }, 
			  { name: 'Fundraising' }, { name: 'Human Resources' }, { name: 'Information Technology' }, 
			  { name: 'Law' }, { name: 'Organization Development' }, 
			  { name: 'Outcome Measurement or Statistical Analysis' }, { name: 'Project Management' }, 
			  { name: 'Training and Development' }, { name: 'Volunteer Management' }])
user.user_skills.create(skill_id: '1', experience_level: 'Some')


Interest.create([{ name: 'Arts/Museums' }, { name: 'Early Childhood' }, { name: 'Literacy' }, 
				 { name: 'Animal Rights' }, { name: 'Environment' }, { name: 'Mental Health' }, 
				 { name: 'Children/Youth' }, { name: 'Health Care' }, { name: 'Recreation' },
				 { name: 'Community Development' }, { name: 'History' }, { name: 'Preservation' }, 
				 { name: 'Senior Services' }, { name: 'Disabilities' }, { name: 'Emergency Shelters/Services' },
				 { name: 'Substance Abuse' }, { name: 'Education' }, { name: 'Housing Development' }])