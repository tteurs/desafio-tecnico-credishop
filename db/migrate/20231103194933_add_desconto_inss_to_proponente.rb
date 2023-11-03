class AddDescontoInssToProponente < ActiveRecord::Migration[6.1]
  def change
    add_column :proponentes, :desconto_inss, :float
  end
end
