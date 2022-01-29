class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  
  def add_tax_price
    (self.price * 1.1).round
  end
  
  def get_image(size)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize: size).processed
  end
  
end
