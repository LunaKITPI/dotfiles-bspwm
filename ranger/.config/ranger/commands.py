#!/usr/bin/env python3

from ranger.api.commands import Command

class extracthere(Command):
    def execute(self):
        import os
        from ranger.core.loader import CommandLoader

        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        def refresh(_):
            cwd.load_content()

        au_flags = ['-xvzf']
        uz_flags = ['-d']
        unrar_flags = ['x']

        if not marked_files:
            return

        for f in marked_files:
            descr = "Extracting: " + os.path.basename(f.path)
            command = []

            if f.path.endswith('.tar.gz') or f.path.endswith('.tgz'):
                command = ['tar'] + au_flags + [f.path]
            elif f.path.endswith('.zip'):
                command = ['unzip'] + uz_flags + [f.path]
            elif f.path.endswith('.rar'):
                command = ['unrar'] + unrar_flags + [f.path]
            elif f.path.endswith('.7z'):
                command = ['7z', 'x', f.path]
            else:
                self.fm.notify("Unknown file type: " + f.path, bad=True)
                return

            obj = CommandLoader(args=command, descr=descr)
            obj.signal_bind('after', refresh)
            self.fm.loader.add(obj)
