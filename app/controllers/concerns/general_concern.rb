module GeneralConcern
  extend ActiveSupport::Concern

  def get_date_formated(date, type = -1)
    if type == 0
      date.strftime('%d') + '/' + name_month(date.strftime('%m'))
    else
      date
    end
  end

  def name_month(month, short_format = false)
    if month == '01'
      short_format ? 'Ene' : 'Enero'
    elsif month == '02'
      short_format ? 'Feb' : 'Febrero'
    elsif month == '03'
      short_format ? 'Mar' : 'Marzo'
    elsif month == '04'
      short_format ? 'Abr' : 'Abril'
    elsif month == '05'
      short_format ? 'May' : 'Mayo'
    elsif month == '06'
      short_format ? 'Jun' : 'Junio'
    elsif month == '07'
      short_format ? 'Jul' : 'Julio'
    elsif month == '08'
      short_format ? 'Ago' : 'Agosto'
    elsif month == '09'
      short_format ? 'Sep' : 'Septiembre'
    elsif month == '10'
      short_format ? 'Oct' : 'Octubre'
    elsif month == '11'
      short_format ? 'Nov' : 'Noviembre'
    elsif month == '12'
      short_format ? 'Dic' : 'Diciembre'
    else
      'N/D'
    end
  end
end