require_relative '../model/author_book'

namespace('/api/v1/authors-books') do
    post('') do
        body = JSON.parse(request.body.read)
        new_author_book = AuthorsBook.new(body)
        new_author_book.save
        halt(200, new_author_book.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id_author_book') do |id_author_book|
        author_book = AuthorsBook.find_by_id(id_author_book)
        if(author_book)
            author_book.destroy
            halt(200, author_book.to_json)
        else
            halt(200, {msg: "Relação de author e livro não encontrada"}.to_json)
        end
    rescue Exception => error
        halt(500, {error: error.message}.to_json)
    end
end
