use core::panic;
use std::fs;
use std::io::ErrorKind;

fn main() -> std::io::Result<()> {
    let persistance = [
        "/home/eduardo/Downloads",
        "/home/eduardo/creatus",
        "/home/eduardo/.ignore",
        "/home/eduardo/.rustup",
        "/home/eduardo/.cache",
        "/home/eduardo/.mozilla",
        "/home/eduardo/lince-social",
        "/home/eduardo/.local",
        "/home/eduardo/.gitconfig",
        "/home/eduardo/.ssh",
        "/home/eduardo/.config",
        "/home/eduardo/.cargo",
        "/home/eduardo/.npm",
        "/home/eduardo/xaviduds",
    ];

    let dir = fs::read_dir("/home/eduardo").unwrap();

    for entry in dir {
        let path = entry?.path();

        let path_str = path.to_string_lossy();

        if !persistance.contains(&path_str.as_ref()) {
            let _ = match fs::remove_dir_all(&*path_str) {
                Ok(file) => file,
                Err(error) => match error.kind() {
                    ErrorKind::NotADirectory => match fs::remove_file(&*path_str) {
                        Ok(fd) => fd,
                        Err(e) => panic!("Problem deleting file: {e:?}"),
                    },
                    other_error => {
                        panic!("Other problem: {other_error:?}");
                    }
                },
            };
        }
    }

    Ok(())
}
