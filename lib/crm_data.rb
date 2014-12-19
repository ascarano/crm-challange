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

end
