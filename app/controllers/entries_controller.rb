class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /news
  def index
    @entries = Entry.all.each do |entry|
      entry.body = entry.body.truncate(500)
    end
    json_response(@entries)
  end

  # POST /news
  def create
    @entry = Entry.create!(entry_params)
    json_response(@entry, :created)
  end

  # GET /news/:id
  def show
    json_response(@entry)
  end

  # PUT /news/:id
  def update
    @entry.update!(entry_params)
    json_response(@entry)
  end

  # DELETE /news/:id
  def destroy
    @entry.destroy
    head :no_content
  end

  private

  def entry_params
    params.permit(:title, :subtitle, :body)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
