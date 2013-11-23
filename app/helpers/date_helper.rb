module DateHelper

  def to_br_date(date)
    date.strftime("%d/%m/%Y %H:%M:%S")
  end

end
