require 'pp'
require '../data/crm'
require_relative '../lib/crm_data'



crm = CrmData.new(CRM)
pp crm.company_employees


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

    crm = CrmData.new(input)
    expect(crm.company_employees).to eq(expected)
  end
end
