require 'date'
require 'active_support/core_ext/object'

require "staging_estimator/version"
require "staging_estimator/estimator"
require "staging_estimator/staging_date_exception"
require "staging_estimator/grouped_staging_date"

module StagingEstimator

  def self.get(employee_count, tax_office_employer_reference = nil)
    Estimator.new(employee_count, tax_office_employer_reference).get
  end

end
