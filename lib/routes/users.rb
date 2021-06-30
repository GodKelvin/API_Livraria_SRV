require_relative '../model/user'

namespace('/api/v1/users') do
    get('') do
            result = User.all.as_json
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    get('/:id_user') do |id_user|
            result = User.find(id_user)
            halt(200, result.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end


    get('/likes/:id_user') do |id_user|
        #puts User.likes.as_json
        user = User.find_by_id(id_user)
        if(user)
            halt(200, user.likes.to_json)
        else
            halt(200, {msg: "Usuário não encontrado"}.to_json)
        end
        rescue Exception => error
            halt(500, {error: error.message}.to_json)        
    end

    post('') do 
        begin 
            body = JSON.parse(request.body.read)
            new_user = User.new(body)
            new_user.save
            halt(200, new_user.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end

    patch('') do 
            body = JSON.parse(request.body.read)
            user = User.find(body['id'])
            user.update(body)
            user.save
            halt(200, user.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end

    delete('/:id') do |id|
            user = User.find(id)
            user.destroy
            halt(200, user.to_json)
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
    end
end

