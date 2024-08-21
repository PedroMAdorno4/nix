import hyprland from "./hyprland.ts";
const network = await Service.import("network");
const mpris = await Service.import("mpris");
const audio = await Service.import("audio");
const systemtray = await Service.import("systemtray");

const date = Variable("", {
  poll: [1000, 'date "+%H:%M, %a %e"'],
});

const divide = ([total, free]) => free / total;

const cpu = Variable(0, {
  poll: [
    10000,
    "top -b -n 1",
    (out) =>
      divide([
        100,
        out
          .split("\n")
          .find((line) => line.includes("Cpu(s)"))
          .split(/\s+/)[1]
          .replace(",", "."),
      ]),
  ],
});

const memory = Variable(0, {
  poll: [
    10000,
    "free -m",
    (out) =>
      Number(
        out
          .split("\n")
          .find((line) => line.includes("Mem:"))
          .split(/\s+/)[2],
      ) / 1000,
  ],
});

function Workspaces(currentMonitorID: number) {
  const workspaces = Utils.merge(
    [hyprland.bind("workspaces"), hyprland.active.workspace.bind("id")],
    (ws, activeId) =>
      ws
        .filter(
          ({ monitorID, windows, id }) =>
            monitorID === currentMonitorID && (windows > 0 || activeId === id),
        )
        .map(({ id }) =>
          Widget.Box({
            class_name: `workspace-${activeId === id ? "focused" : "unfocused"}`,
            vertical: true,
            children: [
              Widget.Button({
                on_clicked: () =>
                  hyprland.messageAsync(`dispatch workspace ${id}`),
                child: Widget.Label(`${id}`),
              }),
              Widget.Separator({
                class_name: "workspace-indicator",
              }),
            ],
          }),
        ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
}

function Cpu() {
  return Widget.Label({
    class_name: "cpu",
    label: cpu.bind().as((cpu) => `󰍛 ${(cpu * 100).toFixed(1)}%`),
  });
}

function Memory() {
  return Widget.Label({
    class_name: "memory",
    label: memory.bind().as((memory) => `󰾅 ${memory.toFixed(1)}G`),
  });
}

function Media() {
  const label = Utils.watch(
    "Nothing is playing",
    mpris,
    "player-changed",
    () => {
      const player = mpris.getPlayer("ncspot");
      if (player) {
        const { track_artists, track_title } = player;
        return `${track_artists.join(", ")} - ${track_title}`;
      } else {
        return "Nothing is playing";
      }
    },
  );

  const button = Widget.Button({
    on_primary_click: () => mpris.getPlayer("ncspot")?.playPause(),
    on_scroll_up: () => mpris.getPlayer("ncspot")?.next(),
    on_scroll_down: () => mpris.getPlayer("ncspot")?.previous(),
    child: Widget.Label({ label }),
  });

  const icon = Widget.Icon({
    icon: Utils.watch(
      "media-playback-stop-symbolic",
      mpris,
      "player-changed",
      () => {
        const player = mpris.getPlayer("ncspot");
        if (player) {
          const { play_back_status } = player;
          return play_back_status === "Playing"
            ? "media-playback-pause-symbolic"
            : "media-playback-start-symbolic";
        } else {
          return "media-playback-stop-symbolic";
        }
      },
    ),
  });

  return Widget.Box({
    class_name: "media",
    children: [icon, button],
  });
}

function Microphone() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.microphone.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find(
          (threshold) => threshold <= audio.microphone.volume * 100,
        );

    return `microphone-sensitivity-${icons[icon ?? 0]}-symbolic`;
  }

  function getLabel() {
    return audio.microphone.is_muted
      ? " muted"
      : ` ${Math.floor(audio.microphone.volume * 100)}%`;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.microphone, getIcon),
  });

  const label = Widget.Label({
    label: Utils.watch(getLabel(), audio.microphone, getLabel),
  });

  return Widget.Box({
    class_name: "volume",
    children: [icon, label],
  });
}

function Volume() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.speaker.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find(
          (threshold) => threshold <= audio.speaker.volume * 100,
        );

    return `audio-volume-${icons[icon ?? 0]}-symbolic`;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
  });

  const volume = audio.speaker
    .bind("volume")
    .as((v) => ` ${Math.floor(v * 100)}%`);

  return Widget.Box({
    class_name: "volume",
    children: [icon, Widget.Label({ label: volume })],
  });
}

const WifiIndicator = () =>
  Widget.Box({
    class_name: "network",
    children: [
      Widget.Icon({
        icon: network.wifi.bind("icon_name"),
      }),
      Widget.Label({
        label: network.wifi.bind("ssid").as((ssid) => ssid || "Unknown"),
      }),
    ],
  });

const SysTray = () => {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon") }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
    className: "systemtray",
  });
};

// layout of the bar
function Left(monitor: number) {
  return Widget.Box({
    spacing: 8,
    children: [Workspaces(monitor), Cpu(), Memory()],
  });
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [Media()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [Microphone(), Volume(), Clock(), SysTray()],
  });
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
    class_name: "bar",
    monitor,
    margins: [8, 8, 0, 8],
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Left(monitor),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
}

App.config({
  style: "./style.css",
  windows: [Bar(0), Bar(1)],
});

export {};
