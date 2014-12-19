require 'pp'
require_relative '../data/crm'
require_relative '../lib/crm_data'

crm = CrmData.new(CRM)
crm.all_employments

require 'rspec/autorun'
RSpec.describe '#all_employments' do

  it 'returns a list of all employments' do

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
        :company_id => 0,
        :company_name => "Nicolas and Sons",
        :person_id => 20,
        :person_first_name => "Savannah",
        :person_last_name => "Clementina",
        :title => "Chief Communications Consultant"
      },
    ]

    crm = CrmData.new(input)
    expect(crm.all_employments).to eq(expected)

  end

end
