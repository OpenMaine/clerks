require 'roo'

class CampaignsController < ApplicationController
  def index
    @greeting = "heyo"
  end

  def upload
    uploaded_file = params[:spreadsheet]
    parsed = Roo::Spreadsheet.open(uploaded_file, extension: :xlsx)
    @info = parsed.info
    puts @info
    redirect_to @info
    redirect_to action: "index"
    #File.open(Rails.root.join('public', 'uploads',
    #  uploaded_file.original_filename), 'wb') do |file| file.write(
    #    uploaded_file.read)
    #end
  end
end
