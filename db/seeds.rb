# rails db:seed command (or created alongside the database with db:setup).

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
  { name: "Roll", email: '123@123.com', password: "12345678", admin: true },
  { name: "Iren",  email: 'i@mail.ru', password: "12345678" }
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

  photo40 = Photo.create!(file: File.open(PATH_TO_IMG + "mailing-image-Digital-Adaptation-standing-hardcover-v5-opt1.png"))
  photo41 = Photo.create!(file: File.open(PATH_TO_IMG + "digital-adaptation-bookcover-01.jpg"))
  photo42 = Photo.create!(file: File.open(PATH_TO_IMG + "digital-adaptation-bookcover-02.jpg"))
  photo43 = Photo.create!(file: File.open(PATH_TO_IMG + "digital-adaptation-bookcover-03.jpg"))

  photo50 = Photo.create!(file: File.open(PATH_TO_IMG + "learning-web-design-a-beginners-guide.png"))
  photo51 = Photo.create!(file: File.open(PATH_TO_IMG + "book-learningweb-theme1.jpg"))
  photo52 = Photo.create!(file: File.open(PATH_TO_IMG + "book-learningweb-theme2.jpg"))

  photo60 = Photo.create!(file: File.open(PATH_TO_IMG + "javascript-and-jquery-book-cover.png"))
  photo61 = Photo.create!(file: File.open(PATH_TO_IMG + "js_jq2.jpg"))
  photo62 = Photo.create!(file: File.open(PATH_TO_IMG + "js_jq1.jpg"))
  photo63 = Photo.create!(file: File.open(PATH_TO_IMG + "js_jq4.jpg"))

  photo70 = Photo.create!(file: File.open(PATH_TO_IMG + "responsive web design.jpg"))
  photo71 = Photo.create!(file: File.open(PATH_TO_IMG + "responsive web design2.jpg"))
  photo72 = Photo.create!(file: File.open(PATH_TO_IMG + "responsive web design3.jpg"))
  photo73 = Photo.create!(file: File.open(PATH_TO_IMG + "responsive web design1.jpg"))

  photo80 = Photo.create!(file: File.open(PATH_TO_IMG + "C06035.jpg"))
  
  photo90 = Photo.create!(file: File.open(PATH_TO_IMG + "9781785883262.png"))

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
    # title_photo: "Green-Smashing-Book-5-real-life-responsive-web-design-right-3-large.png",
    # photo1: "smashing-book-5-marc-2-large.jpg",
    # photo2: "smashing-book-5-marc-5-large.jpg",
    # photo3: "smashing-book-5-photo.ab93ea0cf6.jpg",
    # photo4: "smashing-book-5-photo-stack.9d5d114e3e.jpg",
  },
  { name: "Node.js Projects",
    authors: [Author.find_by(first_name: "Fernando", last_name: "Monteiro")],
    price: 32.80,
    category: Category.find_by(name: "Web design"),
    short_description: "This book show you how you can create applications from scratch using Node.js 6.X.",
    description: "Node.js is the most popular framework to create server-side applications with, be it web, desktop, or mobile. Covering a wide variety of applications from simple to complex responsive ones, this course will show you how you can create applications from scratch using Node.js 6.X. While building these applications, we’ll employ several other frameworks and you’ll get a solid understanding of how to integrate and use other frameworks in tandem with Node.JS 6.X. You’ll create a data intensive application with MongoDB, use AngularJS to create a front-end application, and utilize Bootstrap to create a truly responsive web app. We will also show you how to use socket frameworks with your Node.js applications.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "nodejs-book",
    photos: [photo10, photo11]
    # title_photo: "V06202_MockupCover.jpg",
    # photo1: "V06202_MockupCover.jpg",
    # photo2: "NodeJS.jpg",
    # photo3: "NodeJS.jpg",
    # photo4: "NodeJS.jpg",
    
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
    # title_photo: "V05929_MockupCover.jpg",
    # photo1: "V05929_MockupCover.jpg",
    # photo2: "MockupCover.jpg",
    # photo3: "MockupCover.jpg",
    # photo4: "MockupCover.jpg"

  },
  { name: "The Principles of Beautiful Web Design",
    authors: [Author.find_by(first_name: "Jason", last_name: "Beaird")],
    price: 39.95,
    category: Category.find_by(name: "Web design"),
    short_description: "A simple, easy-to-follow guide, illustrated with plenty of full-color examples, this book will lead you through the process of creating great designs from start to finish.",
    description: "A simple, easy-to-follow guide, illustrated with plenty of full-color examples, this book will lead you through the process of creating great designs from start to finish. Good design principles are not rocket science, and using the information contained in this book will help you create stunning web sites. Understand the design process, from discovery to implementation. Understand what makes \"good design\". Developing pleasing layouts using grids, the rule of thirds, balance and symmetry. Use color effectively, develop color schemes and create a palette. Use textures, lines, points, shapes, volumes and depth. Learn how good typography can make ordinary designs look great. Effective imagery: choosing, editing and placing images. And much more. Throughout the book, you'll follow an example design, from concept to completion, learning along the way. The book's full-color layout and large format (8\" x 10\") make The Principles Of Beautiful Wed Design a pleasure to read.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "web-design-book",
    photos: [photo30, photo31, photo32, photo33]
    # title_photo: "principles-of-beautiful-web-design.jpg",
    # photo1: "principles-of-beautiful-web-design.jpg",
    # photo2: "beautiful web - img1.jpg",
    # photo3: "beautiful web - img2.jpg",
    # photo4: "beautiful web - img3.jpg"
  },
  { name: "DIGITAL ADAPTATION",
    authors: [Author.find_by(first_name: "Paul", last_name: "Boag")],
    price: 29.95,
    category: Category.find_by(name: "Photo"),
    short_description: "A new practical book on how to help senior management understand the Web and adapt the business, culture, team structure and workflows accordingly.",
    description: "Nothing is more frustrating than stubborn management entangled in dated workflows and inefficient processes. That's why we created Digital Adaptation, a new practical book on how to help senior management understand the Web and adapt the business, culture, team structure and workflows accordingly. No fluff, no theory — just techniques and strategies that worked in practice and showed results. The book will help traditional businesses and organizations to overcome their legacy, and help you plant the seeds of change with very little power. If you do want to finally see changes happening, this is the book to grab.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2014),
    alt: "digital-adaptation-book",
    photos: [photo40, photo41, photo42, photo43],
    # title_photo: "mailing-image-Digital-Adaptation-standing-hardcover-v5-opt1.png",
    # photo1: "mailing-image-Digital-Adaptation-standing-hardcover-v5-opt1.png",
    # photo2: "digital-adaptation-bookcover-01.jpg",
    # photo3: "digital-adaptation-bookcover-02.jpg",
    # photo4: "digital-adaptation-bookcover-03.jpg"
  },
  { name: "Learning Web Design",
    authors: [Author.find_by(first_name: "Jennifer Niederst", last_name: "Robbins")],
    price: 29.85,
    category: Category.find_by(name: "Web design"),
    short_description: "A Beginners Guide to (X)HTML, Style Sheets and Web Graphics",
    description: "The book suggestion of this week is about web design and a little bit of programming. The title of the book is Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics and it's a good introduction to the technologies behind web sites, web apps and mobile web apps. I personally believe every designer that works with web and mobile design should master HTML/CSS/Javascript. It's very important because knowing these technologies will allow you to prototype your designs pretty quickly.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    alt: "html-css-web-book",
    photos: [photo50, photo51, photo52],
    # title_photo: "learning-web-design-a-beginners-guide.png",
    # photo1: "learning-web-design-a-beginners-guide.png",
    # photo2: "book-learningweb-theme1.jpg",
    # photo3: "book-learningweb-theme2.jpg",
    # photo4: "book-learningweb-theme1.jpg"
  },
  { name: "JAVASCRIPT & JQUERY. Interactive front-end web development.",
    authors: [Author.find_by(first_name: "Jon", last_name: "Duckett")],
    price: 42.25,
    category: Category.find_by(name: "Web design"),
    short_description: "A two-book set for web designers and front-end developers.",
    description: "A two-book set for web designers and front-end developers. This two-book set combines the titles HTML & CSS: Designing and Building Web Sites and JavaScript & jQuery: Interactive Front-End Development. Together these two books form an ideal platform for anyone who wants to master HTML and CSS before stepping up to JavaScript and jQuery. HTML & CSS covers structure, text, links, images, tables, forms, useful options, adding style with CSS, fonts, colors, thinking in boxes, styling lists and tables, layouts, grids, and even SEO, Google analytics, ftp, and HTML5. JavaScript & jQuery offers an excellent combined introduction to these two technologies using a clear and simple visual approach using diagrams, infographics, and photographs.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    photos: [photo60, photo61, photo62, photo63],
    alt: "js-jquery-book",
    # title_photo: "javascript-and-jquery-book-cover.png",
    # photo1: "javascript-and-jquery-book-cover.png",
    # photo2: "js_jq2.jpg",
    # photo3: "js_jq1.jpg",
    # photo4: "js_jq4.jpg"
  },
  { name: "Responsive Web Design 2nd edition",
    authors: [Author.find_by(first_name: "Ethan", last_name: "Marcotte")],
    price: 22.20,
    category: Category.find_by(name: "Web design"),
    short_description: "Learn how to think beyond the desktop, and craft designs that respond to your users’ needs",
    description: "Learn how to think beyond the desktop, and craft designs that respond to your users’ needs. In the second edition, Ethan Marcotte expands on the design principles behind fluid grids, flexible images, and media queries. Through new examples and updated facts and figures, you’ll learn how to deliver a quality experience, no matter how large or small the display. Discover new tips and tricks for browser support, take a closer look at solutions for serving images, explore the role of progressive enhancement in web design, find better methods for managing bandwidth, and more. Follow along with the new examples and approaches Ethan has assembled, and dive in to his meticulously revised code samples.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2014),
    photos: [photo70, photo71, photo72, photo73],
    alt: "web-design-book",
    # title_photo: "responsive web design.jpg",
    # photo1: "responsive web design.jpg",
    # photo2: "responsive web design2.jpg",
    # photo3: "responsive web design3.jpg",
    # photo4: "responsive web design1.jpg"
  },
  { name: "Android: Programming for Developers",
    authors: [Author.find_by(first_name: "John", last_name: "Horton")],
    price: 45.50,
    category: Category.find_by(name: "Mobile development"),
    short_description: "Will help you to understand the key concepts of Android programming and develop market-ready applications.",
    description: "Android is the most popular OS in the world. There are millions of devices accessing tens of thousands of applications. It is many people's entry point into the world of technology. The Android: Programming for Developers course will take you on a journey to become an efficient Android programmer by thoroughly understanding the key concepts of Android programming and develop market-ready applications. With a good grasp on the basics, you move on the final module, Mastering Android Game Development. This progressive module will help you learn to use animations and particle systems to provide a rich experience. By the end of the course, you will create beautiful, responsive, and reusable UIs by taking advantage of the Android SDK.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2016),
    photos: [photo80],
    alt: "android-developer-book",
    
    # title_photo: "C06035.jpg",
    # photo1: "C06035.jpg",
    # photo2: "C06035.jpg",
    # photo3: "C06035.jpg",
    # photo4: "C06035.jpg"
  },
  { name: "Android: Programming for Beginners",
    authors: [Author.find_by(first_name: "John", last_name: "Horton")],
    price: 35.20,
    category: Category.find_by(name: "Mobile development"),
    short_description: "Will introduce you to all the fundamental concepts of programming in an Android context, from the Java basics to working with the Android API",
    description: "Android Programming for Beginners will be your companion to create Android applications from scratch—whether you’re looking to start your programming career, make an application for work, be reintroduced to mobile development, or are just looking to program for fun. We will introduce you to all the fundamental concepts of programming in an Android context, from the Java basics to working with the Android API. All examples are created from within Android Studio, the official Android development environment that helps supercharge your application development process. After this crash-course, we’ll dive deeper into Android programming and you’ll learn how to create applications with a professional-standard UI through fragments, make location-aware apps with Google Maps integration, and store your user’s data with SQLite. In addition, you’ll see how to make your apps multilingual, capture images from a device’s camera, and work with graphics, sound, and animations too. By the end of this book, you’ll be ready to start building your own custom applications in Android and Java.",
    dimensions: "H:6.4\" x W: 0.9\" x D: 5.0",
    materials: "Hardcove, glossy paper",
    public_year: Date.new(2015),
    photos: [photo90],
    alt: "android-beginner-book",
    # title_photo: "9781785883262.png",
    # photo1: "9781785883262.png",
    # photo2: "9781785883262.png",
    # photo3: "9781785883262.png",
    # photo4: "9781785883262.png"
  },
]

