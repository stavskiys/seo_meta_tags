require_dependency "seo_meta_tags/application_controller"

module SeoMetaTags
  class SetsController < ApplicationController

    layout SeoMetaTags.config[:layout]

    def index
      @list = SeoMetaTags::SeoSet.filter_by(page_filter).paginate(per_page: 10, page: params[:page])
    end

    def show

    end

    def new
      @seo = SeoMetaTags::SeoSet.new
    end

    def create
      @seo = SeoMetaTags::SeoSet.new(permitted_params)
      if @seo.save
        redirect_to sets_path
      else
        render :new
      end
    end

    def edit
      @seo = SeoMetaTags::SeoSet.find(params[:id])
    end

    def update
      @seo = SeoMetaTags::SeoSet.find(params[:id])
      if @seo.update_attributes(permitted_params)
        redirect_to sets_path
      else
        render :edit
      end
    end

    def destory
      @seo = SeoMetaTags::SeoSet.find(params[:id])
      @seo.destroy
    end

    private

    def permitted_params
      @permitted_params ||= params.require(:seo).permit(:url, :title, :description, :keywords, :images_alt)
    end
  end
end
