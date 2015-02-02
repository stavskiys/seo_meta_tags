module SeoMetaTags
  class SeoSet < ActiveRecord::Base

    attr_accessible :url, :title, :description, :keywords, :images_alt

    serialize :images_alt, Hash

    validates_uniqueness_of :url, :title, :description, :keywords
    validates_length_of :title, maximum: 80
    validates_length_of :description, maximum: 200
    validates_length_of :keywords, maximum: 200

    def images_alt=(images_alt_attr)
      images_alt_attr = images_alt_attr.blank? ? {} : JSON.parse(images_alt_attr)
      write_attribute(:images_alt, images_alt_attr)
    end

    def self.filter_by(params)
      @records = all
      (params || {}).select { |k, v| !v.blank? }.slice(:id, :url, :title, :description, :keywords).each do |field, value|
        @records = @records.where("#{field} LIKE :#{field}", { field.to_sym => "%#{value}%" })
      end

      @records
    end

  end
end
