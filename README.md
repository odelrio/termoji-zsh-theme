<h1 align="center">
  <code>termoji zsh theme</code>
</h1>

![termoji](https://raw.githubusercontent.com/odelrio/termoji-zsh-theme/master/sample.gif)

# Introduction

`termoji` is a ZSH theme based on [Tyler Reckart](https://github.com/tylerreckart)'s [HYPERZSH](https://github.com/tylerreckart/hyperzsh). It introduces emojis to check a git repository status at a glance. This theme divides the prompt in two lines, displaying the directory and repository info in the first one and allocating more room to type the command at the second. You can customize it by simply editing a file.

I will explain how to get a macOS terminal working as mine (see sample GIF).

# Requirements

* macOS 10.14 Mojave (needed for iTerm2's seamless title bar)
* iTerm2 [3.2-20180812-nightly or later](https://iterm2.com/nightly/latest) (otherwise, you will need a hack to get the seamless title bar)
* ZSH or [https://brew.sh](Homebrew) to install it

# Terminal

1. Download iTerm2 [3.2-20180812-nightly or later](https://iterm2.com/nightly/latest).
2. Open iTerm2 and go to **Preferences** (`⌘` + `,`).
3. In **Appearance** set the **Theme** to `Minimal`, uncheck **Show window number in title bar** and check **Hide scrollbars**.
4. Move to the section **Profiles**.
5. In the Window tab, select **Style**: `Compact`.

Extra:

6. Set a fancy font like [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) in **Text**.
7. Download [this](https://raw.githubusercontent.com/odelrio/termoji-zsh-theme/master/termoji-dark.itermcolors) color scheme and import it in the **Colors** tab (**Color Presets...**).

Open a new terminal window and you will see your seamless terminal.

Check out [this hack](https://codematters.blog/custom-iterm2-titlebar-background-colors-a088c6f2ec60) if you want to achieve a similar result on an OS prior to Mojave.

# Shell

Unless you are not using macOS or you removed it manually, ZSH is already installed in your system out of the box. Run `zsh --version` to make sure. If it is not installed for any reason, install it by running `brew install zsh zsh-completions`.

Oh My ZSH is a piece of software that will make shell customization more handy by including tons of plugins. Install it by downloading its installation script with `curl`. I'm not responsible for that script, so you would do well by reviewing it before.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Then clone this repository to the custom themes' directory:

```
git clone https://github.com/odelrio/termoji-zsh-theme ~/.oh-my-zsh/custom/themes/termoji-zsh-theme
```

Now edit `~/.zshrc` with your favorite text editor and replace your current theme with `termoji`:

```
ZSH_THEME="termoji-zsh-theme/termoji"
```

Save the file, restart your shell and enjoy your cool terminal.

# Optional tweaks

## zshconfig

Open `~/.zshrc` with a text editor and go to the bottom of the file. There you can set your own aliases and commands to be run along every shell session. Let's create an alias to take us to this configuration file faster. Prepend the following line and replace `vi` with your favorite text editor.

```
# zshconfig
alias zshconfig='vi ~/.zshrc'
```

## Autosuggestions

You can get command suggestion as you type based on your previous executions. To achieve that, enable the plugin `zsh-autosuggestions` by editing `./zshrc` (remember `zshconfig`). Find that `plugins=(git)` line (or such, since I assume `git` is the only plugin out of the box) and add `zsh-autosuggestions` (use a space or a line break to separate plugins). 

## Shortcut to your recent directories (`z` command)

As you could see in the sample GIF above, you can use the command `z` (a Oh My ZSH plugin) to go straight to a recent directory by writing part of its name. `z` will remember the directories you visit by writing the whole path or `cd`ing into them.

Edit your ZSH config file again to include the plugin `z` (separate each plugin with a space or line break). It may look somewhat like:

```
plugins=(
  git
  zsh-autosuggestions
  z
)
```
