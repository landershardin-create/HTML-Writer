extensionAPI.runtime.onInstalled.addListener(() => {
  extensionAPI.storage.local.get("authToken", async (data) => {
    if (!data.authToken) {
      const token = await fetchTokenFromServer();
      extensionAPI.storage.local.set({ authToken: token });
    }
  });
});

async function fetchTokenFromServer() {
  const response = await fetch("https://your-auth-server.com/api/token", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ extensionId: extensionAPI.runtime.id })
  });
  const result = await response.json();
  return result.token;
}
