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

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_url(@entry), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entries_url(@entry), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_entry
      @entry = current_user.entries.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
