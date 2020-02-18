class Application
  @@cart = ["Apples", "Carrots", "Pears"]
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
      if @@cart.length == 0
        resp.write "Your cart is empty"
      end
    elsif req.path.match(/add/)
      search_term = req.params["item"]
      if @@items.include?(search_term)
        @@cart << search_term
        resp.write "added #{search_term}"
      else
        resp.write "We don't have that item"
      end
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?("item")
      #binding.pry
      @@cart << search_term
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
