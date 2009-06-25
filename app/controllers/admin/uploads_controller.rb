class Admin::UploadsController < ApplicationController
  def create
    @upload = Upload.new(params[:upload])
    flash[:notice] = "Upload com sucesso." if @upload.save
    redirect_to request.referer
  end
end
