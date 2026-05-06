import os
import urllib.parse
from gi.repository import Nautilus, GObject

class NautilusToolsExtension(GObject.GObject, Nautilus.MenuProvider):
    def open_foot(self, menu, file):
        filepath = urllib.parse.unquote(file.get_uri()[7:])
        os.system(f"foot --directory='{filepath}' &")

    def open_micro(self, menu, file):
        filepath = urllib.parse.unquote(file.get_uri()[7:])
        os.system(f"foot -e micro '{filepath}' &")

    def get_file_items(self, *args):
        files = args[-1]
        if len(files) != 1:
            return []

        file = files[0]
        items = []

        # "Open Foot here" for directories
        if file.is_directory():
            item_foot = Nautilus.MenuItem(
                name='NautilusPython::OpenFoot',
                label='Open Foot here',
                tip='Open Foot terminal in this directory'
            )
            item_foot.connect('activate', self.open_foot, file)
            items.append(item_foot)

        # "Open in Micro" for files
        else:
            item_micro = Nautilus.MenuItem(
                name='NautilusPython::OpenMicro',
                label='Open in Micro',
                tip='Open this file in Micro editor via Foot'
            )
            item_micro.connect('activate', self.open_micro, file)
            items.append(item_micro)

        return items

    # This handles right-clicking the empty background of a folder
    def get_background_items(self, *args):
        folder = args[-1]
        item_foot = Nautilus.MenuItem(
            name='NautilusPython::OpenFootBg',
            label='Open Foot here',
            tip='Open Foot terminal in this directory'
        )
        item_foot.connect('activate', self.open_foot, folder)
        return [item_foot]
