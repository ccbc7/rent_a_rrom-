class HomeController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def top
    @user = current_user
    @all_rooms = Room.all
    @q = Room.ransack(params[:q])
  end

  def index
    @user = current_user
    @all_rooms = Room.all
    @q = Room.ransack(params[:q])
    @results = @q.result
    # @room = Room.find(params[:id])
  end


  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
  end

  def search
    @results = @q.result
  end


  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
