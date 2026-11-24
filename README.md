# komuta-xray-node

Xray VLESS + WebSocket node for the Komuta free tier (PaaS, Germany).

Komuta terminates TLS at its gateway and forwards plain WebSocket to the
container, so the client connects with `wss://<service-domain>/vpn`.

## How it runs on Komuta

- Komuta builds this repo from the `Dockerfile`.
- The service listens on `$PORT` (set by Komuta to the primary port target).
- `UUID` and `WS_PATH` can be overridden as Komuta environment variables
  (mark `UUID` as a Secret). Defaults are baked in for a first deploy.

## Client link (fill in after deploy)

```
vless://<UUID>@<service-domain>:443?encryption=none&security=tls&sni=<service-domain>&fp=chrome&type=ws&path=%2Fvpn&host=<service-domain>#Komuta-DE
```

## Free-tier notes

- 1 free service per organization: 0.1 vCPU / 256 MB RAM, 450 awake hours/month.
- Sleeps after 30 min idle; wakes in ~1 min on first request.
- Keep awake with a heartbeat every ~10 min, or the $3/mo Always-on add-on.
