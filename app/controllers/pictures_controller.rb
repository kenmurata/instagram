class PicturesController < ApplicationController
    def index
        @pictures = Picture.all.order(:id)
        if user_signed_in?
          @username = current_user.name
        end
    end
    def new
        @picture = Picture.new
    end
    def create
        @picture = Picture.new(picture_params)
        @picture.user_id = current_user.id
        if @picture.save
          redirect_to pictures_path, notice: '投稿しました'
        else
            render 'new'
        end
    end
    def edit
        @picture = Picture.find(params[:id])
    end
    def update
        @picture = Picture.find(params[:id])
        if @picture.update(picture_params)
            redirect_to pictures_path, notice: '編集しました'
        else
            render 'edit'
        end
    end
    def destroy
        @picture = Picture.find(params[:id])
        @picture.destroy
        redirect_to pictures_path, notice: '削除しました'
    end
    private
      def picture_params
          params.require(:picture).permit(:title,:comment,:image_url)
      end
end
