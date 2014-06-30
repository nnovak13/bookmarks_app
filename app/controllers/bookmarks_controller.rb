class BookmarksController < ApplicationController

  # GET /bookmarks
  def index
    if params[:filter].nil?
       @bookmarks = Bookmark.order(:title)
    else
       @bookmarks = Bookmark.order(:title).where(category: params[:filter])
    end
  end

  #GET /bookmarks/:id
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  #GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  #POST/bookmarks
  def create
    #construct, instantiate a new bookmark instance
    #from the form fields, which live in the params hash

    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      # It saved, so lets see this new bookmark
      # render :show, status: :created, location: @bookmark
      # flash[:notice] = "Bookmark submitted"
      redirect_to bookmarks_path
    else

      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end





  #bookmarksController#update
  #will update an existing model, bookmark
  def update
    #get the bookmark to update
    @bookmark = Bookmark.find(params[:id])

    #Using strong params
    #update this bookmark

    # bookmark#update
    #this is where we actually update the model
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "You have updated the #{@bookmark.title}"
    else
      # No worky, try again, show me the form you.
      render :edit
    end
  end


  # def category('funny')
  #   @bookmarks = Bookmark.where(category: 'funny').order(title:)
  #   render :index
  # end

  # def category('serious')
  #   @bookmarks = Bookmark.where(category: 'serious').order(title:)
  #   render :index
  # end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, notice: "You have deleted the bookmark"
  end

  # def favorite
  #   @bookmark = Bookmark.find(params[:id])
  #   if @bookmark.favorite(bookmark_params)
  #     :is_favorite == true

  #   end


  private

  #Define which parameters are allowed to be used to create a Bookmark
  def bookmark_params
    params.require(:bookmark).permit([:title, :url, :category, :comment, :is_favorite])
  end
end
