require_relative '../model/book'



namespace('/api/v1/books') do
    get('') do
        begin
            result = Book.all.as_json
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    get('/:id_book') do |id_book|
        begin
            result = Book.find(id_book)
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
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
        begin
            body = JSON.parse(request.body.read)
            book = Books.find(body['id'])
            book.update(body)
            book.save
            halt(200, book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    delete('/:id') do |id|
        begin
            book = Book.find(id)
            puts book.as_json
            book.destroy
            halt(200, book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end
end

