# some sample users/personas to test personas/otp
User.create!(name: "Velma Dinkley", email: "velma@example.com")
User.create!(name: "Fred Jones", email: "freddy@example.com")
User.create!(name: "Daphne Blake", email: "daphne@example.com")
User.create!(name: "Norville Rogers", email: "shaggy@example.com")

Teacher.create!(name: 'Emma Thompson', trn: '1023456')
Teacher.create!(name: 'Kate Winslet', trn: '1023457')
Teacher.create!(name: 'Alan Rickman', trn: '2084589')
Teacher.create!(name: 'Hugh Grant', trn: '3657894')
Teacher.create!(name: 'Harriet Walter', trn: '2017654')
Teacher.create!(name: 'Hugh Laurie', trn: '4786654')

School.create!(urn: 6_789_654, name: "St James'")
School.create!(urn: 6_980_612, name: "St Margaret's")
School.create!(urn: 6_456_897, name: "Anston Brook")
School.create!(urn: 7_765_810, name: "Dinnington School")
School.create!(urn: 4_001_321, name: "Wales School")
School.create!(urn: 5_201_111, name: "North Chadderton School")

AppropriateBody.create!(name: 'Exchange Teaching School Hub', local_authority_code: 109, establishment_number: 2367)
AppropriateBody.create!(name: 'South Yorkshire Teaching School Hub', local_authority_code: 678, establishment_number: 9728)
AppropriateBody.create!(name: 'Shropshire and Telford Education Partnership', local_authority_code: 238, establishment_number: 6582)
AppropriateBody.create!(name: 'Bright Futures Teaching School Hub', local_authority_code: 957, establishment_number: 7361)
AppropriateBody.create!(name: 'One Cumbria Teaching School Hub', local_authority_code: 648, establishment_number: 3986)
AppropriateBody.create!(name: 'Teach West London', local_authority_code: 832, establishment_number: 6864)

LeadProvider.create!(name: 'Ambition Institute')
LeadProvider.create!(name: 'Best Practice Network')
LeadProvider.create!(name: 'National Institute of Teaching')
LeadProvider.create!(name: 'Education Development Trust')
LeadProvider.create!(name: 'Teach First')
LeadProvider.create!(

DeliveryPartner.create!(name: 'Coventry and Warwickshire Teaching School Hub')
DeliveryPartner.create!(name: 'Central London Teaching School Hub')
DeliveryPartner.create!(name: 'Tudor Grange Academy')
DeliveryPartner.create!(name: 'Thames Gateway Teaching School Hub')
DeliveryPartner.create!(name: 'Five Counties Teaching School Hub Alliance')
DeliveryPartner.create!(name: 'University of Winchester')
