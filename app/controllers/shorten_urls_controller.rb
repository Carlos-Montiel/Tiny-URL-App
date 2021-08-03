# frozen_string_literal: true

class ShortenUrlsController < ApplicationController
  before_action :set_shorten_url, only: %i[destroy]

  def index
    @shorten_urls = ShortenUrl.all
  end

  def new
    @shorten_url = ShortenUrl.new
  end

  def create
    @shorten_url = ShortenUrl.new(shorten_url_params)

    respond_to do |format|
      if @shorten_url.save
        format.html { redirect_to shorten_urls_path, notice: 'Url created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def url_info
    @shorten_url = ShortenUrl.find_by(short_token: params[:token])
  end

  def redirect_to_url
    @shorten_url = ShortenUrl.find_by(short_token: params[:token])

    redirect_to @shorten_url.long_url
  end

  def destroy
    @shorten_url.destroy
    respond_to do |format|
      format.html { redirect_to shorten_urls_url, notice: 'Url deleted succesfully.' }
    end
  end

  private

  def set_shorten_url
    @shorten_url = ShortenUrl.find(params[:id])
  end

  def shorten_url_params
    params.require(:shorten_url).permit(:long_url, :description, :short_token)
  end
end
