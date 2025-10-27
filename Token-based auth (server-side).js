async function authenticatePlugin(token) {
  const response = await fetch("https://yourserver.com/api/authenticate-plugin", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${token}`
    }
  });

  if (!response.ok) {
    throw new Error("Authentication failed");
  }

  const data = await response.json();
  return data.pluginId;
}
