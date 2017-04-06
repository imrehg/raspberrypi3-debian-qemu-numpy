FROM imrehg/raspberrypi3-debian-qemu

RUN apt-get update && apt-get install dbus

ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

CMD  dbus-send \
  --system \
  --print-reply \
  --reply-timeout=2000 \
  --type=method_call \
  --dest=org.freedesktop.Avahi \
  / \
  org.freedesktop.Avahi.Server.GetHostName \
  && while : ; do echo "Idling..."; sleep 60; done
