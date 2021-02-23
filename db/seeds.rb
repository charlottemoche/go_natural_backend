# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create([
  {first_name: "Charlotte", last_name: "Moche", email: "charlotte@gmail.com", password_digest: "password", bio: "Interested in living more sustainably and reducing my carbon footprint! I write about safe cleaning, ethically made products, and eliminating food waste.", image_url: "image.url"}
  ]),

topics = Topic.create([
  {title: "Replacements", image_url: "https://reviewed-com-res.cloudinary.com/image/fetch/s--JMnIpcxA--/b_white,c_fill,cs_srgb,f_auto,fl_progressive.strip_profile,g_xy_center,q_auto,w_1200,x_590,y_514/https://reviewed-production.s3.amazonaws.com/1458843361000/natural-sea-sponges-hero-flickr-walterpro.jpg"},
  {title: "Natural Cleaning", image_url: "https://www.wendyls.co.nz/wp-content/uploads/2020/04/citrus-paste-ingredients-Copy.jpg"}
  ]),

posts = Post.create([
  {title: "Goodbye paper towels", subtitle: "How I replaced wasteful and disposable paper towels with sustainable cloth napkins", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec sem at augue ullamcorper fermentum. Nunc sagittis enim tortor, et consectetur nisi condimentum quis. Quisque diam lectus, tempor ut lectus eget, vehicula eleifend velit. Maecenas malesuada magna nec augue cursus vulputate. Integer cursus feugiat nibh, a semper eros rutrum a. Integer sodales sapien quis rutrum consequat. Duis aliquet at lorem non dignissim. Duis tristique nunc et odio varius, fermentum ringilla ligula tincidunt. Pellentesque finibus accumsan semper. Integer molestie cursus nunc eu gravida.", image_url: "https://www.rd.com/wp-content/uploads/2020/04/GettyImages-105638725-scaled-e1605721451596.jpg", user_id: 1, topic_id: 1}, 
  {title: "My natural lemon cleaner", subtitle: "Here's what I use to clean my counter tops", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nec sem at augue ullamcorper fermentum. Nunc sagittis enim tortor, et consectetur nisi condimentum quis. Quisque diam lectus, tempor ut lectus eget, vehicula eleifend velit. Maecenas malesuada magna nec augue cursus vulputate. Integer cursus feugiat nibh, a semper eros rutrum a. Integer sodales sapien quis rutrum consequat. Duis aliquet at lorem non dignissim. Duis tristique nunc et odio varius, fermentum ringilla ligula tincidunt. Pellentesque finibus accumsan semper. Integer molestie cursus nunc eu gravida.", image_url: "https://cdn.shopify.com/s/files/1/2336/3219/products/shutterstock_336818993meyer_x850.jpg?v=1554665742", user_id: 1, topic_id: 2}
  ]),

comments = Comment.create([
  {body: "This is such a great idea! I add lavender essential oil to mine.", user_id: 1, post_id: 2}
  ])