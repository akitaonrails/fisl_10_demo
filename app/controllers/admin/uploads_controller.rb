class Admin::UploadsController < ApplicationController
  before_filter :require_user
  
  def create
    @upload = Upload.new(params[:upload])
    flash[:notice] = "Upload com sucesso." if @upload.save
    redirect_to request.referer
  end
end
