require_relative '../model/livro'



namespace('/api/v1/livros') do
    get('') do
        begin
            result = Livro.all.as_json
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    get('/:id_livro') do |id_livro|
        begin
            result = Livro.find(id_livro)
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    post('') do 
        begin 
            body = JSON.parse(request.body.read)
            new_livro = Livro.new(body)
            new_livro.save
            halt(200, new_livro.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    patch('') do 
        begin
            body = JSON.parse(request.body.read)
            livro = Livro.find(body['id'])
            livro.update(body)
            livro.save
            halt(200, livro.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    delete('/:id') do |id|
        begin
            livro = Livro.find(id)
            puts livro.as_json
            livro.destroy
            halt(200, livro.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end
end

