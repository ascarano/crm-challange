require 'pp'
require_relative '../data/crm'
require_relative '../lib/crm_data'

crm = CrmData.new(CRM)
pp crm.company_employees




require 'rspec/autorun'
RSpec.describe '#unemployed' do

  it 'returns a list of all employments' do

    input = {
      :people => [
        {
          :id => 20,
          :first_name => "Savannah",
          :last_name => "Clementina",
          :employments =>[]
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
        :id => 20,
        :person_first_name => "Savannah",
        :person_last_name => "Clementina",
      },
    ]

    crm = CrmData.new(input)
    expect(crm.unemployed).to eq(expected)

  end

end
