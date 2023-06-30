class CreateGalerries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.integer :product_id
      t.string :img
    end

    insert <<~SQL.squish
      INSERT INTO galleries
      (id, product_id, img)
      VALUES
      (1, 1, 'product-details/01.jpg'),
      (2, 1, 'product-details/02.jpg'),
      (3, 1, 'product-details/03.jpg'),
      (4, 2, 'product-details/04.jpg'),
      (5, 2, 'product-details/05.jpg'),
      (6, 2, 'product-details/01.jpg'),
      (7, 3, 'product-details/01.jpg'),
      (8, 3, 'product-details/02.jpg'),
      (9, 3, 'product-details/03.jpg'),
      (10, 4, 'product-details/04.jpg'),
      (11, 4, 'product-details/05.jpg'),
      (12, 4, 'product-details/01.jpg'),
      (13, 5, 'product-details/01.jpg'),
      (14, 5, 'product-details/02.jpg'),
      (15, 5, 'product-details/03.jpg'),
      (16, 6, 'product-details/04.jpg'),
      (17, 6, 'product-details/05.jpg'),
      (18, 6, 'product-details/01.jpg'),
      (19, 7, 'product-details/01.jpg'),
      (20, 7, 'product-details/02.jpg'),
      (21, 7, 'product-details/03.jpg'),
      (22, 8, 'product-details/04.jpg'),
      (23, 8, 'product-details/05.jpg'),
      (24, 8, 'product-details/06.jpg')

    SQL
  end
end
