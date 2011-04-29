module Bart
  class Server
    include MongoMapper::Document

    key :name,           String
    key :status,         String
    key :statusdate,     Time 
    key :message,        String

    def deploy
      Thread.new do
        `nohup ssh deploy@#{name} rake deploy &`
      end
    end

    def deployable?
      status.to_sym == :up && team_server?
    end
    
    def team_server?
      ["kursk", "pluto", "primus", "tirpitz", "hindenburg"].include? name
    end

    def up?
      status.to_sym == :up
    end

    def down?
      status.to_sym == :down
    end

    def deploy?
      status.to_sym == :deploy
    end
  end
end
