class EntriesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]
  before_action :set_entry, only: %i[ show edit update destroy ]

  def home
  end

  def index
    @entries = current_user.entries
  end

  def show
  end

  def new
    @entry = current_user.entries.build
  end

  def edit
  end

  def create
    @entry = current_user.entries.build(entry_params)

      if @entry.save
        redirect_to entries_url(@entry), notice: "Entry was successfully created." 
      else
        render :new
    end
  end

  def update
    
      if @entry.update(entry_params)
         redirect_to entries_url(@entry), notice: "Entry was successfully updated." 
      else
        render :edit
    end
  end

  def destroy
    @entry.destroy

    
      redirect_to entries_url, notice: "Entry was successfully deleted."
  end

  private
    def set_entry
      @entry = current_user.entries.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
