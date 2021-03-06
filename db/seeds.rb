# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Worker.delete_all
Shift.delete_all

julie = Worker.create!(first_name: 'Julie', status: 'medic')
marc = Worker.create!(first_name: 'Marc', status: 'medic')
antoine = Worker.create!(first_name: 'Antoine', status: 'intern')
emilie = Worker.create!(first_name: 'Emilie', status: 'medic')
lea = Worker.create!(first_name: 'Lea', status: 'cover')

Shift.create!(worker_id: julie.id, start_date: '2017-1-1')
Shift.create!(worker_id: marc.id, start_date: '2017-1-2')
Shift.create!(worker_id: antoine.id, start_date: '2017-1-3')
Shift.create!(worker_id: emilie.id, start_date: '2017-1-4')
Shift.create!(worker_id: lea.id, start_date: '2017-1-5')
Shift.create!(worker_id: marc.id, start_date: '2017-1-6')
Shift.create!(worker_id: lea.id, start_date: '2017-1-7')
Shift.create!(worker_id: emilie.id, start_date: '2017-1-8')
Shift.create!(worker_id: lea.id, start_date: '2017-1-9')
Shift.create!(worker_id: marc.id, start_date: '2017-1-10')
