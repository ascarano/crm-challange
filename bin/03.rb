require 'pp'
require_relative '../data/crm'

def unemployed(input)
  result = []

  input[:people].each do |person|
    if person[:employments] == []
      just_people = {
        :id => person[:id],
        :person_first_name => person[:first_name],
        :person_last_name => person[:last_name],
      }
      result << just_people
    end
  end

  pp result
end


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

    expect(unemployed(input)).to eq(expected)

  end

end
