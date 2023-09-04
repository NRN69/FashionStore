# frozen_string_literal: true

module ProductHelper
  def product_image(image)
    if image.attached?
      image_tag image, alt: "product-#{image}", class: 'd-block w-100'
    else
      image_tag 'default_image.png', alt: 'product-default_image', class: 'd-block w-100'
    end
  end

  def sizes_sort(product)
    sizes = []
    sorted_sizes = []
    base_sizes = %w[XS S M L XL XLL]

    product.sizes.each do |size|
      sizes << size.size
    end

    base_sizes.each do |base_size|
      sorted_sizes << sizes.uniq.select { |size| size == base_size }.join
    end
    sorted_sizes.delete('')

    sorted_sizes
  end
end
