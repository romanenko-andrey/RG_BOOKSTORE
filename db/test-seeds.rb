User.destroy_all
Photo.destroy_all
Book.destroy_all
Review.destroy_all
Bestseller.destroy_all
Newest.destroy_all
Author.destroy_all
Category.destroy_all
Country.destroy_all
Order.destroy_all
OrdersState.destroy_all

Country.create! [
  { name: "USA", zip: '00' },
  { name: "Canada", zip: '01' },
  { name: "Mexica" , zip: '02' },
  { name: "Ukraine", zip: '38' },
]

User.create! [
  { name: "Admin", admin: true, email: 'admin@test.com', password: "12345678", password_confirmation: "12345678" }
]

User.first.billing_address.update(country: Country.first.id)
User.first.shipping_address.update(country: Country.first.id)


Category.create! [
  {name: "Mobile development"},
  {name: "Photo"},
  {name: "Web design"},
  {name: "Database"}
]

OrdersState.create! [
  {name: "in_progress"},
  {name: "in_queue"},
  {name: "in_delivery"},
  {name: "delivered"},
  {name: "canceled"}
]

Author.create! [
  {first_name: "Vitaly", last_name: "Friedman"},
  {first_name: "Daniel", last_name: "Mall"},
  {first_name: "Fernando", last_name: "Monteiro"},
  {first_name: "Dallas", last_name: "Snider"},
  {first_name: "Jason", last_name: "Beaird"},
  {first_name: "Paul", last_name: "Boag"},
  {first_name: "Jennifer Niederst", last_name: "Robbins"},
  {first_name: "Jon", last_name: "Duckett"},
  {first_name: "Ethan", last_name: "Marcotte"},
  {first_name: "John", last_name: "Horton"},
]

  PATH_TO_IMG = Dir.pwd + "/db/seeds_img/"

  photo00 = Photo.create!(file: File.open(PATH_TO_IMG + "Green-Smashing-Book-5-real-life-responsive-web-design-right-3-large.png"))
  photo01 = Photo.create!(file: File.open(PATH_TO_IMG + "smashing-book-5-marc-2-large.jpg"))
  photo02 = Photo.create!(file: File.open(PATH_TO_IMG + "smashing-book-5-marc-5-large.jpg"))
  photo03 = Photo.create!(file: File.open(PATH_TO_IMG + "smashing-book-5-photo.ab93ea0cf6.jpg"))
  photo04 = Photo.create!(file: File.open(PATH_TO_IMG + "smashing-book-5-photo-stack.9d5d114e3e.jpg"))

  photo10 = Photo.create!(file: File.open(PATH_TO_IMG + "V06202_MockupCover.jpg"))
  photo11 = Photo.create!(file: File.open(PATH_TO_IMG + "NodeJS.jpg"))

  photo20 = Photo.create!(file: File.open(PATH_TO_IMG + "V05929_MockupCover.jpg"))
  photo21 = Photo.create!(file: File.open(PATH_TO_IMG + "MockupCover.jpg"))

  photo30 = Photo.create!(file: File.open(PATH_TO_IMG + "principles-of-beautiful-web-design.jpg"))
  photo31 = Photo.create!(file: File.open(PATH_TO_IMG + "beautiful web - img1.jpg"))
  photo32 = Photo.create!(file: File.open(PATH_TO_IMG + "beautiful web - img2.jpg"))
  photo33 = Photo.create!(file: File.open(PATH_TO_IMG + "beautiful web - img3.jpg"))

  
