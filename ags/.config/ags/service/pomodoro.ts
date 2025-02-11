import GLib from "gi://GLib"
import { sh } from "lib/utils"
class Pomodoro extends Service {
  static {
    Service.register(
      this,
      {},
      {
        timer: ["int"],
        isRunning: ["boolean"],
      }
    )
  }

  timer = 0
  isRunning = false
  #interval = 0

  async resume() {
    this.isRunning = true

    this.#interval = Utils.interval(1000, () => {
      this.timer -= 1000
      this.changed("timer")

      if (this.timer <= 0) {
        this.stop()
      }
    })
  }

  async pause() {
    GLib.source_remove(this.#interval)
  }

  async stop(notify = true) {
    this.isRunning = false
    this.changed("isRunning")
    this.timer = 0
    this.changed("timer")
    GLib.source_remove(this.#interval)

    if (notify) {
      Utils.notify({
        summary: "Pomodoro Done",
        body: "Finished pomodoro timer",
        actions: {
          dismiss: () => {
            this.mute()
          },
        },
        actionIcons: true,
      })

      sh("ffplay -nodisp -autoexit /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga")
    }
  }

  async mute() {
    sh("pkill ffplay")
  }

  async adjustTimer(value: number) {
    this.pause()
    this.timer += value
    this.changed("timer")
    this.resume()
  }

  async reset() {
    if (this.isRunning) {
      this.stop(false)
    } else {
      this.timer = 60 * 60 * 1000
      this.changed("timer")
      this.resume()
    }
  }
}

const pomodoro = new Pomodoro()
Object.assign(globalThis, { pomodoro })
export default pomodoro
