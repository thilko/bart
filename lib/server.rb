module Bart
  class Server
    include MongoMapper::Document

    key :name,           String
    key :status,         String
    key :statusdate,     Time 
    key :message,        String

    def deploy
      Thread.new do
        if legacy?
          `nohup ssh deploy@#{name} rake deploy &` 
        else
          `nohup ssh deploy@#{name} ./deploy &`
        end
      end
    end

    def deployable?
      status.to_sym == :up && team_server?
    end
    
    def legacy?
      ["hindenburg", "tirpitz"].include? name
    end
    
    def team_server?
      ["kursk", "pluto", "primus", "tirpitz", "hindenburg", "emil"].include? name
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
