class CrmData

  def initialize(crm)
    @crm = crm
  end

  def company_employees
    result = []
    @crm[:companies].each do |company|
      companies = {:name => company[:name], :employees => []}
      @crm[:people].each do |person|
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
    result
  end

  def all_employments
    result = []
    employments = {}
    @crm[:people].each do |person|
      person[:employments].each do |employment|
        @crm[:companies].each do |company|
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
    result
  end

  def unemployed
    result = []
    @crm[:people].each do |person|
      if person[:employments] == []
        bums = {
          :id => person[:id],
          :person_first_name => person[:first_name],
          :person_last_name => person[:last_name],
        }
        result << bums
      end
    end
    pp result
  end

end
