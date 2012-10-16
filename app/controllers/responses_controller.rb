class ResponsesController < ApplicationController
  # GET /responses/new
  # GET /responses/new.json
  def new
    @response = Response.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new
    @response.reason = Reason.new
    @response.reason.why = params[:response][:why]
    @response.reason.critique = params[:response][:critique]

    @response.ip_address = request.remote_ip
    @response.user_agent = request.env['HTTP_USER_AGENT']

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end
end
