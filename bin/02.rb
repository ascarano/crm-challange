require 'pp'
require '../data/crm'

def all_employments(input)
  result = []
  input[:people].each do |person|
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
      input[:companies].each do |company|
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
end



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

    expect(all_employments(input)).to eq(expected)

  end

end
