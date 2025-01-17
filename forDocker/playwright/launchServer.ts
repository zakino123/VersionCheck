const playwright = require("playwright");

option = {
    headless: true,
    // FIX: Use ENV variable to set the port
    // see .env file. The port is set on .env file
    port: 4545,
    wsPath: "ws",
};
playwright.chromium.launchServer(option).then((server) => {
    console.log(server.wsEndpoint());
});
