class ActionsController < ApplicationController
    def index
        @outing = Outing.find(params[:outing_id])
        @actions = Action.all
        @actionsouting = ActionsOuting.new(outing_action_params)
        if @actionsouting.save
            render index
        else
            flash[:message] = "Please try again."
        end
            
    end

    def new
    end

    def create
        @outing = Outing.find(params[:outing_id])
        actions_outing = ActionsOuting.new(outing_action_params)
        if actions_outing.save
            redirect_to outing_actions_path(@outing.id), method: :get
            flash[:message] = "Saved!"
        else
            flash[:message] = "Please try again."
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
        @actions_outing = ActionsOuting.where(outing_id: params[:outing_id]).find_by(action_id: params[:id])
        if @actions_outing.destroy
            redirect_to outings_path
            flash[:success] = "Your action was deleted successfully."
        else
            redirect_to outings_path
            flash[:danger] = "Failed to delete."
        end
    end

    private

    def outing_action_params
        params.permit(:outing_id, :action_id)
    end

end
