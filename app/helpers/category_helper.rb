# frozen_string_literal: true

module CategoryHelper

  def link_sort(icon, _params)

    if request.fullpath.split('?sort=')[1] == "#{_params}+ASC"
      link_to raw("<i class=\"#{icon}-down\"></i>"), sort: "#{_params} DESC"
    else
      link_to raw("<i class=\"#{icon}-down-alt\"></i>"), sort: "#{_params} ASC"
    end
  end

end
