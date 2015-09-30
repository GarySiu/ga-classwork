class PizzaShop < Sinatra::Base

  get '/pizzas' do # index
    @pizzas = Pizza.all
  end

  post '/pizzas' do # create
    hash = {sauce: 'cheese', name: '4 Cheeses'}
    @pizza = Pizza.new hash
    @pizza.save
  end

  get '/pizzas/:id' do # show
    @pizza = Pizza.find params[:id]
  end

  get '/pizzas/:id/edit' do # edit
    @pizza = Pizza.find params[:id]
  end

  put '/pizzas/:id' do # update
    hash = {sauce: 'chilli', name: 'Hot! Hot! Hot!'}
    @pizza = Pizza.find(params[:id])
    @pizza.update hash
  end

  delete '/pizza/:id' do # delete
    @pizza = Pizza.find params[:id]
    @pizza.destroy
  end

end
