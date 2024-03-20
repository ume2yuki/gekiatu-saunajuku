class DoemusController < ApplicationController
    before_action :authenticate_user!
    def index
        @doemus = Doemu.all
    end
    
    def new
        @doemu = Doemu.new
    end
    def show
        @doemu = Doemu.find(params[:id])
        @comments = @doemu.comments
        @comment = Comment.new
    end

    def create
        doemu = Doemu.new(doemu_params)
        doemu.user_id = current_user.id
        if doemu.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    def edit
        @doemu = Doemu.find(params[:id])
    end
    def update
        doemu = Doemu.find(params[:id])
        if doemu.update(doemu_params)
          redirect_to :action => "show", :id => doemu.id
        else
          redirect_to :action => "new"
        end
    end
    def destroy
        doemu = Doemu.find(params[:id])
        doemu.destroy
        redirect_to action: :index
    end
    
    private
    def doemu_params
        params.require(:doemu).permit(:name, :about, :money, :access, :image, :overall, :level, :lat, :lng)
    end
end
