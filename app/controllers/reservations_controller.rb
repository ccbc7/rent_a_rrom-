class ReservationsController < ApplicationController

  def index
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result

  end

  def new
    @user = current_user
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def confirm
    @user = current_user
    @reservation = Reservation.new(reservation_params)
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

  # def edit_confirm
  #   @reservation = Reservation.new(@attr)
  #   # render :new if @room.invalid?
  #   # params.require(:reservation).permit(:start_day, :end_day, :people, :room_name, :adress, :charge)
  #   @user = current_user
  #   @q = Room.ransack(params[:q])
  #   @results = @q.result
  #   @room = Room.find(params[:id])
  #   # @room.attributes = reservation_params
  #   render :edit if @reservation.invalid?

  # end

  def update
    @q = Room.ransack(params[:q])
    @results = @q.result
    @user = current_user
    @room = Room.find(params[:id])

    if params[:back] || !@reservation.save(params.require(:reservation).permit(:start_day, :end_day, :people, :room_name, :adress, :charge))
      render "edit_reservation_path"
    else
      redirect_to "reservation_path"
      flash[:notice] = "IDが「#{@room.id}」の情報を更新しました"
    end
  end

  def destroy
  end

  private
  # def set_q
  #   @q = Room.ransack(params[:q])
  # end

  def reservation_params
    params.permit(:start_day, :room_name, :end_day, :people, :charge, :adress)
  end





end
