require 'pp'
require '../data/crm'

result = []

CRM[:people].each do |person|
  just_people = {
    :id => person[:id],
    :person_first_name => person[:first_name],
    :person_last_name => person[:last_name],
  }
  result << just_people
end

pp result
