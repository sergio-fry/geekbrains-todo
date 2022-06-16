module Admin
  class UsersController < AdminController
    before_action :set_admin_user, :authorize_user, only: %i[show edit update destroy]

    # GET /admin/users or /admin/users.json
    def index
      @users = policy_scope(User)
    end

    # GET /admin/users/1 or /admin/users/1.json
    def show; end

    # GET /admin/users/new
    def new
      @user = User.new
      authorize @user
    end

    # GET /admin/users/1/edit
    def edit; end

    # POST /admin/users or /admin/users.json
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/users/1 or /admin/users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/users/1 or /admin/users/1.json
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

    def authorize_user
      authorize @user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
