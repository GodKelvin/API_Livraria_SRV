require_relative '../model/book'
require_relative '../model/like'

namespace('/api/v1/books') do
    get('') do
        result = Book.all.as_json
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    get('/:id_book') do |id_book|
        result = Book.find_by_id(id_book)
        halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    post('') do 
        body = JSON.parse(request.body.read)
        new_book = Book.new(body)
        new_book.save
        halt(200, new_book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    patch('') do 
        body = JSON.parse(request.body.read)
        book = Book.find_by_id(body['id'])
        if(book)
            book.update(body)
            book.save
            halt(200, book.to_json)
        else
            halt(200, {msg: "Livro nao encontraod"}.to_json)
        end
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id') do |id|
        if(Book.exists?(id)) 
            book = Book.find(id).destroy
            #Excluo os likes que foram dados no respectivo livro destruido
            #Like.where("ref_type = ? AND ref_id = ?", "books", id).delete_all
            book.delete_all_likes
            halt(200, book.to_json)
        else
            halt(200, {msg: "Livro não encontrado"}.to_json)
        end

        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end
end