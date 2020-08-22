
tom = User.create(name: 'Tom')

img = Down.download('https://unsplash.com/photos/M0lUxgLnlfk/download?force=true&w=1920')
tom.articles.create(title: 'Texas Style Steak', text: 'Very juicy steak', image: img).categories << Category.create(name: 'Grill', priority: 5)

img = Down.download('https://unsplash.com/photos/ZgRTuPsmFQg/download?force=true&w=1920')
tom.articles.create(title: 'Pancake with fruits', text: 'Yummy meal for breakfast', image: img).categories << Category.create(name: 'Breakfast', priority: 4)
tom.votes.create(article_id: 2)

img = Down.download('https://unsplash.com/photos/RNmibnLCJAA/download?force=true&w=1920')
tom.articles.create(title: 'Salad with Guacamole', text: "Vegeterian's top choice", image: img).categories << Category.create(name: 'Vegeterian', priority: 3)

img = Down.download('https://unsplash.com/photos/MlPD-AzZYMg/download?force=true&w=1920')
tom.articles.create(title: 'Vegetable Salad with Walnuts', text: 'You want regret trying this meal', image: img).categories << Category.create(name: 'Diet', priority: 2)

img = Down.download('https://i.ytimg.com/vi/Uz4nHzafIWE/maxresdefault.jpg')
tom.articles.create(title: "Azerbaijan's Shah Plov",
   text: 'You have never tasted such a nice meal with rice, meat, vegetables and lots of delicious flavors',
   image: img).categories << Category.create(name: 'Traditional', priority: 1)