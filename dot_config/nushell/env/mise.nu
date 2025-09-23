export const MISE_INIT_PATH = ($nu.cache-dir | path join mise init.nu)

# Creates an `init.nu` file via `mise init …` at `MISE_INIT_PATH`.
export def init-mise [] {
	mkdir ($MISE_INIT_PATH | path dirname)
	mise activate nu | save -f $MISE_INIT_PATH
}
