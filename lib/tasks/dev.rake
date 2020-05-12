namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      require 'tty-spinner'
      spinner = TTY::Spinner.new("[:spinner] Carregando ...", format: :classic)
      spinner.auto_spin # Automatic animation with default interval
       %x(rails db:drop db:create db:migrate)
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
      spinner = TTY::Spinner.new("[:spinner] Carregado com sucesso!! ...", format: :classic)
      spinner.success
    else
      puts "Voce não está em ambiente"
    end

  end

  desc "Adiciona Moedas"
  task add_coins: :environment do
  moedas = [
      {
          descricao: "Bitcoin",
          sigla: "BTC",
          imagem: "https://www.kindpng.com/picc/m/257-2575803_bitcoin-blockchain-icon-golden-internet-coin-bitcoin-icon.png",
          tipomineracao_id: Tipomineracao.find_by(sigla: 'PoW').id
      },

      {
          descricao: "Etherium",
          sigla: "ETH",
          imagem: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
          tipomineracao_id: Tipomineracao.all.sample.id
      },

      {
          descricao: "Litecoin",
          sigla: "LC",
          imagem: "https://pbs.twimg.com/profile_images/498948297805946880/h58GUeGf_400x400.png",
          tipomineracao_id: Tipomineracao.all.sample.id
      },

      {
          descricao: "Dash",
          sigla: "DASH",
          imagem: "https://cryptowiki.net/images/5/55/Dash.png",
          tipomineracao_id: Tipomineracao.all.sample.id
      },
      {
          descricao: "Iota",
          sigla: "IOT",
          imagem: "https://guiadobitcoin.com.br/wp-content/uploads/2017/12/iota-png.png",
          tipomineracao_id: Tipomineracao.all.sample.id
      },
      {
          descricao: "ZCash",
          sigla: "ZEC",
          imagem: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png",
          tipomineracao_id: Tipomineracao.all.sample.id
      }
  ]


  moedas.each do |moeda|
    Moeda.find_or_create_by!(moeda)
  end

  end


  desc "Adiciona Tipos de Mineração"
  task add_mining_types: :environment do

    tipos_mineracao = [
        {descricao: "Proof of Work" , sigla: "PoW"},
        {descricao: "Proof of Stake" , sigla: "PoS"},
        {descricao: "Proof of Capacity" , sigla: "PoC"}
    ]

    tipos_mineracao.each do |tipo|
      Tipomineracao.find_or_create_by!(tipo)
    end

  end

end
