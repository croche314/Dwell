class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]
  layout 'landlord'

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.all
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
    @issues = Issue.where(tenant: @tenant)
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)

    respond_to do |format|
      if @tenant.save
        redirect_to tenants_dashboard_path
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    if @tenant.update(tenant_params)
     redirect_to tenants_dashboard_path
    else
      render :edit
    end
  end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    @tenant = Tenant.find(current_user.id)
    if @tenant.unit_id
      @my_landlord = @tenant.unit.property.landlord
    end
    if @tenant.unit_id
      @unit = Unit.find(@tenant.unit_id)
      @property = Property.find(@unit.property_id)
      @issues = Issue.where(tenant: @tenant).where(unit: @unit)
    end
    @accounts = Account.where(tenant_id: current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:landlord_id, :property_id, :unit_id, :first_name, :last_name, :birthdate, :phone, :email, :bio, :income, :smoker)
    end
end
