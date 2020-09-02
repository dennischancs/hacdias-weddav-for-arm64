# hacdias-webdav-for-arm64
hacdias-webdav-for-arm64 on docker

Use:
```bash
docker run -d \
   --name webdav \
   -p 5240:5240 \
   -v ~/.config/webdav.yaml:/etc/webdav/webdav.yaml \
   -v your_path:your_path \ # for example: `/var/media/ssdDATA:/var/media/ssdDATA`
   --restart=always \
   dennischancs/webdav
```

`webdav.yaml` below, for instance, set `5240` port and `/var/media/ssdDATA` path. 

```yaml
# Server related settings
address: 0.0.0.0
port: 5240
auth: true
tls: false
cert: cert.pem
key: key.pem
prefix: /

# Default user settings (will be merged)
scope: .
modify: true
rules: []

# CORS configuration
cors:
  enabled: true
  credentials: true
  allowed_headers:
    - Depth
  allowed_hosts:
    - http://localhost:8080
  allowed_methods:
    - GET
  exposed_headers:
    - Content-Length
    - Content-Range

users:
  - username: admin
    password: "{bcrypt}$2a$10$Ca.NXQbAdfertypN2VxuSmNiAgfc0ddywLgNkL.SLVCbsPJVTu"
    scope: /var/media/ssdDATA
```

More details: [hacdias/webdav: Simple Go WebDAV server.](https://github.com/hacdias/webdav)