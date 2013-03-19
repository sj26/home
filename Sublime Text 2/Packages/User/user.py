import sublime_plugin
import inflection

class SaveAndCloseCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("save")
        self.window.run_command("close")

class CamelizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.camelize(self.view.substr(region)))

class DasherizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.dasherize(self.view.substr(region)))

class HumanizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.humanize(self.view.substr(region)))

class OrdinalizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.ordinalize(self.view.substr(region)))

class ParameterizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.parameterize(self.view.substr(region)))

class PluralizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.pluralize(self.view.substr(region)))

class SingularizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.singularize(self.view.substr(region)))

class TitleizeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.titleize(self.view.substr(region)))

class TransliterateCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.transliterate(self.view.substr(region)))

class UnderscoreCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            self.view.replace(edit, region, inflection.underscore(self.view.substr(region)))
