import subprocess, pathlib

cmd = subprocess.run

def install_extensions():
    EXT_FILE = 'extensions.txt'
    with open(EXT_FILE, 'r') as f:
        exts = f.read().splitlines()
    for ext in exts:
        cmd(['code', '--install-extension', ext])

def move_settings():
    SETTINGS_FILE = 'settings.json'
    KEYBINDINGS_FILE = 'keybindings.json'
    SETTINGS_DIR = str(pathlib.Path.home()) + '/.config/Code/User/'
    
    cmd(['cp', SETTINGS_FILE, SETTINGS_DIR + "settings.json"])
    cmd(['cp', KEYBINDINGS_FILE, SETTINGS_DIR + "keybindings.json"])

def main():
    install_extensions()
    move_settings()

if __name__ == '__main__':
    main()