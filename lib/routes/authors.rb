require_relative '../model/author'

namespace('/api/v1/authors') do
    get('') do
        result = Author.all.as_json
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    get('/:id_author') do |id_author|
        result = Author.find(id_author)
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    post('') do 
        body = JSON.parse(request.body.read)
        new_author = Author.new(body)
        new_author.save
        halt(200, new_author.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    patch('') do 
        body = JSON.parse(request.body.read)
        user = Author.find(body['id'])
        user.update(body)
        user.save
        halt(200, user.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id') do |id|
        author = Author.find(id)
        author.destroy
        halt(200, author.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end
end