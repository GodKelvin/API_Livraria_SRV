require_relative '../model/author_book'
require_relative '../model/author'
require_relative '../model/like'
require_relative '../model/user'

namespace('/api/v1/teste') do
    get('') do
        begin
            result = Author_Book.all.as_json
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end
end
