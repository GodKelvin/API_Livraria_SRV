require_relative '../model/like'

namespace('/api/v1/likes') do
    get('') do
        result = Like.all.as_json
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    get('/:id_like') do |id_like|
        result = Like.find(id_like)
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    post('') do 
        body = JSON.parse(request.body.read)
        new_like = Like.new(body)
        new_like.save
        halt(200, new_like.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    patch('') do 
        body = JSON.parse(request.body.read)
        like = Like.find(body['id'])
        like.update(body)
        like.save
        halt(200, user.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id') do |id|
        like = Like.find(id)
        like.destroy
        halt(200, like.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end
end

