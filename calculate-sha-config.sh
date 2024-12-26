#!/bin/bash
# Path to the file whose hash you want to compute
FILE_PATH="./config/poster_config.json"

# Compute the SHA-256 hash
HASH=$(sha256sum "$FILE_PATH" | awk '{print $1}')
echo "SHA256 Hash: $HASH"

MANIFEST_PATH="./nitro-espresso.manifest"
HASH="${{ steps.compute_sha256.outputs.sha256 }}"
cat <<EOF >> $MANIFEST_PATH
[[sgx.trusted_files]]
uri = "file:/config/poster_config.json"
sha256 = "$HASH"
EOF