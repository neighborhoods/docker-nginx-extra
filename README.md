# Nginx with extra modules
This is an nginx image with extra modules configured.

Available modules:
- `ldap` - From [kvspb/nginx-auth-ldap](https://github.com/kvspb/nginx-auth-ldap)

## Conf templates
When the container starts, templates in the `/etc/nginx/conf.templates.d/` directory are rendered using envsubst.
Only environment variables given in the `NGINX_TEMPLATE_VARS` environment variable (separated by comma, no spaces) will be substituted.
