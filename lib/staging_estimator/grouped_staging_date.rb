module StagingEstimator
  class GroupedStagingDate < Struct.new(:reference)
    Data = Struct.new(:ranges, :date)

    GROUPED = [
      Data.new([('A1'..'B9'), ('AA'..'BW'), ('M1'..'M9'), ('MA'..'MZ'), ('Z1'..'Z9'), ('ZA'..'ZZ'), ('0A'..'2Z')], Date.new(2015, 6, 1)),
      Data.new([('02'..'04'), ('C1'..'D9'), ('CA'..'DZ')], Date.new(2016, 1, 1)),
      Data.new([('05'..'07'), ('E1'..'E9'), ('EA'..'EZ')], Date.new(2016, 2, 1)),
      Data.new([('08'..'11'), ('F1'..'G9'), ('FA'..'GZ')], Date.new(2016, 3, 1)),
      Data.new([('12'..'16'), ('3A'..'3Z'), ('H1'..'H9'), ('HA'..'HZ')], Date.new(2016, 4, 1)),
      Data.new([('I1'..'I9'), ('IA'..'IZ')], Date.new(2016, 5, 1)),
      Data.new([('17'..'22'), ('4A'..'4Z'), ('J1'..'J9'), ('JA'..'JZ')], Date.new(2016, 6, 1)),
      Data.new([('23'..'29'), ('5A'..'5Z'), ('K1'..'K9'), ('KA'..'KZ')], Date.new(2016, 7, 1)),
      Data.new([('30'..'37'), ('6A'..'6Z'), ('L1'..'L9'), ('LA'..'LZ')], Date.new(2016, 8, 1)),
      Data.new([('N1'..'N9'), ('NA'..'NZ')], Date.new(2016, 9, 1)),
      Data.new([('38'..'46'), ('7A'..'7Z'), ('O1'..'O9'), ('OA'..'OZ')], Date.new(2016, 10, 1)),
      Data.new([('47'..'57'), ('8A'..'8Z'), ('Q1'..'T9'), ('QA'..'TZ')], Date.new(2016, 11, 1)),
      Data.new([('58'..'69'), ('9A'..'9Z'), ('U1'..'W9'), ('UA'..'WZ')], Date.new(2017, 1, 1)),
      Data.new([('70'..'83'), ('X1'..'Y9'), ('XA'..'YZ')], Date.new(2017, 2, 1)),
      Data.new([('P1'..'P9'), ('PA'..'PZ')], Date.new(2017, 3, 1)),
      Data.new([('84'..'91'), ('93'..'99')], Date.new(2017, 4, 1))
    ]

    def find
      GROUPED.find do |grouped|
        values = grouped.ranges.map(&:to_a).flatten
        values.include? reference
      end
    end

  end
end
