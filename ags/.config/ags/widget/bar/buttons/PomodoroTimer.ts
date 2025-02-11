import PanelButton from "../PanelButton"
import pomodoro from "service/pomodoro"
import icons from "lib/icons"

export default () =>
  PanelButton({
    class_name: "pomodoro",
    on_clicked: () => {
      pomodoro.reset()
    },
    on_secondary_click: () => pomodoro.reset(),
    on_middle_click: () => pomodoro.mute(),
    on_scroll_up: () => pomodoro.adjustTimer(60 * 1000),
    on_scroll_down: () => pomodoro.adjustTimer(-60 * 1000),
    child: Widget.Box({
      children: [
        Widget.Icon(icons.ui.time),
        Widget.Label({
          label: pomodoro.bind("timer").as((time) => {
            const sec = (time / 1000) % 60
            const min = Math.floor(time / 1000 / 60)
            return `${min}:${sec < 10 ? "0" + sec : sec}`
          }),
        }),
      ],
    }),
  })
