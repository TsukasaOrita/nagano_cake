class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
   if @genre.save
    @genres = Genre.all
    redirect_to admins_genres_path
   else
    @genres = Genre.all
    render :index
   end
  end


  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
     @genres = Genre.all
     redirect_to admins_genres_path
    else
     render :edit
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at)
  end

end
