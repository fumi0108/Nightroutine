class StarsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def top
    end

    def index
        @stars = Star.all
        @stars = @stars.page(params[:page]).per(3)
    end

    def new
        @Star = Star.new
      end
    
      def create
        star = Star.new(star_params)
        star.user_id = current_user.id
        if star.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @star = Star.find(params[:id])
        @comments = @star.comments
        @comment = Comment.new
      end

      def edit
        @star = Star.find(params[:id])
      end

      def update
        star = Star.find(params[:id])
        if star.update(star_params)
          redirect_to :action => "show", :id => star.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        star = Star.find(params[:id])
        star.destroy
        redirect_to action: :index
      end
    
    
      private
      def star_params
        params.require(:star).permit(:osusume, :sakerubeki, :image)
    end
end
