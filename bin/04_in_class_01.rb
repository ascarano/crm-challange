require 'pp'
require_relative '../data/crm'

i = 0
CRM[:companies].each do |c|
  CRM[:people].each do |person|
    i += 1
  end
end

employments_by_company = {}
CRM[:people].each do |person|
  person[:employments].each do |employment|
    employments_by_company[employment[:company_id]] ||= []
    employments_by_company[employment[:company_id]] << {
      
    }
