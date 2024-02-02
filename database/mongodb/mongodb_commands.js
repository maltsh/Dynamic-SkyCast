// database/mongodb/mongodb_commands.js

// Connect to MongoDB server
const MongoClient = require('mongodb').MongoClient;
const uri = "mongodb+srv://your-username:your-password@your-cluster.mongodb.net/your-database?retryWrites=true&w=majority";

MongoClient.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true }, (err, client) => {
  if (err) {
    console.error('Error connecting to MongoDB:', err);
    return;
  }

  console.log('Connected to MongoDB server');

  // Get the database
  const database = client.db('your-database');

  // Define your MongoDB commands here
  // For example:
  const collection = database.collection('weatherData');
  
  // Insert a document
  collection.insertOne({
    location: 'Example City',
    humidity: 70,
    clearSky: true,
    speed: 10,
    date: new Date()
  }, (err, result) => {
    if (err) {
      console.error('Error inserting document:', err);
    } else {
      console.log('Document inserted successfully:', result.insertedId);
    }

    // Close the MongoDB connection
    client.close();
  });
});
