// Express Server
const express = require('express');
const app = express();

// Define config 
const config = getConfiguration();

// Define routes
app.get('/', (req, res) => {
    const response = {
        containerName: config.containerName,
        message: 'Hello World!'
    };

    console.log(`Sending response: ${JSON.stringify(response)}`);
    res.send(response);
});

// health check for consul  
app.get('/health', (req, res) => {
    console.log('Health check pinged');
    res.send('OK');
});

// Start server
app.listen(config.port, () => {
    console.log(`Server listening on port ${config.port}`);
});


// helper function to get configuration
function getConfiguration() {
    const cfg = {};
    cfg.port = process.env.PORT || 3000;
    
    // get container name otherwise use default
    cfg.containerName = process.env.HOSTNAME || 'default';
    return cfg;
}