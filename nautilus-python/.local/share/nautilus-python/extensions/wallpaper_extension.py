import os
from gi.repository import Nautilus, GObject

class WallpaperExtension(GObject.GObject, Nautilus.MenuProvider):
    def set_wallpaper(self, menu, file):
        filepath = file.get_location().get_path()
        os.system(f"awww img '{filepath}' --transition-type center")

    def get_file_items(self, *args):
        files = args[-1]
        if len(files) != 1 or files[0].is_directory():
            return []

        file = files[0]
        if not file.get_mime_type().startswith('image/'):
            return []

        item = Nautilus.MenuItem(
            name='NautilusPython::SetWallpaper',
            label='Set as Wallpaper',
            tip='Set image as wallpaper using swww'
        )
        item.connect('activate', self.set_wallpaper, file)
        return [item]
