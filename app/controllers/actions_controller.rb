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
        actions_outing = ActionsOuting.new(outing_action_params)
        if actions_outing.save
            redirect_to root_path
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
    end

    private

    def outing_action_params
        params.permit(:outing_id, :action_id)
    end

end
