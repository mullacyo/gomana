class WhatsappJob < ApplicationJob
    queue_as :default
  
    def perform(message)
      client = Twilio::REST::Client.new
      client.messages.create({
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: ENV['MY_PHONE_NUMBER'],
        body: message
      })
    end
  end
  
 