User.first.reviews.create!(text: "Thank you BookStore, I was very pleased to receive my order for the Moleskine diary so soon after placing the order.",
                        book: Book.all.first, rating: 5)
User.last.reviews.create!(text: "If ‘Get a better job’ had landed on my desk a year ago, I might have been dismissive of it. Instead I was prepared to be open-minded. There have been many occasions where I turned to career books with practical activities to look for some inspiration when developing education activities for learners or assessment.",
                        book: Book.all.first, rating: 3)


Order.create!( user: User.first, discont: '15.00', orders_state: OrdersState.find_by(name: "in_progress"), 
              delivery_methods: "Delivery Next Day!", delivery_cost: "5", cvv: '222', mmyy: '12/23',
              number: "R25314582", total_cost: "40.00", card_number: '1111222233334444', card_name: "John Wood",
              items: [{'book_id': "1", 'price': "10", 'sum': "2"}, {'book_id': "2", 'price': "20", 'sum': "1"}])

Order.create!(user: User.first, discont: '5.00', orders_state: OrdersState.find_by(name: "in_delivery"), 
              delivery_methods: "Delivery Next Day!", delivery_cost: "5", cvv: '222', mmyy: '12/23',
              number: "R25314583", total_cost: "50.00", card_number: '1111222233334444', card_name: "John Wood",
              items: [{book_id: "1", price: "10", sum: "2"}, {book_id: "2", price: "20", sum: "1"}])

Order.create!(user: User.first, discont: '0.00', orders_state: OrdersState.find_by(name: "canceled"), 
              delivery_methods: "Delivery Next Day!", delivery_cost: "5", cvv: '222', mmyy: '12/23',
              number: "R25314584", total_cost: "55.00", card_number: '1111222233334444', card_name: "John Wood",
              items: [{book_id: "1", price: "10", sum: "2"}, {book_id: "2", price: "20", sum: "1"}])


Book.take(3).each{ |book| Newest.create! book: book}
Book.offset(3).take(4).each{ |book| Bestseller.create! book: book}

