/* THIS FILE GENERATED BY bcd.gen */
module bcd.linuxstatvfs.statvfs;
align(4):
struct statvfs64 {
uint f_bsize;
uint f_frsize;
ulong f_blocks;
ulong f_bfree;
ulong f_bavail;
ulong f_files;
ulong f_ffree;
ulong f_favail;
uint f_fsid;
int __f_unused;
uint f_flag;
uint f_namemax;
int [6] __f_spare;
}
struct statvfs {
uint f_bsize;
uint f_frsize;
uint f_blocks;
uint f_bfree;
uint f_bavail;
uint f_files;
uint f_ffree;
uint f_favail;
uint f_fsid;
int __f_unused;
uint f_flag;
uint f_namemax;
int [6] __f_spare;
}
