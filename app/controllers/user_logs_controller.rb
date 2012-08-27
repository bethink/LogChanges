class UserLogsController < ApplicationController
  # GET /user_logs
  # GET /user_logs.json
  def index
    @user_logs = UserLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_logs }
    end
  end

  # GET /user_logs/1
  # GET /user_logs/1.json
  def show
    @user_log = UserLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_log }
    end
  end

  # GET /user_logs/new
  # GET /user_logs/new.json
  def new
    @user_log = UserLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_log }
    end
  end

  # GET /user_logs/1/edit
  def edit
    @user_log = UserLog.find(params[:id])
  end

  # POST /user_logs
  # POST /user_logs.json
  def create
    @user_log = UserLog.new(params[:user_log])

    respond_to do |format|
      if @user_log.save
        format.html { redirect_to @user_log, notice: 'User log was successfully created.' }
        format.json { render json: @user_log, status: :created, location: @user_log }
      else
        format.html { render action: "new" }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_logs/1
  # PUT /user_logs/1.json
  def update
    @user_log = UserLog.find(params[:id])

    respond_to do |format|
      if @user_log.update_attributes(params[:user_log])
        format.html { redirect_to @user_log, notice: 'User log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_logs/1
  # DELETE /user_logs/1.json
  def destroy
    @user_log = UserLog.find(params[:id])
    @user_log.destroy

    respond_to do |format|
      format.html { redirect_to user_logs_url }
      format.json { head :no_content }
    end
  end
end
