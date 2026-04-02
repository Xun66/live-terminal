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
```

### 🌍 Free Relay Server

A free public relay server is provided at **xebox.org**. It is the easiest way to get started.

**Set the server environment variable (Recommended):**
```bash
export TERMINAL_SERVER_URL=wss://xebox.org/live-term/
```

**Connect as Target (Host machine):**
```bash
# Mode defaults to target if omitted
live-term --id=YOUR_SESSION_ID
```

**Connect as Controller (Remote machine):**
```bash
live-term --mode=controller --id=YOUR_SESSION_ID
```

*(Note: If you prefer not to use environment variables, you can use the `--server` flag in every command: `live-term --server=wss://xebox.org/live-term/ --id=XYZ`)*

### 2. Start your own Relay Server (Optional)
### 3. Connect as Target

If you are using your own server instead of the free one:
```bash
live-term --id=YOUR_ID --server=ws://localhost:8899/live-term/ --allow-insecure
```

## Security

live-term enforces secure connections by default. If you need to use an insecure `ws://` connection (e.g., for local testing), you must pass the `--allow-insecure` flag.

## License

MIT License. See [LICENSE](LICENSE) for details.
