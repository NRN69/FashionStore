# frozen_string_literal: true

module ProductHelper

  def sizes_uniq(product)
    sizes = []
    product.sizes.each do |size|
      sizes << size.size
    end
    sizes.uniq.sort
  end

end
