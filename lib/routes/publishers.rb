require_relative '../model/publisher'

namespace('/api/v1/publishers') do
    get('') do
        begin 
            result = Publisher.all.as_json
            halt(200, result.to_json)
        
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    get('/:id_publisher') do |id_publisher|
        begin
            result = Publisher.find(id_publisher)
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    post('') do
        begin
            body = JSON.parse(request.body.read)
            new_publisher = Publisher.new(body)
            new_publisher.save
            halt(200, new_publisher.to_json)
        rescue Exception => error
            halt(500, {error: error.message})
        end
    end 
    
    patch('') do 
        begin
            body = JSON.parse(request.body.read)
            publisher = Publisher.find(body['id'])
            publisher.update(body)
            publisher.save
            halt(200, publisher.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    delete('/:id') do |id|
        begin
            publisher = Publisher.find(id)
            publisher.destroy
            halt(200, publisher.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end
end

