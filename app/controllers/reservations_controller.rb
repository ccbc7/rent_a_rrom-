class ReservationsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result

  end

  def new
    @room = Room.find(params[:id])
    @reservation = Room.new
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  def confirm
    @reservation = Room.new(room_params)
    render :edit if @room.invalid?
  end

  def create
    @reservation = Room.new(room_params)
    if params[:back] || !@reservation.save
        render :new
    else
        redirect_to "/", notice: "#{@reservation.title}を予約しました。"
    end
  end

  def show
    @rooms = Room.all
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result

  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  def edit_confirm
    # @reservation = Room.new(room_params)
    # render :new if @room.invalid?
    params.require(:room).permit(:start_day, :end_day, :people, :room_name, :adress, :charge)
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result
    @room = Room.find(params[:id])
    @room.attributes = room_params
    render :edit if @room.invalid?

  end

  def update
    @q = Room.ransack(params[:q])
    @results = @q.result
    @user = current_user
    @room = Room.find(params[:id])

    # binding.pry
    if params[:back] || !@room.update(params.require(:room).permit(:start_day, :end_day, :people, :room_name, :adress, :charge))
      render "edit_reservation_path"
    else
      redirect_to "reservation_path"
      flash[:notice] = "IDが「#{@room.id}」の情報を更新しました"
    end
  end

  def destroy
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:room_image)
  end



end
