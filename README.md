## install scripts

The `.install` dir contains all the installation scripts that can setup environment variables, daily used apps and symlinks. The scripts are wrote in `pwsh` since it is the modern shell language in windows, and is more verbose but clear for me.

- `init`: setup buckets and install `git`, `chezmoi`, `pwsh`, `nu`, `age` and `firefox-dev`
- `env`: setup `XDG` dir and the config path for `bat` `eza`, `yazi`
- `symlinks`: setup symbolic links
  - for apps that won't utilize `XDG` dir, and depends on the original config dir to work.
- `languages`: install programming language
- `scoop`: install apps with `scoop`
- `npm`: install `npm` packages globally
- `winget`: install apps with `winget`

> [!note] XDG directory
> It will affect app storing location of config, data and cache, like neovim, lazygit...
> Unfortunately, vs code don't utilize these env variables by default now (2024-11-27).
> Hence, I've manually add those environment variables in the `settings.json`.
>
> It is still not clear that whether:
>
> - it is a vs code issue
> - it's because I install vs code with `scoop`.

### batch scripts

In addition, `batch` scripts streamline all the installation scripts. However, it requires setting up private `ssh` key, which is currently stored in USB flash drive, since I couldn't think of a valid way to save the private key.

> [!warning] UAC prompt
> There will be UAC prompt asking for admin privilege during some installation, mostly from `winget install` and `scoop install neorocks-scoop/luarocks`.
> Since UAC prompt has to be interact with the GUI manually, which makes the scripts not so automatical.

- [ ] use cache feature in `gsudo` to reduce multiple UAC prompt into one.

---

## chezmoi setup

### API keys

Since I stored some api keys for AI chat bot in my dotfiles, I encrypted it with `chezmoi` using `age` encryption. However, `chezmoi` needs to setup a `age` private key first to encrypt and decrypt the secret files.

reference: [Encryption - chezmoi](https://www.chezmoi.io/user-guide/frequently-asked-questions/encryption/)
The strategy:

1. generate an age private key, which will be used to encrypt and decrypt secrets
   a. `chezmoi cd ~`
   b. `age-keygen | age --armor --passphrase > key.txt.age`
2. encrypt the private key with a passphrase, so that it can be push to remote repo
   a. I can memorize passphrase and decrypt the private key with it
   b. there is no need for me to store private key in the physical drive
3. setup `chezmoi` script template to decrypt the private key if needed
   a. check if the key exist
   b. `mkdir` for the key's parent dir
   c. `chezmoi age decrypt --output {private-key} --passphrase {encrypted-private-key}`
   d. set private key permission `chmod 600 {private-key}`
4. configure `chezmoi.toml` to use the private key, and `age` encryption
   a. `[age.identity]`: private key path
   b. `[age.recipient]`: public key of the private key
   c. `encryption = "age"`
5. add my secret files with encryption
   a. `chezmoi add --encrypt {file}`
