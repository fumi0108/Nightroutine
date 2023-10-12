class PlaysController < ApplicationController
    def create
        play = current_user.plays.create(star_id: params[:star_id]) #user_idとtweet_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        play = Play.find_by(star_id: params[:star_id], user_id: current_user.id)
        play.destroy
        redirect_back(fallback_location: root_path)
      end
end
