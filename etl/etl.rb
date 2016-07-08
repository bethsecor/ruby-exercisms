class ETL
  def self.transform(old_data)
    new_data = {}
    old_data.map do |point_value, letters|
      letters.map do |letter|
        new_data[letter.downcase] = point_value
      end
    end
    new_data
  end
end
