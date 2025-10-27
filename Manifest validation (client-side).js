async function validatePluginManifest(manifestUrl) {
  try {
    const response = await fetch(manifestUrl);
    const manifest = await response.json();

    // Basic checks
    if (!manifest.name || !manifest.version || !manifest.origin) {
      throw new Error("Invalid manifest structure");
    }

    // Check allowed origins
    const allowedOrigins = ["https://trusted-plugin.com"];
    if (!allowedOrigins.includes(manifest.origin)) {
      throw new Error("Untrusted origin");
    }

    return manifest;
  } catch (err) {
    console.error("Manifest validation failed:", err);
    return null;
  }
}
