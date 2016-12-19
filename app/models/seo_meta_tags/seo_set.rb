module SeoMetaTags
  class SeoSet < ActiveRecord::Base

    self.table_name = SeoMetaTags.config[:models][:table_name]

    attr_accessible :url, :title, :namespace, :description, :keywords, :images_alt

    serialize :images_alt, Hash

    validates_uniqueness_of :url, :title, :description, :keywords
    validates_length_of :title, maximum: SeoMetaTags.config[:models][:length_of_title]
    validates_length_of :description, maximum: SeoMetaTags.config[:models][:length_of_description]
    validates_length_of :keywords, maximum: SeoMetaTags.config[:models][:length_of_keywords]

    def images_alt=(images_alt_attr)
      images_alt_attr = images_alt_attr.blank? ? {} : JSON.parse(images_alt_attr)
      write_attribute(:images_alt, images_alt_attr)
    end

    def self.filter_by(params)
      @records = all
      (params || {}).select { |k, v| !v.blank? }.slice(:id, :namespace, :url, :title, :description, :keywords).each do |field, value|
        @records = @records.where("#{field} LIKE :#{field}", { field.to_sym => "%#{value}%" })
      end

      @records
    end

  end
end
