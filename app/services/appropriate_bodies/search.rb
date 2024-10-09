module AppropriateBodies
  class Search
    def initialize(query_string)
      @query_string = query_string
    end

    def search
      case
      when @query_string.blank?
        AppropriateBody.all
      else
        AppropriateBody.where("name ILIKE ?", "%#{@query_string}%")
      end.order(:name)
    end
  end
end
