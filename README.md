Sane defaults for running a Vagrant VM for Symfony development.

The bulk of this repository is a shell script and various config files. On Vagrant provision, the shell script `bootstrap.sh` is executed in the VM. This installs a LEMP stack, Docker, and various other packages, then configures them. The result is a browsable PHP VM.

- A single nginx vhost that responds to any server name, and is configured with a PHP FPM upstream.
- PHP with cli, xdebug, curl, gd, mcrypt. Error reporting and display is enabled.
- A MySQL database called `app`, with one user `app` and password `password`. The MySQL root password can be configured.

# Installation

## The easy way

`curl -sSL https://raw.githubusercontent.com/emarref/vagrant-project/symfony/install.sh | sh`

## The hard way

Read the [install.sh](install.sh) file and do what suits you.

## The manual way

1. Copy the `Vagrant` file to the root of your project.
2. Copy the contents of the `app/config/vm` dir to the `app/config/vm` dir of your project.
3. `vagrant up`

> :rocket: I recommend taking a stroll through the configuration and bootstrap script to understand exactly what it's doing before you run it.

# Configuration

See the top of the `Vagrantfile` for configuration options. Currently supported options are:

- `MYSQL_ROOT_PASSWORD` (Default: "password")
- `CONFIG_LOCATION` (Default: "/var/www/app/config/vm")
- `PHP_TIMEZONE` (Default: "UTC")
- `FRONT_CONTROLLER` (Default: "app_dev")
- `PUBLIC_DIR` (Default: "web")
