Clock.controllers :notices do
  before do
    redirect!
  end

  get :index do
    @notices = Notice.sort(:updated_at)

    render 'notices/index'
  end

  post :create do
    n = Notice.new(params[:notice])

    if n.save
      flash[:notice] = "The notice has been created."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:notices, :index)
    end
  end

  get :edit, :map => "/notices/:id/edit" do
    @notice = Notice.find(params[:id])

    render 'notices/edit'
  end

  patch :update do
    n = Notice.find(params[:id])

    if n.update_attributes(params[:notice])
      flash[:notice] = "The notice has been updated."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:notices, :edit, :id => notice.id)
    end
  end

  delete :destroy do
    n = Notice.find(params[:id])

    if n.destroy
      flash[:notice] = "The notice has been destroyed."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:notices, :index)
    end
  end
end
