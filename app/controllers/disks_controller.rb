class DisksController < ApplicationController
	
  before_action :set_user
    # GET /disks
  # GET /disks.json
  def index
    @disks = Disk.all
  end

  # POST /disks
  # POST /disks.json
  def create
    @disk = Disk.new(disk_params)
    Uniquify.uniquify("AKIAIAL3W5DIRE2IUQLQ",  "DwGPiZDSAgV6wYKleM0b9HCV7cMH3xiPJzYd+E6z", params[:disk]["name"])
    respond_to do |format|
      if @disk.save
        format.html { redirect_to disks_path, notice: 'Disk was successfully created.' }
        format.json { render :index, status: :created, location: @disks }
      else
        format.html { render :new }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @disk = Disk.new
  end

  # PATCH/PUT /disks/1
  # PATCH/PUT /disks/1.json
  def update
    respond_to do |format|
      if @disk.update(disk_params)
        format.html { redirect_to @disk, notice: 'Disk was successfully updated.' }
        format.json { render :show, status: :ok, location: @disk }
      else
        format.html { render :edit }
        format.json { render json: @disk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disks/1
  # DELETE /disks/1.json
  def destroy
    @disk.destroy
    respond_to do |format|
      format.html { redirect_to disks_url, notice: 'Disk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /disks/1/calculate_disk 
  # This method calculates the number of size occupied by uploaded files.
  def calculate_disk_size
    puts "I am in calculate disk size......"
    puts "#{params[:disk_id]}"
    Disk.calculate_disk_size(params[:disk_id])
  end

  private
    def set_user
      @current_user = current_user
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def disk_params
      params.require(:disk).permit(:avatar, :user_id, :name, :description)
    end
end
