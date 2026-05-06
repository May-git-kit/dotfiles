import os
import urllib.parse
from gi.repository import Nautilus, GObject

class MicroExtension(GObject.GObject, Nautilus.MenuProvider):
    def open_micro(self, menu, file):
        filepath = urllib.parse.unquote(file.get_uri()[7:])
        os.system(f"foot -e micro '{filepath}' &")

    def get_file_items(self, *args):
        files = args[-1]
        if len(files) != 1 or files[0].is_directory():
            return []

        item = Nautilus.MenuItem(
            name='NautilusPython::OpenMicro',
            label='Open in Micro',
            tip='Open this file in Micro editor via Foot'
        )
        item.connect('activate', self.open_micro, files[0])
        return [item]
