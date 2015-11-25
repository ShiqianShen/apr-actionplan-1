# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'Vamshi', last_name: 'NS', username: 'vamshins', email: 'vamshins@unm.edu', role: 'Admin')
User.create(first_name: 'Alan', last_name: 'Seciwa', username: 'aseciwa', email: 'aseciwa@unm.edu', role: 'User')

Unit.create(unit:'Africana Studies', college:'College of Arts and Sciences')
Unit.create(unit:'American Studies', college:'College of Arts and Sciences')
Unit.create(unit:'Anderson School of Management', college:'Anderson School of Management')
Unit.create(unit:'Anthropology', college:'College of Arts and Sciences')
Unit.create(unit:'Architecture', college:'School of Architecture and Planning')

Criterion.create(criterion_number: 1, description: 'Program Goals', field1: 'Date of most recent version of Unit’s Mission/Vision Statement:', field2: 'Date of most recent update to Unit’s Program Goals:')
Criterion.create(criterion_number: 2, description: 'Teaching and Learning:  Curriculum', field1: 'Which undergraduate programs in the unit have reduced the number of credit hours required for the program, given the change to a UNM requirement of a minimum of 120 credit hours?  Please provide the former and current number of credit hours and when the change occurred for each applicable program.')
Criterion.create(criterion_number: 3, description: 'Teaching and Learning:  Continuous Improvement', field1: 'Date(s) of most recent Student Learning Outcomes for each degree/certificate program offered by the unit:', field2: 'Date(s) of the most recent submitted Annual Program Assessment reports for each degree/certificate program offered by the unit:')
Criterion.create(criterion_number: 4, description: 'Students', field1: 'Please provide a brief summary regarding the unit’s efforts to improve/enhance recruitment of all students, advisement of all students, and four-year graduation rates for undergraduate students.')
Criterion.create(criterion_number: 5, description: 'Faculty', field1: 'What are the Unit’s broad goals for supporting and encouraging research, scholarly, and productivity activities for the faculty?', field2: 'Provide a brief summary of major accomplishments or awards for research/scholarly/productivity activities of the Unit’s faculty over the past year (if this information has been provided through another report, please attach a copy or provide a link to the supporting information).')
Criterion.create(criterion_number: 6, description: 'Resources and Planning', field1: 'Provide a brief summary of any significant changes in the Unit’s budget or resources and the resource opportunities and/or challenges experienced by the Unit over the past year.')
Criterion.create(criterion_number: 7, description: 'Facilities', field1: 'Provide a brief summary for any changes to facilities or facility planning over the past year (e.g. changes in space utilization, remodeling, new construction).')
Criterion.create(criterion_number: 8, description: 'Program Comparisons', field1: 'Please provide any relevant information regarding program rankings or program status related to other peer institutions for the year.')
Criterion.create(criterion_number: 9, description: 'Future Directions', field1: ' Date of most recent version of strategic plan for Unit:')