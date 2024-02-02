// web_development/node_app/server.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.static('web_development'));

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
