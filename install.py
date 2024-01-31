#!/usr/bin/python

import os
import datetime
import shutil

CWD = os.getcwd()
TIMESTAMP = datetime.datetime.now().isoformat()
BACKUP_DIR = CWD+"/Backups/"+TIMESTAMP
HOME = os.environ["HOME"]


def backupFile(path: str):
    if not os.path.exists(path):
        return

    filename = path.split("/").pop()
    reldir = path.split(filename)[0].split(HOME)[1]
    newFileDir = os.path.join(BACKUP_DIR+reldir)

    os.makedirs(newFileDir, exist_ok = True)
    shutil.move(path, os.path.join(newFileDir+filename))



def backupTopic(topic: str):
    topicPath = CWD+"/"+topic

    w = os.walk(topicPath)

    for root, _, files in w:
        for filename in files:
            original = os.path.join(root, filename) \
                .replace(topicPath, HOME)

            backupFile(original)



def installFile(root: str, path: str):
    filename = path.split("/").pop()
    reldir = path.split(filename)[0].split(root)[1]
    newFileDir = os.path.join(HOME, reldir)

    os.makedirs(newFileDir, exist_ok = True)
    os.symlink(path, os.path.join(newFileDir, filename))



def installTopic(topic: str):
    topicPath = CWD+"/"+topic

    w = os.walk(topicPath)

    for root, _, files in w:
        for filename in files:
            filepath = os.path.join(root, filename)
            installFile(topicPath, filepath)



def main():
    if not CWD.endswith("Rice"):
        raise Exception("Please run this script from the Rice root directory.")

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





if __name__ == '__main__':
    main()
