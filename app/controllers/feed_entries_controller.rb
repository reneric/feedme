class FeedEntriesController < ApplicationController
  before_action :set_feed_entry, only: [:show, :edit, :update, :destroy]

  # GET /feed_entries
  # GET /feed_entries.json
  def index
    @feed_entries = FeedEntry.all
  end

  # GET /feed_entries/1
  # GET /feed_entries/1.json
  def show
  end

  def refresh
    @feed_entries = FeedEntry.all(:limit => 40, :order => "published_at desc")
  end

 def live
    @feeds = Feed.all
    @feed_entries = FeedEntry.all(:limit => 40, :order => "published_at desc")
    respond_to do |format|
    @feeds.each do |feed| 
      FeedEntry.update_from_feed(feed.feed_url, feed.id)
    end
      format.html # new.html.erb
      format.json { render json: @feeds }
      format.js
    end
  end

  # GET /feed_entries/new
  def new
    @feed_entry = FeedEntry.new
  end

  # GET /feed_entries/1/edit
  def edit
  end

  # POST /feed_entries
  # POST /feed_entries.json
  def create
    @feed_entry = FeedEntry.new(feed_entry_params)

    respond_to do |format|
      if @feed_entry.save
        format.html { redirect_to @feed_entry, notice: 'Feed entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feed_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @feed_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_entries/1
  # PATCH/PUT /feed_entries/1.json
  def update
    respond_to do |format|
      if @feed_entry.update(feed_entry_params)
        format.html { redirect_to @feed_entry, notice: 'Feed entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feed_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_entries/1
  # DELETE /feed_entries/1.json
  def destroy
    @feed_entry.destroy
    respond_to do |format|
      format.html { redirect_to feed_entries_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_entry
      @feed_entry = FeedEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_entry_params
      params.require(:feed_entry).permit(:feed_id, :condition, :name, :summary, :url, :published_at, :guid)
    end
end
