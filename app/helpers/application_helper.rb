module ApplicationHelper


  def date_br(date_us)
    return date_us.strftime("%d/%m/%Y")
  end

  def name_application
    "Crypto Wallet APP"
  end


  def rails_env
    if Rails.env == 'development'
      "Desenvolvimento"
    elsif Rails.env == 'production'
      "Produção"
    else
      "Testes"
    end
    end

  end
