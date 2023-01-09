// 1) Seeing all the existing database:
// show dbs 

// 2) Switching/Creating a database use <dbname>
// use students

// 3) Seeing the collections in the database
// show collections

// 4) Dropping the table
db.dropDatabase()


// Performing CRUD operations

// STEP 1 creating and entering a database
// use studentInfo

// STEP 2 Creating a collection and inserting values in it
db.studentInfo.insertMany([{studentName:'Soham',studentLname:'Hegde',dob:"24-feb-2001",pincode:400075},
{studentName:'Shri',studentLname:'Shetty',dob:"6-jul-2002",pincode:400045},
{studentName:'Sanjana',studentLname:'Thatikonda',dob:"16-nov-2001",pincode:400086},
{studentName:'Alekya',studentLname:'Nelyapalli',dob:"8-oct-2001",pincode:400095}])

// STEP 3: Performing read operations
// a) Reading all the data in a collection
db.studentInfo.find()

// b) Find info about student whose name is "Soham" or "Sanjana"
db.studentInfo.find({
    $or:[{studentName:"Soham"},
{studentName:"Sanjana"}]
}).pretty()

// c) Count the number of documents who have the pincode 400045

db.studentInfo.countDocuments({pincode:400045})

// Step 4: Perform Update operation
// a) Update Sanjanas birthday to 14-oct-2001
db.studentInfo.updateOne(
{studentName:'Sanjana'},
{$set:{dob:"14-oct-2001"}}
)

// Step 5: Perform Delete Operation
// a) Delete document of student named "Soham"

db.studentInfo.deleteOne({studentName:"Soham"})

// b) Delete all documents with pincode 400086 or 400045

db.studentInfo.deleteMany({$or:[
    {pincode:400086},
    {pincode:400045}
]
})