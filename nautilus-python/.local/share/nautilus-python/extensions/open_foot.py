import os
import urllib.parse
from gi.repository import Nautilus, GObject

class FootExtension(GObject.GObject, Nautilus.MenuProvider):
    def open_foot(self, menu, file):
        filepath = urllib.parse.unquote(file.get_uri()[7:])
        os.system(f"foot -D '{filepath}' &")

    def get_file_items(self, *args):
        files = args[-1]
        if len(files) != 1 or not files[0].is_directory():
            return []

        item = Nautilus.MenuItem(
            name='NautilusPython::OpenFoot',
            label='Open Foot here',
            tip='Open Foot terminal in this directory'
        )
        item.connect('activate', self.open_foot, files[0])
        return [item]

    def get_background_items(self, *args):
        folder = args[-1]
        item = Nautilus.MenuItem(
            name='NautilusPython::OpenFootBg',
            label='Open Foot here',
            tip='Open Foot terminal in this directory'
        )
        item.connect('activate', self.open_foot, folder)
        return [item]
