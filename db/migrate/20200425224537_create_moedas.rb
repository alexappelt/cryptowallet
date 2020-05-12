class CreateMoedas < ActiveRecord::Migration[5.2]
  def change
    create_table :moedas do |t|
      t.string :descricao
      t.string :sigla
      t.string :imagem

      t.timestamps
    end
  end
end
