# Mount Onedrive on Linux

- install rclone
- rclone config
    - (n) new remote
    - name: onedrive
    - Storage 22 | "onedrive"
    - no client id
    - no secret
    - no advanced config
    - (y) autoconfig
        - sign in to microsoft account
    - (1) Onedrive Personal
    - (0) specify drive
    - (y) yes this is ok
    - (y) yes this is ok
    - (q) quit config
- create "onedrive" in home folder (case sensitive)

- rclone --vfs-cache-mode writes mount onedrive: ~/onedrive

- Add to startup applications
    - Name: Mount Onedrive
    - Command: sh -c "rclone --vfs-cache-mode writes mount onedrive: ~/onedrive"
    - Description: This mounts my onedrive folder

- Refresh on demand
    - `killall -SIGHUP rclone`
