class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    cleaned_number = @phone_number.gsub(/[^0-9]/,'')
    if invalid_number?(cleaned_number)
      '0000000000'
    elsif valid_usa_number?(cleaned_number)
      cleaned_number[1..11]
    else
      cleaned_number
    end
  end

  def area_code
    number[0..2]
  end

  def to_s
    cleaned_number = number
    "(#{cleaned_number[0..2]}) #{cleaned_number[3..5]}-#{cleaned_number[6..9]}"
  end

  def invalid_number?(number)
    number.length < 10 ||
    (number.length == 11 && number[0] != '1') ||
    number.length > 11 ||
    @phone_number =~ /[a-z]/
  end

  def valid_usa_number?(number)
    number.length == 11 && number[0] == '1'
  end
end
