function verifySignature(data, signature, publicKey) {
  const encoder = new TextEncoder();
  const encodedData = encoder.encode(data);

  return crypto.subtle.importKey(
    "spki",
    publicKey,
    { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
    false,
    ["verify"]
  ).then(key =>
    crypto.subtle.verify("RSASSA-PKCS1-v1_5", key, signature, encodedData)
  );
}
