#require "pry"
class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)

    

    #elsif if match cart
    #
    elsif req.path.match(/cart/)
      if @@cart.length >= 1
        @@cart.each do |cart|
          resp.write "#{cart}\n"
        end
      else
        resp.write "Your cart is empty"
      end

    elsif req.path.match(/add/)
      item = req.params["item"]
      #binding.pry
      if @@items.include?(item)
        @@cart << item
       
         resp.write "added #{item}"
      else
        resp.write "We don't have that item"
      end





    #elsif req.path.match(/search/)
     # search_term= req.params["q"]

      #if @@items.include?(search_term)
       # @@cart << search_term
     # end
   # elsif req.path.match(/add/)
   # @@items.each do |item| @@cart << item
   #end
    else
      resp.write "Path Not Found"
     # if req.path.match(/search/)
       # search_term= req.params["q"]
        #if @@items.include?(search_term)
         # @@cart
       # else @@items.include?(search_term) == false
        #  resp.write "We don't have that item"
       # end
      #end
    end



  #elsif req.path.match(/search/)
 
    #search_term = req.params["q"]

   # if @@items.include?(search_term)
    #  resp.write "#{search_term} is one of our items"
    #else
   #   resp.write "Couldn't find #{search_term}"
   # end

    



    resp.finish
  end


  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end


end
