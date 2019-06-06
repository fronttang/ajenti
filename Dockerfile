FROM algonrey/prp

ENTRYPOINT ["/bin/sh","-c","service ajenti start && /usr/sbin/nginx && /bin/bash"]
