# Radarr-collections
```
docker create \
  --name=radarr-collections \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e args=CHANGE_ME \ 
  si0972/radarr-collections
```

For the args environment variable, you set the arguments you want to pass to the script.
These can be found [here](https://github.com/RhinoRhys/radarr-collections/tree/master#options)

For the rcm.conf set the `path` to `config`