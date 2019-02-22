class OutingsController < ApplicationController
    def index
        @outings = User.find(current_user.id).outings
    end

    def new
        @outing = Outing.new
    end

    def create
        @outing = Outing.new(outing_params)
        
        if @outing.save
            OutingsUser.create(user_id: current_user.id, outing_id: @outing.id)
            flash[:message] = "Saved!"
            message = 'You have created an outing on GoMana! Log in and check it out now.'
            WhatsappJob.perform_now(message)
            redirect_to root_path
        else
            flash[:message] = "Try again!"
            render new
        end
    end

    def show
        @outing = Outing.find(params[:id])
    end

    def edit

    end

    def update
    end

    def destroy

    end

    private
    
    def outing_params
        params.require(:outing).permit(:date, :start_time, :end_time)
    end
end
