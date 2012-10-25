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
    
    reason = Reason.new
    reason.why = params[:response][:reason][:why]
    reason.critique = params[:response][:reason][:critique]
    @response.reasons = [reason]

    @response.who = params[:response][:who]
    @response.ip_address = request.remote_ip
    @response.user_agent = request.env['HTTP_USER_AGENT']

    respond_to do |format|
      if @response.save
        format.html { redirect_to root_url, notice: 'Your response was successfully submitted! Thanks for taking the time to affect change in our government.' }
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end
end
