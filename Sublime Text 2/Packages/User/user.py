import sublime
import sublime_plugin
import inflection

class SaveAndCloseCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("save")
        self.window.run_command("close")

class CycleQuotesCommand(sublime_plugin.TextCommand):
    # Pairs of quote styles
    styles = dict(
      single=("'", "'"),
      double=('"', '"'),
    )

    # Make sure we have an immutable ordered list of quote styles
    style_keys = styles.keys()

    def run(self, edit):
        for region in self.view.sel():
            # We don't want reversed regions, so left/right pairs are matched correctly
            if region.a > region.b:
                region = sublime.Region(region.b, region.a)

            # Examine to scopes to make sure we're in a quoted string
            scopes = self.view.scope_name(region.a).split()
            while scopes and not scopes[-1].startswith("string.quoted."):
                scopes.pop()
            if not scopes:
                continue

            # Figure out which type of quotes we're looking for
            style = scopes[-1].split(".")[2]
            if style not in CycleQuotesCommand.styles:
                continue
            opening, closing = CycleQuotesCommand.styles[style]

            # Search for the opening and closing quotes, as neccessary
            while (region.a == region.b or self.view.substr(region.a) != opening) and self.view.scope_name(region.a - 1).split()[:len(scopes)] == scopes:
                region = sublime.Region(region.a - 1, region.b)
            while (region.a == region.b or self.view.substr(region.b) != closing) and self.view.scope_name(region.b + 1).split()[:len(scopes)] == scopes:
                region = sublime.Region(region.a, region.b + 1)

            # Find the new style
            new_style_index = CycleQuotesCommand.style_keys.index(style) + 1
            new_style_index %= len(CycleQuotesCommand.style_keys)
            new_style = CycleQuotesCommand.style_keys[new_style_index]
            new_opening, new_closing = CycleQuotesCommand.styles[new_style]

            # TODO: (Un)Escape as neccessary

            # Substitute them in
            self.view.replace(edit, sublime.Region(region.a, region.a + 1), new_opening)
            self.view.replace(edit, sublime.Region(region.b, region.b + 1), new_closing)

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
