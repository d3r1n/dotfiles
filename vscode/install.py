import subprocess, pathlib

cmd = subprocess.run

# determine OS
OS = None
if cmd(['uname', '-a'], stdout=subprocess.DEVNULL).returncode == 0:
    OS = 'linux'
elif cmd(['systeminfo'], stdout=subprocess.DEVNULL).returncode == 0:
    OS = 'windows'
else:
    raise Exception('Unknown OS')

def install_extensions():
    EXT_FILE = 'extensions.txt'
    with open(EXT_FILE, 'r') as f:
        exts = f.read().splitlines()
    for ext in exts:
        cmd(['code', '--install-extension', ext])

def move_settings():
    SETTINGS_FILE = 'settings.jsonc'
    
    if OS == 'linux':
        SETTINGS_DIR = str(pathlib.Path.home()) + '/.config/Code/User/'
    elif OS == 'windows':
        SETTINGS_DIR = '%APPDATA%\\Code\\User\\'
    
    cmd(['cp', SETTINGS_FILE, SETTINGS_DIR + "settings.json"])

def main():
    install_extensions()
    move_settings()

if __name__ == '__main__':
    main()