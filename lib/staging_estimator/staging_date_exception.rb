module StagingEstimator
  class StagingDateException < Struct.new(:reference)
    Data = Struct.new(:value, :date)

    EXCEPTIONS = [
      Data.new('BX', Date.new(2015, 7, 1)),
      Data.new('BY', Date.new(2015, 9, 1)),
      Data.new('BZ', Date.new(2015, 11, 1)),
      Data.new('92', Date.new(2015, 6, 1)),
      Data.new('00', Date.new(2016, 2, 1)),
      Data.new('01', Date.new(2016, 3, 1))
    ]

    def find
      EXCEPTIONS.find do |exception|
        exception.value == reference
      end
    end
  end

end