Book.create! [
  { name: "Real Life Responsive Web Design",
    authors: [Author.find_by(first_name: "Vitaly", last_name: "Friedman"),
              Author.find_by(first_name: "Daniel", last_name: "Mall"),  
    ],
    price: 32.90,
    category: Category.find_by(name: "Web design"),
    short_description: "A new book with smart front-end techniques and design patterns derived from real-life responsive projects",
    description: 
%(
### The Smashing Book 5: Real-Life Responsive Web Design 
is our brand new book with smart front-end techniques and design patterns derived from real-life responsive projects. 

#### With 12 chapters on responsive workflow, SVG, Flexbox, web fonts, responsive images, responsive email, content strategy, debugging, performance and offline experience, 
this is just the book you need to master all the tricky facets and hurdles of responsive design.

Written by Daniel Mall, Sara Soueidan, Zoe M. Gillenwater, Bram Stein, Yoav Weiss, Tom Maslen, Matt Gaunt, Andrew Clarke, the Mystery Author, yours truly and other smashing authors.
),
    
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "design-book",
    photos: [photo00, photo01, photo02, photo03, photo04]
  },
  { name: "Node.js Projects",
    authors: [Author.find_by(first_name: "Fernando", last_name: "Monteiro")],
    price: 32.80,
    category: Category.find_by(name: "Mobile development"),
    short_description: "This book show you how you can create applications from scratch using Node.js 6.X.",
    description: "Node.js is the most popular framework to create server-side applications with, be it web, desktop, or mobile. Covering a wide variety of applications from simple to complex responsive ones, this course will show you how you can create applications from scratch using Node.js 6.X. While building these applications, we’ll employ several other frameworks and you’ll get a solid understanding of how to integrate and use other frameworks in tandem with Node.JS 6.X. You’ll create a data intensive application with MongoDB, use AngularJS to create a front-end application, and utilize Bootstrap to create a truly responsive web app. We will also show you how to use socket frameworks with your Node.js applications.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "nodejs-book",
    photos: [photo10, photo11]
  },
  { name: "SQL Server 2016 Database Reporting",
    authors: [Author.find_by(first_name: "Dallas", last_name: "Snider")],
    price: 22.80,
    category: Category.find_by(name: "Database"),
    short_description: "This book will empower you to overcome any obstacle while creating interactive, visually-appealing reports using SQL Server 2016 Reporting Services.",
    description: "With SQL Server 2016 Reporting Services, users are excited about being able to visualize their data in new, creative ways for use in presentations, analysis, and decision support—even on mobile devices. In this course, users will receive step-by-step instructions on how to create stunning, high-impact reports. The course starts with an introduction to the technologies employed. Next, users are shown how to create a basic report and then how to format it and add features (such as headers and footers) to make it more readable, impressive, and practical. The course teaches how to create drill-down and drill-through reports. Pie charts, gauges. and maps are next on the agenda and the course wraps up with lessons on how to assemble a dashboard on the SQL Server Reporting Services web portal. This course will empower you to overcome any obstacle while creating interactive, visually-appealing reports using SQL Server 2016 Reporting Services.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2017),
    alt: "sql-server-book",
    photos: [photo20, photo21]
  },
  { name: "The Principles of Beautiful Web Design",
    authors: [Author.find_by(first_name: "Jason", last_name: "Beaird")],
    price: 39.95,
    category: Category.find_by(name: "Photo"),
    short_description: "A simple, easy-to-follow guide, illustrated with plenty of full-color examples, this book will lead you through the process of creating great designs from start to finish.",
    description: "A simple, easy-to-follow guide, illustrated with plenty of full-color examples, this book will lead you through the process of creating great designs from start to finish. Good design principles are not rocket science, and using the information contained in this book will help you create stunning web sites. Understand the design process, from discovery to implementation. Understand what makes \"good design\". Developing pleasing layouts using grids, the rule of thirds, balance and symmetry. Use color effectively, develop color schemes and create a palette. Use textures, lines, points, shapes, volumes and depth. Learn how good typography can make ordinary designs look great. Effective imagery: choosing, editing and placing images. And much more. Throughout the book, you'll follow an example design, from concept to completion, learning along the way. The book's full-color layout and large format (8\" x 10\") make The Principles Of Beautiful Wed Design a pleasure to read.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "web-design-book",
    photos: [photo30, photo31, photo32, photo33]
  }
]

User.first.reviews.create!(text: "Thank you BookStore, I was very pleased to receive my order for the Moleskine diary so soon after placing the order.",
                        book: Book.all.first, rating: 5)
User.last.reviews.create!(text: "If ‘Get a better job’ had landed on my desk a year ago, I might have been dismissive of it. Instead I was prepared to be open-minded. There have been many occasions where I turned to career books with practical activities to look for some inspiration when developing education activities for learners or assessment.",
                        book: Book.all.first, rating: 3)

Order.create!( user: User.first, discont: '15.00', orders_state: OrdersState.find_by(name: "in_progress"), 
              delivery_methods: "Delivery Next Day!", delivery_cost: "5", cvv: '222', mmyy: '12/23',
              number: "R25314582", total_cost: "40.00", card_number: '1111222233334444', card_name: "John Wood",
              items: [{'book_id': "1", 'price': "10", 'sum': "2"}, {'book_id': "2", 'price': "20", 'sum': "1"}])

Book.take(3).each{ |book| Newest.create! book: book}

Book.take(4).each{ |book| Bestseller.create! book: book}

