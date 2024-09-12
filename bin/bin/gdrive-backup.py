#!/bin/python3
import os
import logging


hostname = os.uname().nodename
remote_base = "backup/" + hostname

REMOTE = "gdrive"
LOG_FILE = "/home/aaron/tmp/gdrive-backup-rsync.log"
IGNORE_FILE = ".rcloneignore"

DIRS = ["/home/aaron/Documents", "/home/aaron/Pictures", "/home/aaron/Videos"]

logger = logging.getLogger(__name__)


def backup(directory: str):
    logger.info("Backing up " + directory)
    directory_name = os.path.basename(directory)
    remote_loc = os.path.join(remote_base, directory_name)

    command = f"rclone sync -v {directory} {REMOTE}:{remote_loc}"

    ignore_file = os.path.join(directory, IGNORE_FILE)
    if os.path.exists(ignore_file):
        logger.info("excluding files from " + ignore_file)
        command += f" --exclude-from {ignore_file}"
        command += " --delete-excluded"

    command += " --max-size 750M"
    command += f" --log-file={LOG_FILE}"

    logger.info("executing...")
    logger.info(command)
    logger.info("...")
    result = os.system(command)
    if result != 0:
        os.system(
            f"notify-send -u critical 'Google Drive' 'Backup failed for {directory_name}' -i /home/aaron/Documents/gdrive_icon.png"
        )
        return

    os.system(
        f"notify-send 'Google Drive' 'Backup complete for {directory_name}' -i /home/aaron/Documents/gdrive_icon.png"
    )


def main():
    logging.basicConfig(
        format="%(asctime)s %(levelname)-8s %(message)s",
        filename=LOG_FILE,
        level=logging.INFO,
        datefmt="%Y-%m-%d %H:%M:%S",
    )

    if not os.path.exists(LOG_FILE):
        print("creating log file")
        os.system(f"touch {LOG_FILE}")
    elif os.path.getsize(LOG_FILE) > 1_000_000:
        os.system(f"rm {LOG_FILE}")

    for dir in DIRS:
        backup(dir)


main()
