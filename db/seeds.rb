# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed the Company_Sizes table
company_sizes = ['< 10', '10 to 50', '51 to 100', '> 101+']

company_sizes.each do |size|
  CompanySize.create!(size: size)
end

# Seed the Specializations table
specializations = ['Database Administrator', 'Full-Stack Engineer', 'Front-End Engineer',
                   'Back-End Engineer', 'DevOps', 'Engineering Manager', 'Product Manager']

specializations.each do |specialization|
  Specialization.create!(name: specialization)
end

# Seed the Job_Types table
job_types = ['Full-Time', 'Part-Time', 'Contract', 'Internship']

job_types.each do |type|
  JobType.create!(name: type)
end
