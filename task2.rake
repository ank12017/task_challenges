namespace :backup do
  desc "Check the records for Models"
  task :add_apple_to_basket, :variety, :count do |t, args|
    args.with_defaults(arg1:"variety", arg2: "count")

    # Find an available basket that has 0 or is filled with at least 1 apple of the same sort as the variety argument.
    Basket.order(:arg1).find(Apple.uniq.pluck(:basket_id));

    # Create as many apple records as are passed in the count argument.
    Apple.create(id: arg2, basket_id: 1, variety: "red delicious")

    # Whenever a basket has a new apple, the fill_rate should be re-calculated as a percentage of the count of the associated records divided by the capacity of the basket.
    baskets = Basket.all
    baskets.each do |basket|
      basket.fill_rate = arg2 / basket.capacity * 100
    end
    
    # If the selected basket is full, the remainder of apples should be carried over to the next basket.
    if Basket.capacity == 27
      new_basket = Basket.create(capacity: 10,fill_rate: 50)
      Apple.create(id: arg2, basket_id: new_basket.id, variety: "red delicious")
    end

    #If no baskets are available, the rake task should output the next message as a standard output
    Basket_id = Basket.find('id')
    if Basket_id.present?
      begin
        # call to mymethod
      rescue => ex
        puts "All baskets are full. We couldn't find the place for \[X\] apples"
      end
    end
  end
end