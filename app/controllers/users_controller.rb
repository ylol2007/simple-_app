require 'azure'
require 'optparse'
require 'CGI'
require 'openssl'
require 'base64'
require 'Faraday'
require 'Digest'
require 'net/http'
require 'json'



class UsersController < ApplicationController


  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new



# Create an azure service bus object
#    service_bus = Azure.service_bus

# Create a topic with just the topic name
#    topic1 = service_bus.create_topic("test-topic-1")

# Create a topic with a topic object
#    topic2 = Azure::ServiceBus::Topic.new("test-topic-2")
#    topic2.max_size_in_megabytes = 2048
#    topic2 = service_bus.create_topic(topic2)

# Create a subscription
#    subscription = Azure::ServiceBus::Subscription.new("test-subscription-1")
#    subscription.topic = topic1.name
#    subscription = service_bus.create_subscription(subscription)

# Send a topic message with just the message body
#    azure_service_bus.send_topic_message(topic1, "test topic message")

# Send a topic message with a brokered message object
#    message = Azure::ServiceBus::BrokeredMessage.new("another test topic message")
#    message.correlation_id = "test-correlation-id-1"
#    service_bus.send_topic_message(topic1, message)







    # Create management credentials
    #TokenProvider credentials = TokenProvider.CreateSharedAccessSignatureTokenProvider(sasKeyName,sasKeyValue)
    # Create namespace client
    #NamespaceManager namespaceClient = new NamespaceManager(ServiceBusEnvironment.CreateServiceUri('Endpoint=sb://showjetpics.servicebus.windows.net/;SharedAccessKeyName', ServiceNamespace, string.Empty), credentials)


    #Azure.config.sb_namespace = "showjetpics"
 #Azure.config.sb_access_key = "oeIP9ldiYouWeRDHBEmvLvktEsjG3QuU/ukQQuVIZeo="

  #message = Azure::ServiceBus::BrokeredMessage.new("test queue message")
  #message.correlation_id = "test-correlation-id"
  #azure_service_bus_service.send_queue_message("posters", message)

# azure_queue_service = Azure::Queue::QueueService.new

 #azure_service_bus_service = Azure::ServiceBusService.new
# begin
#   @queue = azure_service_bus_service.create_queue("test-queue")
# rescue
#   puts $!
# end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

   @user = User.new(user_params)

   @host = 'showjet-pics.cloudapp.net'
   @port = '80'

   @path = "/tasks"

   @body ={
       "bbrequest" => "BBTest",
       "reqid" => "44",
       "data" => {"name" => "test"}
   }.to_json
    respond_to do |format|
      if @user.save

        request = Net::HTTP::Post.new(@path, initheader = {'Content-Type' =>'application/json'})
        request.body = @body
        response = Net::HTTP.new(@host, @port).start {|http| http.request(request) }
        puts "Response #{response.code} #{response.message}: #{response.body}"

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :right, :string)
    end
end
