class AddTipomineracaotoMoeda < ActiveRecord::Migration[5.2]
  def change
    add_reference :moedas, :tipomineracao , foreign_key: true
  end
end
