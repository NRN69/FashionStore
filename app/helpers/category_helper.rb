# frozen_string_literal: true

module CategoryHelper
  def link_sort(icon, object)
    if request.fullpath.split('?sort=')[1] == "#{object}+ASC"
      link_to raw("<i class=\"#{icon}-down\"></i>"), sort: "#{object} DESC"
    else
      link_to raw("<i class=\"#{icon}-down-alt\"></i>"), sort: "#{object} ASC"
    end
  end
end
