require 'roda'
require_relative './app/models/message'
require_relative './app/services/message_service'
require_relative './app/constants/translations'

class App < Roda
  plugin :json
  plugin :json_parser

  route do |r|
    # Root endpoint
    r.root do
      { message: 'Welcome to Hello API!' }
    end

    # Health check endpoint
    r.on 'health' do
      { status: 'ok' }
    end

    # API endpoints
    r.on 'api' do
      r.on 'messages' do
        # GET /api/messages
        r.get true do
          MessageService.get_default_message.to_h
        end

        # GET /api/messages/:language
        r.get String do |language|
          MessageService.get_translated_message(language).to_h
        end

        # POST /api/messages
        r.post do
          request_payload = r.params
          MessageService.create_message(
            request_payload['content'],
            request_payload['language']
          ).to_h
        end
      end
    end
  end
end 