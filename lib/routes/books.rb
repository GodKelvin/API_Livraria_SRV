require_relative '../model/book'



namespace('/api/v1/books') do
    get('') do
            result = Book.all.as_json
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    get('/:id_book') do |id_book|
            result = Book.find(id_book)
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    post('') do 
        begin 
            body = JSON.parse(request.body.read)
            new_book = Book.new(body)
            new_book.save
            halt(200, new_book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    patch('') do 
            body = JSON.parse(request.body.read)
            book = Book.find(body['id'])
            book.update(body)
            book.save
            halt(200, book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id') do |id|
            book = Book.find(id)
            puts book.as_json
            book.destroy
            halt(200, book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end
end

