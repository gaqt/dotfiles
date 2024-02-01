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

    filename = path.split("/").pop()
    reldir = path.split(filename)[0].split(HOME)[1][:-1]
    newFileDir = HOME+reldir

    print("Backing up file {path} to {newFileDir}")

    os.makedirs(newFileDir, exist_ok = True)
    shutil.move(path, f"{newFileDir}/{filename}")



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
    reldir = path.split(filename)[0].split(root)[1][:-1]
    newFileDir = HOME+reldir

    print(f"Creating symlink on {filename} on dir {newFileDir}")

    os.makedirs(newFileDir, exist_ok = True)
    os.symlink(path, f"{newFileDir}/{filename}")



def installTopic(topic: str):
    topicPath = CWD+"/"+topic

    print(f"Installing topic {topic}")

    w = os.walk(topicPath)

    for root, _, files in w:
        for filename in files:
            filepath = (f"{root}/{filename}")
            installFile(topicPath, filepath)



def main():
    if not CWD.endswith("Rice"):
        raise Exception("Please run this script from the Rice root directory.")

    print("CWD: "+CWD)
    print("HOME: "+HOME)

    while True:
        res = input("Proceed? [y/n]: ")
        if res == "y":
            break
        elif res == "n":
            return

    if not os.path.exists(CWD+"/Backups"):
        os.mkdir(CWD+"/Backups")

    try:
        backupTopic("Assets")
        backupTopic("Configs")
        backupTopic("Scripts")
    except Exception as err:
        print("Error ocurred while backing up, aborting..")
        raise err

    try:
        installTopic("Assets")
        installTopic("Configs")
        installTopic("Scripts")
    except Exception as err:
        print("Error occured while installing rice, aborting..")
        raise err

    print("Installation was Successful")



if __name__ == '__main__':
    main()
