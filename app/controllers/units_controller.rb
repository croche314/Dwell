class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :show_lease, :remove_lease_img, :edit, :new_tenant, :add_tenant, :update, :destroy]
  before_action :verify_permission, only: [:show, :show_lease, :remove_lease_img, :edit, :update, :destroy]
  layout 'landlord'

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @tenants = Unit.find(params[:id]).tenants
    if @tenants.length > 0
      @occupied = true
      @late_tenants = @tenants.where(late:true).length
      if @late_tenants > 0
        @late = true
      else @late_tenants < 1
        @late = false
      end
    else
      @late = nil
      @occupied = false
    end
    @issues = @unit.issues
    
  end

  def show_lease

  end

  def remove_lease_img
    @unit.remove_lease_img!
    @unit.save
    redirect_to '/units/'+@unit.id.to_s
  end

  # GET /units/new
  def new
    @unit = Unit.new
    @property = Property.find(params[:id])
  end

  # GET /units/1/edit
  def edit
    
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_tenant
    unless params[:query].nil?
      @query = params[:query].capitalize
      @all_tenants = Tenant.where('first_name=? OR last_name=? OR email=?', @query,@query,@query)

    else
      @all_tenants = Tenant.all
    end
  end

  def add_tenant
    @tenant = Tenant.find(params[:tenant_id])
    @property = @unit.property
    @landlord = @property.landlord
    @tenant.update(landlord: @landlord,property: @property,unit: @unit, late: false)
    @tenant.save
    @property.increment!(:units_occupied)
    @property.save
    @unit.occupied = true
    @unit.save
    flash[:main] = ["Tenant added!"]
    redirect_to "/units/#{@unit.id}"
  end

  def remove_tenant
    @unit = Unit.find(params[:id])
    @tenant = Tenant.find(params[:tenant_id])
    @tenant.landlord = nil
    @tenant.property = nil
    @tenant.unit = nil
    @tenant.save
    if Tenant.where(unit: @unit).length > 0
      @unit.occupied = true
    else
      @unit.occupied = false
    end
    @unit.save
    redirect_to "/units/#{@unit.id}"
  end

  def find_unit
    @vacant_units = Unit.where(occupied: false)
  end

  def delete_unit
    @unit = Unit.find(params[:id])
    @property = @unit.property
    @property.decrement!(:num_units)
    @property.decrement!(:units_occupied)
    @tenants = Tenant.where(unit:@unit)
    @tenants.each do |t|
      t.unit = nil
      t.property = nil
      t.landlord = nil
      t.late = false
      t.save
    end
    @unit.delete
    flash[:main] = ["Unit Deleted"]
    redirect_to "/properties/#{@property.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
       if session[:user_type] == 'landlord' and @unit.property.landlord != current_user
        flash[:warning] = ["You don't have permission to access that"]
        redirect_to landlords_dashboard_url
      elsif session[:user_type] == 'renter' and current_user.unit_id != @unit.id
        flash[:warning] = ["You don't have permission to access that"]
        redirect_to tenants_dashboard_url
      end
    end

    def verify_permission
      if session[:user_type] == 'landlord' and @unit.property.landlord != current_user
        flash[:warning] = ["You don't have permission to access that"]
        redirect_to landlords_dashboard_url
      elsif session[:user_type] == 'tenant' and current_user.unit_id != @unit.id
        flash[:warning] = ["You don't have permission to access that"]
        redirect_to tenants_dashboard_url
      end
        
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:property_id, :name, :rent, :occupied, :lease_start, :lease_end, :bedrooms, :bathrooms, :washer_dryer, :parking, :floor, :utilities, :furnished, :sq_feet, :landlord_id,:lease_img)
    end
end
