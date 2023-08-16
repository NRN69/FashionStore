# frozen_string_literal: true

module ProductHelper

  def sizes_uniq(product)
    sizes = []
    product.sizes.each do |size|
      sizes << size.size
    end
    sizes.uniq.sort
  end

  def link_sort(icon, _params)
    if request.fullpath == "/?sort=#{_params}+ASC"
      link_to raw("<i class=\"#{icon}-down\"></i>"), sort: "#{_params} DESC"
    else
      link_to raw("<i class=\"#{icon}-down-alt\"></i>"), sort: "#{_params} ASC"
    end
  end
end
