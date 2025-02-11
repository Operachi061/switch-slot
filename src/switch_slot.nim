import owlkettle, owlkettle/[adw], osproc, strutils

let slot = execProcess("qbootctl -c | awk '{print $3}'").replace("\n", "")

viewable App:
    discard

method view(app: AppState): Widget =
    result = gui:
        Window():
            defaultSize = (400, 700)

            HeaderBar {.addTitlebar.}:
                WindowTitle {.addTitle.}:
                    title = "Switch Slot"

            StatusPage():
                if slot == "_a":
                    title = "Current slot is A"
                elif slot == "_b":
                    title = "Current slot is B"

                Box:
                  if slot == "_a":
                        Button {.hAlign: AlignCenter, vAlign: AlignCenter.}:
                            style = [ButtonPill, ButtonSuggested]
                            text = "Switch to B"
                            proc clicked() =
                              discard execCmd("qbootctl -s b; reboot")
                  elif slot == "_b":
                        Button {.hAlign: AlignCenter, vAlign: AlignCenter.}:
                            style = [ButtonPill, ButtonSuggested]
                            text = "Switch to A"
                            proc clicked() =
                              discard execCmd("qbootctl -s a; reboot")

adw.brew(gui(App()))
