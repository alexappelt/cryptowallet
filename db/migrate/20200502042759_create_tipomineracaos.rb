class CreateTipomineracaos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipomineracaos do |t|
      t.string :descricao
      t.string :sigla

      t.timestamps
    end
  end
end
