require 'pp'
require '../data/crm'

result = []
CRM[:companies].each do |company|
  companies = {:name => company[:name], :employees => []}
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        companies[:employees] << {
          :id => person[:id],
          :first_name => person[:first_name],
          :last_name => person[:last_name],
          :title => employment[:title]
        }
      end
    end
  end
  result << companies
end
pp result
