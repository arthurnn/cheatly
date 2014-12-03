# Bower API - Commands and Options (http://bower.io/docs/api/)

## Commands

* cache
* help
* home
* info
* init
* install
* link
* list
* lookup
* prune
* register
* search
* update
* uninstall
* version

### cache

$ bower cache <command> [<args>]

Manage bower cache

#### cache clean


$ bower cache clean
$ bower cache clean <name> [<name> ...]
$ bower cache clean <name>#<version> [<name>#<version> ..]

Cleans cached packages

#### cache list

$ bower cache list
$ bower cache list <name> [<name> ...]

Lists cached packages

### help

$ bower help <command>

Display help information about Bower

### home

$ bower home
$ bower home <package>
$ bower home <package>#<version>

Opens a package homepage into your favorite browser.

If no `<package>` is passed, opens the homepage of the local package.

### info

$ bower info <package>
$ bower info <package> [<property>]
$ bower info <package>#<version> [<property>]

Displays overall information of a package or of a particular version.

### init

$ bower init

Interactively create a bower.json file

### install

$ bower install [<options>]
$ bower install <endpoint> [<endpoint> ..] [<options>]

Installs the project dependencies or a specific set of endpoints.

Endpoints can have multiple forms:

* `<package>`
* `<package>#<version>`
* `<name>=<package>#<version>`

Where:

* `<package>` is a package URL, physical location or registry name
* `<version>` is a valid range, commit, branch, etc.
* `<name>` is the name it should have locally.

#### install options

* `-F`, `--force-latest`: Force latest version on conflict
* `-p`, `--production`: Do not install project devDependencies
* `-S`, `--save`: Save installed packages into the project's bower.json dependencies
* `-D`, `--save-dev`: Save installed packages into the project's bower.json devDependencies

### link

$ bower link
$ bower link <name> [<local name>]

The link functionality allows developers to easily test their packages. Linking is a two-step process.

Using 'bower link' in a project folder will create a global link. Then, in some other package, `bower link <name>` will create a link in the components folder pointing to the previously created link.

This allows to easily test a package because changes will be reflected immediately. When the link is no longer necessary, simply remove it with `bower uninstall <name>`.

### list

$ bower list [<options>]

List local packages and possible updates.

#### list options

* `-p`, `--paths`: Generates a simple JSON source mapping
* `-r`, `--relative`: Make paths relative to the directory config property, which defaults to bower_components

### lookup

$ bower lookup <name>

Look up a package URL by name

### prune

$ bower prune

Uninstalls local extraneous packages

### register

$ bower register <name> <url>

Register a package

### search

$ bower search
$ bower search <name>

Finds all packages or a specific package.

### update

$ bower update <name> [<name> ..] [<options>]

Updates installed packages to their newest version according to bower.json.

#### update options

* `-F`, `--force-latest`: Force latest version on conflict
* `-p`, `--production`: Do not install project devDependencies

### uninstall

$ bower uninstall <name> [<name> ..] [<options>]

Uninstalls a package locally from your bower_components directory

#### uninstall options

* `-S`, `--save`: Remove uninstalled packages from the project's bower.json dependencies
* `-D`, `--save-dev`: Remove uninstalled packages from the project's bower.json devDependencies

### version

$ bower version [<newversion> | major | minor | patch]

Run this in a package directory to bump the version and write the new data back to the bower.json file.

The newversion argument should be a valid semver string, or a valid second argument to semver.inc (one of "build", "patch", "minor", or "major"). In the second case, the existing version will be incremented by 1 in the specified field.

If run in a git repo, it will also create a version commit and tag, and fail if the repo is not clean.

#### version options

* `-m`, `--message`: Custom git commit and tag message

If supplied with `--message` (shorthand: `-m`) config option, bower will use it as a commit message when creating a version commit. If the message config contains %s then that will be replaced with the resulting version number. For example:

$ bower version patch -m "Upgrade to %s for reasons"

## Options

* force
* json
* log-level
* offline
* quiet
* silent
* verbose
* allow-root

### force

-f, --force

Makes various commands more forceful

### json

-j, --json

Output consumable JSON

### log-level

-l, --log-level

What level of logs to report

### offline

-o, --offline

Do not use network connection

### quiet

-q, --quiet

Only output important information

### silent

-s, --silent

Do not output anything, besides errors

### verbose

-V, --verbose

Makes output more verbose

### allow-root

--allow-root

Allows running commands as root. Bower is a user command, there is no need to execute it with superuser permissions. However, if you still want to run commands with sudo, use `--allow-root` option.
