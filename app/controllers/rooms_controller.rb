class RoomsController < ApplicationController
  def index
    @room = Room.all
  end

  def  new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :charge, :adress, :img))
    # @plan = Plan.new(params.require(:plan).permit(:title, :StartDay, :EndDay, :AllDay, :memo))
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :home_top
    else
      render :new_room
    end
  end

  def show

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


end
