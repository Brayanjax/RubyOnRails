class RoomKindsController < ApplicationController
  before_action :set_room_kind, only: %i[ show edit update destroy ]

  # GET /room_kinds or /room_kinds.json
  def index
    @room_kinds = RoomKind.all
  end

  # GET /room_kinds/1 or /room_kinds/1.json
  def show
  end

  # GET /room_kinds/new
  def new
    @room_kind = RoomKind.new
  end

  # GET /room_kinds/1/edit
  def edit
  end

  # POST /room_kinds or /room_kinds.json
  def create
    @room_kind = RoomKind.new(room_kind_params)

    respond_to do |format|
      if @room_kind.save
        format.html { redirect_to room_kind_url(@room_kind), notice: "Room kind was successfully created." }
        format.json { render :show, status: :created, location: @room_kind }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_kinds/1 or /room_kinds/1.json
  def update
    respond_to do |format|
      if @room_kind.update(room_kind_params)
        format.html { redirect_to room_kind_url(@room_kind), notice: "Room kind was successfully updated." }
        format.json { render :show, status: :ok, location: @room_kind }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_kinds/1 or /room_kinds/1.json
  def destroy
    @room_kind.destroy!

    respond_to do |format|
      format.html { redirect_to room_kinds_url, notice: "Room kind was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_kind
      @room_kind = RoomKind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_kind_params
      params.require(:room_kind).permit(:name, :bed)
    end
end
