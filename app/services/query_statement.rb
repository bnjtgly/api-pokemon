class QueryStatement
    def initialize(params)
      @query_statement = params[:query_statement]
    end

    def execute
        begin
          ActiveRecord::Base.connection.execute(@query_statement)
        rescue
          false
        end
    end
end