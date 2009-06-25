class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :imagem_file_name
      t.string :image_content_type
      t.integer :imagem_file_size
      t.datetime :imagem_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
