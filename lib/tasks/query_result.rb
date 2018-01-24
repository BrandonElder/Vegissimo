module QueryResult
  attr_accessor :query_result, :query_term, :max_cal

  def self.store_query_result(query_result,
                              query_term = nil,
                              max_cal = 500,
                              health = 'vegan')
    @query_result = query_result
    @query_term = query_term
    @max_cal = max_cal
    @health = health
  end

  def self.filter_hits(disliked_list, hits)
    return if @query_result.nil?
    hits.reject do |hit|
      disliked_list.include?(hit['recipe']['label'])
    end
  end

  def self.return_query_term
    @query_term
  end

  def self.return_max_cal
    @max_cal
  end

  def self.return_health
    @health
  end

  def self.query_error?
    return if @query_result.nil?
    @query_result == 403
  end

  def self.api_limit?
    return if @query_result.nil?
    @query_result == 401
  end

  def self.no_recipe_found?
    return if @query_result.nil?
    @query_result['count'] > 0 ? false : true
  end

  def self.num_of_hits
    return if @query_result.nil?
    @query_result['to']
  end

  def self.hits
    @query_result['hits'] if @query_result
  end
end