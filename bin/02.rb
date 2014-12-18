require 'pp'
require '../data/crm'

result = []
CRM[:people].each do |person|
  employments = {
    :person_id => person[:id],
    :person_first_name => person[:first_name],
    :person_last_name => person[:last_name],
  }
  person[:employments].each do |employment|
    employments = {
      :person_id => person[:id],
      :person_first_name => person[:first_name],
      :person_last_name => person[:last_name],
      :title => employment[:title]
    }
    CRM[:companies].each do |company|
      if employment[:company_id] == company[:id]
        employments = {
          :company_id => company[:id],
          :company_name => company[:name],
          :person_id => person[:id],
          :person_first_name => person[:first_name],
          :person_last_name => person[:last_name],
          :title => employment[:title]
        }
      end
    end
  end
  result << employments
end
pp result

# :company_id => 4,
# :company_name => "Nicolas and Sons",
# :person_id => 20,
# :person_first_name => "Savannah",
# :person_last_name => "Clementina",
# :title => "Chief Communications Consultant"
