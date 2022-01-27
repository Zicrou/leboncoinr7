class MessagesController < ApplicationController
    before_action :set_car

    def create
        message = @car.messages.create! params.required(:message).permit(:content)
        #MessagesMailer.submitted(message).deliver_later
        redirect_to @car    
    end

    private
        def set_car
            @car = Car.find(params[:car_id])
        end
end
