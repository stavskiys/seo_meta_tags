module SeoMetaTags
  class SeoSet < ActiveRecord::Base

    attr_accessible :url, :title, :description, :keywords, :images_alt

    serialize :images_alt, Hash

    def images_alt=(images_alt_attr)
      images_alt_attr = images_alt_attr.blank? ? {} : JSON.parse(images_alt_attr)
      write_attribute(:images_alt, images_alt_attr)
    end

  end
end
