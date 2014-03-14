class GenresController < ApplicationController
  
  def index
    @genres = Genre.alphabetical.to_a
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to(@genre, :notice => 'Genre was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(genre_params)
      redirect_to(@genre, :notice => 'Genre was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to(genres_url)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
