#!/usr/bin/python

import os
import datetime
import shutil
from pathlib import Path

CWD = os.getcwd()
TIMESTAMP = datetime.datetime.now().isoformat()
BACKUP_DIR = CWD+"/Backups/"+TIMESTAMP
HOME = "/home/"+CWD.split("/home/")[1].split("/")[0]

def backupEntry(to_copy: str, dest: str):
    print(f"Backing up entry {to_copy}")

    path = Path(to_copy)
    if not path.exists():
        print("Not Found")

    if path.is_file():
        shutil.copy(to_copy, dest)
    elif path.is_dir():
        shutil.copytree(to_copy, dest, ignore_dangling_symlinks=True)


def backupTopic(topic: str, dest: str):
    print(f"Backing up topic {topic}")

    topicPath = CWD+"/Configs/"+topic
    backupPath = BACKUP_DIR+"/"+topic
    os.makedirs(backupPath, exist_ok=True)
    w = os.scandir(topicPath)

    for d in w:
        backupEntry(dest + "/" + d.name, backupPath + "/" + d.name)


def installEntry(to_link: str, src: str):
    print(f"Creating symlink {to_link} -> {src}")

    path = Path(to_link)
    if path.is_file() or path.is_symlink():
        os.remove(to_link)
    elif path.is_dir(follow_symlinks=False):
        shutil.rmtree(to_link)

    os.symlink(src, to_link, target_is_directory=Path(src).is_dir())


def installTopic(topic: str, dest: str):
    print(f"Installing topic {topic}")

    topicPath = CWD+"/Configs/"+topic
    os.makedirs(dest, exist_ok=True)
    w = os.scandir(topicPath)

    for d in w:
        installEntry(dest + "/" + d.name, topicPath + "/" + d.name);


def main():
    if not CWD.endswith("dotfiles"):
        raise Exception("Please run this script from the Rice root directory.")

    print("CWD: "+CWD)
    print("HOME: "+HOME)

    topics = {
        "home": HOME,
        ".config": HOME+"/.config",
        "nixos": HOME+"/nixos"
    }

    while True:
        res = input("Proceed? [y/n]: ")
        if res == "y":
            break
        elif res == "n":
            return

    try:
        for t,dest in topics.items():
            backupTopic(t,dest)
    except Exception as err:
        print("Error ocurred while backing up, aborting..")
        raise err

    try:
        for t,dest in topics.items():
            installTopic(t,dest)
    except Exception as err:
        print("Error occured while installing rice, aborting..")
        raise err

    os.makedirs(f"{HOME}/Pictures/Screenshots", exist_ok=True)
    open(f"{HOME}/.localconfigs", mode='a').close()

    print("\nInstallation was Successful")


if __name__ == '__main__':
    main()
