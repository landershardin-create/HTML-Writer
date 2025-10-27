const socket = new WebSocket("wss://yourserver.com");
let heartbeat;

socket.onopen = () => {
  heartbeat = setInterval(() => socket.send("ping"), 30000);
};

socket.onclose = () => {
  clearInterval(heartbeat);
  setTimeout(() => reconnect(), 5000);
};

function reconnect() {
  // Reconnect logic here
}
