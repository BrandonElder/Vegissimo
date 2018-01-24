require 'will_paginate/collection'

Array.class_eval do
  def paginate(page = 1, per_page = 3)
    page = 1 if page.blank? # http://www.rubydoc.info/github/mislav/will_paginate/WillPaginate/Collection
    WillPaginate::Collection.create(page, per_page, size) do |pager|
      pager.replace self[pager.offset, pager.per_page].to_a
    end
  end
end