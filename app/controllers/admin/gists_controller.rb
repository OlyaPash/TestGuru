class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    reditect_to admin_gists_path
  end

end
