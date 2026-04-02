# live-term

**live-term** is a terminal bidirectional End-to-End Encrypted (E2EE) remote sync tool. It allows two terminal instances (a "target" and a "controller") to securely communicate through a relay server.

## Features

- **E2EE Security**: All terminal data is encrypted using AES-256-GCM before leaving the client.
- **Bidirectional Sync**: Real-time synchronization of terminal input and output.
- **Relay Server**: Simple Node.js relay server for session handling.
- **Docker Support**: Easy deployment of the relay server using Docker.

## Project Note

This project was developed with significant assistance from **AI (Gemini CLI)**. The AI assisted in architecting the E2EE envelope, implementing the relay logic, and refining the Docker configuration.

## Getting Started

### 1. Install via NPM

```bash
# Install globally
npm install -g @xun66/live-term

# Run the client
live-term --mode=target --id=YOUR_SESSION_ID
```

### 2. Start the Relay Server

You can run your own relay server locally or using Docker.

**Locally:**
```bash
# Default path: /live-term/
live-term-server --port 8899
```

**Docker:**
```bash
docker build -t live-term-relay .
docker run -p 8899:8899 -e API_BASE=/live-term/ live-term-relay
```

### 🌍 Free Relay Server

A free public relay server is provided at **xebox.org**. If you want to use it instead of hosting your own, you can specify its address as your server:

**Connect to the free server:**
```bash
# Target mode
live-term --mode=target --id=YOUR_ID --server=wss://xebox.org/live-term/

# Controller mode
live-term --mode=controller --id=YOUR_ID --server=wss://xebox.org/live-term/
```
*(Note: If you don't specify a server, it defaults to `ws://127.0.0.1:8899/live-term/`)*

### 3. Connect as Target

On the machine you want to control:
```bash
node client/main.js --mode=target --id=YOUR_SESSION_ID
```

### 4. Connect as Controller

On the machine you are controlling from:
```bash
node client/main.js --mode=controller --id=YOUR_SESSION_ID
```

## Security

live-term enforces secure connections by default. If you need to use an insecure `ws://` connection (e.g., for local testing), you must pass the `--allow-insecure` flag.

## License

MIT License. See [LICENSE](LICENSE) for details.
