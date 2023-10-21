import subprocess
import argparse
from platform import system
import pathlib
from typing import Union

        

'''
Run Command

args:
        args: list of arguments to run
        shell: whether run the arguments with shell (environment) context
return:
        boolean, if the command ran successfuly or not
'''
def run_cmd(args: list[str], shell: bool = False) -> Union[None, str]:
        proc = subprocess.run(args, shell=shell, capture_output=True)

        err_msg = proc.stderr.decode()

        if err_msg != "":
                print(err_msg)
        
        if proc.returncode != 0: return None
        return proc.stdout.decode()

def update_extensions_list():
        # list installed extension
        command = ["code", "--list-extensions"]
        result = run_cmd(command, False)

        if result is None:
                print("[!] Can't update list")
                exit(1)

        extensions = list(map(lambda line : line + "\n", result.splitlines()))

        try:
                with open("./extensions.txt", "w+") as ext_file:
                        ext_file.write("# Add extension here or use the script to update your extension list\n\n")
                        ext_file.writelines(extensions)
                        ext_file.flush()
                        ext_file.close()
                
                print("[+] Updated the extensions.txt")
        except OSError:
                print("[!] Can't find or open the file\n[!] Please make sure you're in the same directory with the script")
                exit(1)

def install_extensions():
        try:
                with open("./extensions.txt", "r") as ext_file:
                        iterator = iter(ext_file.readlines())
                        next(iterator)
                        next(iterator)

                        for ext in iterator:
                                ext = ext.strip()
                                result = run_cmd(["code", "--install-extension", ext], False)
                                if result is None:
                                        print(f"[!] Can't install `{ext}`")

                        print("[+] Extensions installed")
                        
        except OSError:
                print("[!] Can't find or open the file `extensions.txt`\n[!] Please make sure you're in the same directory with the script")
                exit(1)

def action_config(is_update: bool):
        command = ["cp", "-rf"]

        sys = system()

        def op_1():
                nonlocal command

                match sys:
                        case "Darwin":
                                command += [str(pathlib.Path.home()) + "/Library/Application Support/Code/User/settings.json"]
                        case "Linux":
                                command += [str(pathlib.Path.home()) + "/.config/Code/User/settings.json"]

        def op_2():
                nonlocal command
                command += ["./settings.json"]

        if is_update:
                msg = "[+] updated `settings.json`"
                err_msg = "[!] Can't update `settings.json`"

                op_1()
                op_2()
        else:
                msg = "[+] setup `settings.json`"
                err_msg = "[!] Can't setup `settings.json`"

                op_2()
                op_1()

        print(command)
        result = run_cmd(command, False)

        if result is None:
                print(err_msg)
                exit(1)

        print(msg)
        
def main():
        parser = argparse.ArgumentParser("easy_setup")
        parser.add_argument("-u", "--update-extension-list", action="store_true", dest="up_ex_li",
                            help="update extensions.txt with your current installed extension (overwrites)")
        
        parser.add_argument("-i", "--install-extension", action="store_true", dest="in_ex",
                            help="install extensions inside extension.txt")
        
        parser.add_argument("-m", "--move-config", action="store_true", dest="mo_co",
                            help="move `settings.json` into the desired location")
        
        parser.add_argument("-c", "--update-config", action="store_true", dest="up_co",
                            help="update `settings.json`")
        
        parser.add_argument("action", action="store", type=str, help="`setup` to execute setup, `update` to update config")
        
        args = parser.parse_args()

        if args.action == "setup":
                (args.mo_co,  args.in_ex) = (True, True)
                print("[+] Running setup...")

        if args.action == "update":
                (args.up_co,  args.up_ex_li) = (True, True)
                print("[+] Running update...")

        if args.mo_co:
                action_config(False)

        if args.in_ex:
                install_extensions()

        if args.up_ex_li:
                update_extensions_list()

        if args.up_co:
                action_config(True)

if __name__ == "__main__":
        main()