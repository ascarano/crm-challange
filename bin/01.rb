require 'pp'
require '../data/crm'


def company_employees(input)
  result = []
  input[:companies].each do |company|
    companies = {:name => company[:name], :employees => []}
    input[:people].each do |person|
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
end
# result = []
# CRM[:companies].each do |company|
#   companies = {:name => company[:name], :employees => []}
#   CRM[:people].each do |person|
#     person[:employments].each do |employment|
#       if employment[:company_id] == company[:id]
#         companies[:employees] << {
#           :id => person[:id],
#           :first_name => person[:first_name],
#           :last_name => person[:last_name],
#           :title => employment[:title]
#         }
#       end
#     end
#   end
#   result << companies
# end
# pp result


require 'rspec/autorun'
RSpec.describe '#company_employees' do
  it 'returns a list of companies with their employees' do
    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Savannah",
          :last_name => "Clementina",
          :employments =>
          [
            {
              :company_id => 0,
              :title => "Chief Communications Consultant"
            }
          ]
        }
      ],
      :companies => [
        {
          :id => 0,
          :name => "Nicolas and Sons"
        }
      ]
    }

    expected = [
      {
        name: "Nicolas and Sons",
        employees: [
          {
            :id => 20,
            :first_name => "Savannah",
            :last_name => "Clementina",
            :title => "Chief Communications Consultant"
          },
        ]
      }
    ]

    expect(company_employees(input)).to eq(expected)

  end

end
