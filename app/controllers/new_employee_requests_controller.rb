class NewEmployeeRequestsController < ApplicationController
  # GET /new_employee_requests
  # GET /new_employee_requests.xml
  def index
    @new_employee_requests = NewEmployeeRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @new_employee_requests }
    end
  end

  # GET /new_employee_requests/1
  # GET /new_employee_requests/1.xml
  def show
    @new_employee_request = NewEmployeeRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @new_employee_request }
    end
  end

  # GET /new_employee_requests/new
  # GET /new_employee_requests/new.xml
  def new
    @new_employee_request = NewEmployeeRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_employee_request }
    end
  end

  # GET /new_employee_requests/1/edit
  def edit
    @new_employee_request = NewEmployeeRequest.find(params[:id])
  end

  # POST /new_employee_requests
  # POST /new_employee_requests.xml
  def create
    @new_employee_request = NewEmployeeRequest.new(params[:new_employee_request])

    respond_to do |format|
      if @new_employee_request.save
        format.html { redirect_to(@new_employee_request, :notice => 'New employee request was successfully created.') }
        format.xml  { render :xml => @new_employee_request, :status => :created, :location => @new_employee_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_employee_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /new_employee_requests/1
  # PUT /new_employee_requests/1.xml
  def update
    @new_employee_request = NewEmployeeRequest.find(params[:id])

    respond_to do |format|
      if @new_employee_request.update_attributes(params[:new_employee_request])
        format.html { redirect_to(@new_employee_request, :notice => 'New employee request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @new_employee_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /new_employee_requests/1
  # DELETE /new_employee_requests/1.xml
  def destroy
    @new_employee_request = NewEmployeeRequest.find(params[:id])
    @new_employee_request.destroy

    respond_to do |format|
      format.html { redirect_to(new_employee_requests_url) }
      format.xml  { head :ok }
    end
  end
end
