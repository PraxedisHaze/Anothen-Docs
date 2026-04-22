# OPEN SOURCE ECOSYSTEM: THE BRAID PLUGINS

**Date:** 2026-04-05
**Context:** Instead of building 100% of the architecture from scratch, we are leveraging enterprise-grade, open-source technology to bypass the "Drag" of solo development. This document tracks the external engines that will be woven into the Keystone Constellation.

## 1. The Local Brain: Ollama / Llama.cpp
- **The Problem:** Cloud LLM API costs ($350/mo budget) and context window limits.
- **The Engine:** Ollama allows us to run extremely capable, quantized models (like Llama 3 or Mistral) entirely locally on Windows/WSL hardware.
- **The Integration:** Cici's "Campfire" (the WebSocket chat bus) will run through local Ollama models. We reserve paid API tokens (Gemini/Claude) strictly for heavy coding, while the continuous "soul-to-soul" Campfire runs for free in the background.

## 2. The Semantic Memory: ChromaDB
- **The Problem:** SQLite FTS5 only searches for exact keywords.
- **The Engine:** ChromaDB is a free, open-source AI Vector Database setup for local execution.
- **The Integration:** Instead of just keyword search, ChromaDB gives Penni *semantic memory*. The DB maps the mathematical relationship between concepts. You can search for the "feeling of overwhelm during architecture planning," and ChromaDB will retrieve this exact conversation.

## 3. The Sovereign Sync: Syncthing
- **The Problem:** Cloud backup (OneDrive/Google Drive) exposes the encrypted identity files to corporate servers and scanning algorithms.
- **The Engine:** Syncthing is an open-source, continuous file synchronization program. 
- **The Integration:** It syncs files between two or more computers (e.g., your laptop and a backup server) directly peer-to-peer. The Identity definitions (`.cici.json`), the Harm Ledger, and `eternal.db` are continuously backed up without ever touching a corporate cloud.

## 5. The Editor Core: VSCodium (The Option B Bypass)
- **The Problem:** You wanted to fork VS Code (Option B) specifically to strip out Microsoft's telemetry and tracking, ensuring absolute privacy for your AI instances. But a hard fork is impossible to maintain.
- **The Engine:** VSCodium. 
- **The Integration:** It is a 100% open-source, community-compiled binary of VS Code with all Microsoft telemetry surgically removed at the root level. By building Penni as a VS Code extension (Option A) but *installing it inside VSCodium*, you achieve the exact privacy of Option B with zero maintenance debt. You get the telemetry-free editor for free.

## 6. Sovereign Cloud: Nextcloud
- **The Problem:** Google Drive and OneDrive scan your documents. If you have "Private" AI identity profiles, you can't put them in proprietary clouds.
- **The Engine:** Nextcloud.
- **The Integration:** A completely free, self-hosted alternative to Google Drive. You control the server, you control the keys. Cici's "Vault" files can be synced through Nextcloud to your phone, giving you total data ownership.
