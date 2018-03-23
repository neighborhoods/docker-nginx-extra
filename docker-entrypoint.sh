#!/bin/bash
set -eo pipefail
shopt -s nullglob

TEMPLATE_DIR=/etc/nginx/conf.templates.d
if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "$TEMPLATE_DIR does not exist; skipping template rendering"
    exec "$@"
fi

OLD_IFS="$IFS"
IFS=','
subst_vars=''
for env_var in ${NGINX_TEMPLATE_VARS:-}; do
    subst_vars="${subst_vars} \${$env_var}"
done
IFS="$OLD_IFS"

echo "Will replace these env vars: ${subst_vars}"

for template_path in "$TEMPLATE_DIR"/*.conf; do
    name=$(basename "$template_path")
    conf_path="/etc/nginx/conf.d/$name"
    echo "Rendering template $name"

    envsubst "$subst_vars" < "$template_path" > "$conf_path"
done

exec "$@"
