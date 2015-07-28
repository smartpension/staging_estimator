module StagingEstimator
  class Estimator < Struct.new(:employee_count, :tax_office_employer_reference)

    StagingDate = Struct.new(:range, :date)

    DEFAULT_DATE = Date.new(2017, 4, 1)

    STAGING_DATES = [
      StagingDate.new((120000..Float::INFINITY), Date.new(2012, 10, 1)),
      StagingDate.new((50000..119999), Date.new(2012, 11, 1)),
      StagingDate.new((30000..49999), Date.new(2013, 1, 1)),
      StagingDate.new((20000..29999), Date.new(2013, 2, 1)),
      StagingDate.new((10000..19999), Date.new(2013, 3, 1)),
      StagingDate.new((6000..9999), Date.new(2013, 4, 1)),
      StagingDate.new((4100..5999), Date.new(2013, 5, 1)),
      StagingDate.new((4000..4099), Date.new(2013, 6, 1)),
      StagingDate.new((3000..3999), Date.new(2013, 7, 1)),
      StagingDate.new((2000..2999), Date.new(2013, 8, 1)),
      StagingDate.new((1250..1999), Date.new(2013, 9, 1)),
      StagingDate.new((800..1249), Date.new(2013, 10, 1)),
      StagingDate.new((500..799), Date.new(2013, 11, 1)),
      StagingDate.new((350..499), Date.new(2014, 1, 1)),
      StagingDate.new((250..349), Date.new(2014, 2, 1)),
      StagingDate.new((160..249), Date.new(2014, 4, 1)),
      StagingDate.new((90..159), Date.new(2014, 5, 1)),
      StagingDate.new((62..89), Date.new(2014, 7, 1)),
      StagingDate.new((61..61), Date.new(2014, 8, 1)),
      StagingDate.new((60..60), Date.new(2014, 10, 1)),
      StagingDate.new((59..59), Date.new(2014, 11, 1)),
      StagingDate.new((58..58), Date.new(2015, 1, 1)),
      StagingDate.new((54..57), Date.new(2015, 3, 1)),
      StagingDate.new((50..53), Date.new(2015, 4, 1)),
      StagingDate.new((40..49), Date.new(2015, 8, 1)),
      StagingDate.new((30..39), Date.new(2015, 10, 1))
    ]

    def get
      if employee_count.to_i >= 30
        more_that_30_employee_date
      else
        less_that_30_employee_date
      end
    end

    private

    def more_that_30_employee_date
      STAGING_DATES.each do |staging_date|
        return staging_date.date if staging_date.range.cover?(employee_count)
      end
    end

    def less_that_30_employee_date
      if tax_office_employer_reference.blank? || tax_office_employer_reference.length < 2
        return
      end

      return staging_date_exception.date if staging_date_exception.present?
      return grouped_staging_date.date if grouped_staging_date.present?

      DEFAULT_DATE
    end

    def grouped_staging_date
      @grouped_staging_date ||= GroupedStagingDate.new(reference).find
    end

    def staging_date_exception
      @staging_date_exception ||= StagingDateException.new(reference).find
    end

    def reference
      @reference ||= tax_office_employer_reference[-2..-1].upcase
    end
  end
end
