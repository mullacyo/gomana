class ActionsController < ApplicationController
    def index

        @outing = Outing.find(params[:outing_id])
        # @actions = Action.all
        # @actions = @actions.where("lower(location) LIKE ?", "%#{params[:location].downcase}%") if params[:location]
        if params[:location]
            @actions = Action.where("lower(location) LIKE ?", "%#{params[:location].downcase}%")
        else
            @actions = Action.all
        end
    end
    
    def new
    end
    
    def create
        @outing = Outing.find(params[:outing_id])
        actions_outing = ActionsOuting.new(outing_action_params)
        if actions_outing.save
            redirect_to outing_actions_path(@outing.id), method: :get
            flash[:success] = "Your action was saved successfully."
        else
            flash[:danger] = "Please try again."
        end
    end
    
    def show
        @action = Action.location(params[:location]) if params[:location].present?
    end
    
    def edit
    end

    def update
    end

    def destroy
        @actions_outing = ActionsOuting.where(outing_id: params[:outing_id]).find_by(action_id: params[:id])
        if @actions_outing.destroy
            redirect_to outing_path(params[:outing_id])
            flash[:success] = "Your action was deleted successfully."
        else
            redirect_to outing_path(params[:outing_id])
            flash[:danger] = "Please try again."
        end
    end

    private

    def outing_action_params
        params.permit(:outing_id, :action_id)
    end

end
