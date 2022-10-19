FROM linuxserver/code-server
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install vim nginx inotify-tools --yes

COPY ./context /

RUN chmod -R o+r /var/log/nginx
RUN chmod -R o+rw /etc/nginx/vhosts/
RUN chmod -R o+rw /tests/

ADD https://ahmadalli.gallery.vsassets.io/_apis/public/gallery/publisher/ahmadalli/extension/vscode-nginx-conf/0.1.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage /vsix/nginx-conf.vsix
ADD https://spmeesseman.gallery.vsassets.io/_apis/public/gallery/publisher/spmeesseman/extension/vscode-taskexplorer/2.9.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage /vsix/taskexplorer.vsix
ADD https://berublan.gallery.vsassets.io/_apis/public/gallery/publisher/berublan/extension/vscode-log-viewer/0.13.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage /vsix/log-viewer.vsix

RUN /app/code-server/bin/code-server \
    --install-extension /vsix/nginx-conf.vsix \
    --install-extension /vsix/taskexplorer.vsix \
    --install-extension /vsix/log-viewer.vsix \
    --extensions-dir /config/extensions

EXPOSE 8443