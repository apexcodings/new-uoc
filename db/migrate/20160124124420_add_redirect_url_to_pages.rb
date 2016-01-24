class AddRedirectUrlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :redirect_url, :string
  end
end
