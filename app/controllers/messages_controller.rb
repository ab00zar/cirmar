class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # def csv

  #     file = "#{Rails.root}/public/data.csv"

  #     data = Message.all

  #     CSV.open( file, 'w' ) do |writer|
  #           data.each do |s|
  #                  writer << [s.type, s.repeatIndicator, s.mmsi]
  #           end
  #     end
  # end
  def ships
    #@ships =  Message.today
    #@ships = Message.select("mmsi").distinct #
   # sshd = [{"$group"=> {"_id" => "$mmsi","nu"=>{$sum=>1}}}]
#@ships = Message.aggregate(sshd)
  myships = Message.all.distinct("mmsi")
  @ships = Kaminari.paginate_array(myships).page(params[:page])
  end

  def ships_show
    #@ships = Message.aggregate([{"$group"=> {_id => "$mmsi",nu=>{$sum=>1}}}]).page(params[:page])
    #@ships = Message.ship #select("mmsi").distinct
    
    #@messages = Message.where("#{:mmsi}" => 100010001).count
    #@messages = Message.distinct(:mmsi).count
    @messages = Message.where(mmsi: params[:id])
  end
  # GET /messages
  # GET /messages.json
  def index
      
      #case params[:type_de_message]
       #when "1"
       # @messages = Message.where(:type => "1")
      #else
        

      #end

      
      #if params[:type_de_message] == "1"
      #        @messages = Message.where(:type => "1")
      #end

        if params[:type_de_message] == "all" || params[:type_de_message].blank?
          @messages = Message.all.page(params[:page])
        elsif !params[:type_de_message].blank?
              @messages = Message.type(params[:type_de_message]).page(params[:page])
            end

       #if params[:type_de_navire] == "all" || params[:type_de_navire].blank?
         #    @messages = 
       if !params[:type_de_navire].blank? && params[:type_de_navire] != "all"
          @messages = @messages.navire(params[:type_de_navire])
        end
      respond_to do |format|

              format.html
              format.csv { 
                send_data @messages.to_csv() }
          
      end




  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:type, :repeatIndicator, :mmsi, :receivedDate, :shipType)
    end
end
