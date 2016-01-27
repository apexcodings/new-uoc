class AddAttributesToPage < ActiveRecord::Migration
  def change
    add_column :pages, :seo_title, :string
    add_column :pages, :seo_keywords, :string
    add_column :pages, :seo_description, :text
  end
end
