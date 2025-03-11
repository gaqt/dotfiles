#!/usr/bin/python

import os
import datetime
import shutil

CWD = os.getcwd()
TIMESTAMP = datetime.datetime.now().isoformat()
BACKUP_DIR = CWD+"/Backups/"+TIMESTAMP
HOME = "/home/"+CWD.split("/home/")[1].split("/")[0]


def backupFile(path: str):
    if not os.path.exists(path):
        return

    if os.path.islink(path) and CWD in os.readlink(path):
        print(f"File {path} is owned symlink, removing..")
        os.remove(path)
        return

    filename = path.split("/").pop()
    reldir = path[:path.rfind(filename)].split(HOME)[1][:-1]
    newFileDir = BACKUP_DIR+reldir
    newPath = f"{newFileDir}/{filename}"

    print(f"Backing up file {path} to {newPath}")

    os.makedirs(newFileDir, exist_ok=True)
    shutil.move(path, f"{newPath}")


def backupTopic(topic: str):
    topicPath = CWD+"/"+topic

    print(f"Backing up topic {topic}")

    w = os.walk(topicPath)

    for root, _, files in w:
        for filename in files:
            original = (f"{root}/{filename}") \
                .replace(topicPath, HOME)

            backupFile(original)


def installFile(root: str, path: str):
    filename = path.split("/").pop()
    reldir = path[:path.rfind(filename)].split(root)[1][:-1]
    newFileDir = HOME+reldir
    newPath = f"{newFileDir}/{filename}"

    print(f"Creating symlink {newPath} -> {path}")

    os.makedirs(newFileDir, exist_ok=True)
    os.symlink(path, newPath)
    os.system(f"chmod +x {newPath}")


def installTopic(topic: str):
    topicPath = CWD+"/"+topic

    print(f"Installing topic {topic}")

    w = os.walk(topicPath)

    for root, _, files in w:
        for filename in files:
            filepath = (f"{root}/{filename}")
            installFile(topicPath, filepath)


def main():
    if not CWD.endswith("dotfiles"):
        raise Exception("Please run this script from the Rice root directory.")

    print("CWD: "+CWD)
    print("HOME: "+HOME)

    while True:
        res = input("Proceed? [y/n]: ")
        if res == "y":
            break
        elif res == "n":
            return

    try:
        # backupTopic("Assets")
        backupTopic("Configs")
        backupTopic("Scripts")
    except Exception as err:
        print("Error ocurred while backing up, aborting..")
        raise err

    try:
        # installTopic("Assets")
        installTopic("Configs")
        installTopic("Scripts")
    except Exception as err:
        print("Error occured while installing rice, aborting..")
        raise err

    os.makedirs(f"{HOME}/Pictures/Screenshots", exist_ok=True)
    open(f"{HOME}/.localconfigs", mode='a').close()

    print("\nInstallation was Successful")


if __name__ == '__main__':
    main()
