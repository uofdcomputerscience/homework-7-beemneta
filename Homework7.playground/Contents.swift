import Foundation

// For this homework project, we'll be connecting to the "TLDR" server
// to add a few books. The first thing you need to do is create an object
// that we'll upload to the server.

// MARK: - STEP ONE

// Implement a struct that defines a book. A book consists of the following
// items:
// A title, which is a string
// An author, which is a string
// The publication year, as a string (because dates are hard)
// A string for the URL for an image for the book cover
//
// Remember that this structure needs to conform to the `Encodable` protocol.
// Using `Codable` more generally will be useful, as by doing this you'll
// be able to reuse this struct in Project Three.
struct Book: Codable {
    let id: Int?
    let title: String
    let author: String
    let published: String
    let imageURLString: String
}

// MARK: - STEP TWO

// Once you've defined this structure, you'll need to define a couple of
// book objects that you can insert into the database. In order or us to
// have an amusing dataset to work with, each student is requested to
// create five different books for this database.
let bookone = Book (id:nil,title:"The Last Lecture", author: "Randy Pausch", published: "2008", imageURLString: "https://upload.wikimedia.org/wikipedia/en/1/18/The_Last_Lecture_%28book_cover%29.jpg")
let booktwo = Book (id:nil,title: "A Christmas Carol", author: "Charles Dickens", published: "1843", imageURLString: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Charles_Dickens-A_Christmas_Carol-Cloth-First_Edition_1843.jpg/800px-Charles_Dickens-A_Christmas_Carol-Cloth-First_Edition_1843.jpg")
let bookthree = Book (id:nil,title: "The Herb Book", author: "John Lust", published: "1974", imageURLString: "https://d2h1pu99sxkfvn.cloudfront.net/b0/3517278/429209217_NCpE35gwa1/P0.jpg")
let bookfour = Book (id:nil,title: "Technopoly", author: "Neil Postman", published: "1992", imageURLString: "https://upload.wikimedia.org/wikipedia/en/5/58/Technopoly_The_Surrender_of_Culture_to_Technology.jpg")
let bookfive = Book (id:nil,title: "Disgrace", author: "John Maxwell Coetzee", published: "1999", imageURLString: "https://upload.wikimedia.org/wikipedia/en/3/3d/JMCoetzee_Disgrace.jpg")


// MARK: - STEP THREE

// Now we need to publish this data to the server.

// Create a URL to connect to the server. Its address is:
//      https://uofd-tldrserver-develop.vapor.cloud/books

// Create a URL request to publish the information, based upon the URL you
// just created.

// Add the body to the URL request you just created, by using JSONEncoder.

// Add a "Content-Type" : "application/json" header to your request, so that
// the server will properly understand the body of your request.

// Set the method of the request to "POST", because we're providing information
// rather than retrieving it.

// Create a data task for publishing this element, and kick it off with a resume().

let urlString = "https://uofd-tldrserver-develop.vapor.cloud/books"
let url = URL(string: urlString)!

func postBook (book: Book){
var request = URLRequest(url: url)
request.httpBody = try? JSONEncoder().encode(book)
request.addValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpMethod = "POST"

let task = URLSession(configuration: .ephemeral).dataTask(with: request)
task.resume()
}

let bookarray = [bookone,booktwo,bookthree,bookfour,bookfive]

for book in bookarray {
    postBook(book: book)
}

// MARK: - HELPFUL HINTS
// You might want to create a method for publishing the data, so that you
// can effectively loop over an array of books.
//
// If you visit the URL for the service in a 'GET' request, it will return a
// list of books to you. We'll be using this list of books for Project Three.

