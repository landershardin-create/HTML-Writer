// Client-side prediction
let predictedPosition = currentPosition + velocity * deltaTime;

// Server reconciliation
socket.on('serverUpdate', (serverPosition) => {
  const error = serverPosition - predictedPosition;
  predictedPosition += error * 0.5; // Smooth correction
});
