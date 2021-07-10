class Application
  @@cart = ["Apples", "Oranges"]
  @@items = ["Figs", "Oranges"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/) #&& @@cart.empty? == true
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
        end
      end
    elsif req.path.match(/add/)
      add_term = req.params["item"]

      if @@items.include?(add_term)
        @@cart << add_term
        resp.write "added #{add_term}"
      else
        resp.write "We don't have that item"
      end
    end
    resp.finish
  end
end
