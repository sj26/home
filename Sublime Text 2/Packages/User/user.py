import sublime_plugin

class SaveAndCloseCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("save")
        self.window.run_command("close")
