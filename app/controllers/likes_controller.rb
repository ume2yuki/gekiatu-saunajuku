class LikesController < ApplicationController
    
    def create
        like = current_user.likes.create(doemu_id: params[:doemu_id]) 
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        like = Like.find_by(doemu_id: params[:doemu_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
end
