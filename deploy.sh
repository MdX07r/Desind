#!/bin/bash
                                                                                                                    
echo "                      @@@@@@@@@@@@                         
                       @@@@@@@@@@@@@@@@@@@@                    
                    @@@@@@@@                @@@                 
                   @@@@@       @@@@@@@@@@@     @@               
               @           @@@@@@@@@@@@@@@@     @@             
             @@         @@@@@@@@@@@@@@@@@@@      @@@           
            @@       @@@@@@@@@@@@@@@@@@@@@       @@@          
           @@@     @@@@@@@@@@@@@@@@@@@@@@         @@@         
          @@@@   @@@@@@@@@         @@@@@@           @@@@        
          @@@@@@@@@@@@@          @@@@@              @@@        
         @@@@@@@@@@@@@           @@@@                @@@@       
         @@@@@@@@@@@            @@@@                 @@@@       
         @@@@@@@@@@@          @@@@                  @@@@@       
         @@@@@@@@@@          @@@                    @@@@@       
         @@@@@@@@@          @@                     @@@@@@       
         @@@@@@@@@         @@                     @@@@@@@       
          @@@@@@@@        @@                     @@@@@@@        
           @@@@@@@@      @@@                    @@@@@@@@        
           @@@@@@@@     @@@                   @@@@@@@@@         
            @@@@@@@@   @@@@                 @@@@@@@@@@          
             @@@@@@@   @@@@               @@@@@@@@@@@           
               @@@@@   @@@@@@         @@@@@@@@@@@@@             
                       @@@@@@@@@@@@@@@@@@@@@@@@               
                       @@@@@@@@@@@@@@@@@@@@@@                 
                        @@@@@@@@@@@@@@@@@@@                    
                           @@@@@@@@@@@@"                                                                                  

# ==================================
# System: Installing essential tools
# ==================================
echo "Preparing for installation..."
echo "==========================
sudo pacman -Syu --noconficonf
sudo pacman -S --noconfirm base-devel git

# ------
# Installing Yay if it is not installed
# ------
if! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git 
    cd yay
    makepkg -si --noconfirm
    cd..
    rm -rf yay
fi

# -------
# Installing the essential packages from the official repositories
# -------
echo "Install packages..."
echo "=========================
sudo pacman -S --noconfirm hyprland quickshell fastfetch grim slurp wl-copy swappy cmake qt6 nvim playerctl wtype hyprcursor nautilus chromium noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-nerd-fonts-symbols ttf-ibm-plex ttf-jetbrains-mono networkmanager pavucontrol brightnessctl wpctl pactl python-pywal telegram-desktop discord code vs-code libreoffice-fresh bottles gimp steam lutris audacity kdenlive obs-studio flatpak

yay -S alacritty-smooth-cursor-git heroic-games-launcher waydroid

# ------
# Installing Icon Packages
# ------
sudo pacman -S --noconfirm otf-font-awesome awesome-terminal-fonts papirus-icon-theme

# ------
# Installing additional fonts (if necessary)
# ------
sudo pacman -S --noconfirm ttf-dejavu ttf-liberation

# ======================
# Starting system setup
# ======================
echo "Start system setup..."
echo "=======================

# ------
# 2. Installing IBM Plex Fonts
# ------
echo "------------------------
echo "(1/3) Install font..."
sudo pacman -S --needed --noconfirm ttf-ibm-plex otf-ibm-plex
fc-cache -fv

# -------
# 3. Setting the default font via Fontconfig for the system
# -------
FONTCONF_FILE="$HOME/.config/fontconfig/fonts.conf"
mkdir -p "$(dirname "$FONTCONF_FILE")"

cat > "$FONTCONF_FILE" <<EOL
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match>
        <edit name="family" mode="assign" binding="strong">
            <string>IBM Plex Sans Thin</string>
        </edit>
    </match>
</fontconfig>
EOL

fc-cache -fv

# -------
# Install xkb or sway-input-tools if not already installed
# -------
sudo pacman -S --needed --noconfirm xkeyboard-config

# =========================
# Alactritty Configuration
# =========================
echo "-------------------
echo "(2/3) Setting up Alactritty..."
cat <<EOL > ~/.config/alactritty/alactritty.toml
import = [
    "~/.cache/wal/alacritty.toml"
]

[window]
# Window dimensions at startup (optional)
# dimensions = {columns = 82, lines = 24}

# Specify the window display location (optional)
# position = { x = 0, y = 0}

# Internal padding to leave space between the window edge and the text
padding = { x = 10, y = 10}

# Window Decoration (Title Bar)
# You can choose "none" to hide it completely and rarely on your window manager.
decorations = "full"

# Transparency and Ambiguity
# Here we adjust the simple transparency and pure blur.
opacity = 0.95 # Simple transparency (95%). You can adjust it between 0.0 and 1.0.
blur = true   # Enable blur. Requires a composer like picom.

[scrolling]
# The number of lines kept in memory for backward scrolling.
history = 10000
# Multiplication factor for scrolling speed.
multiplier = 3

[font]
# Basic Font Settings
normal = {family = "JetBrainsMono Nerd Font", style = "Regular" }
bold = {family = "JetBrainsMono Nerd Font", style = "Bold"}
italic = {family = "JetBrainsMono Nerd Font", style = "Italic" }
bold_italic = {family = "JetBrainsMono Nerd Font", style = "Bold Italic" }

# Font Size
size = 11.0

# Additional settings to improve the appearance of the font
# Glyph displacement to adjust the letters of the letters (useful for some lines)
glyph_offset = { x = 0, y = 0}
# Calligraphy thickness (not supported by all systems)
# builtin_box_drawing = true

[bell]
# Alarm Sound (Bell) Settings
animation = "EaseOutExpo"
duration = 100 # in ms
color = "#ffffff"

[selection]
# When determining the text with the mouse button, it is automatically copied to the clipboard.
save_to_clipboard = true

[cursor]
# Indicator Settings
# Indicator style: Block, Beam, Underline
style = {shape = "Block", blinking = "On"}

# Smooth Indicator Settings
# These settings are specific to the modified version you are using.
# Make the cursor movement smooth instruction of jumping initially.
smooth_cursor = true

[keyboard]
# Key Bindings
# You can add custom shortcuts here. For example, to copy and paste:
# (These are usually the default settings on Linux)
# bindings = [
#   { key = "C", mods = "Control|Shift", action = "Copy"},
#   { key = "V", mods = "Control|Shift", action = "Paste"},
# ]

[mouse]
# Hide the cursor while typing.
hide_when_typing = true

# Mouse Bindings
# For example, to change the font size using Ctrl + Scroll
bindings = [
  { mouse = "ScrollUp", mods = "Control", action = "IncreaseFontSize"},
  { mouse = "ScrollDown", mods = "Control", action = "DecreaseFontSize"},
]

[colors]
# Color settings
# When using PYWAL, most color settings should be in a file
# ~/.
# But we will put here the basic "pure black" color settings as a background
# Default if PYWAL does not work for any reason.

# Primary Colors
primary = {background = "#000000", foreground = "#ffffff" }

# Indicator Colors
cursor = {text = "CellBackground", cursor = "CellForeground"}
vi_mode_cursor = {text = "CellBackground", cursor = "CellForeground"}

# Selection Colors
selection = {text = "CellBackground", background = "#b3b3b3" }

# Normal colors (will be overridden by pywal)
normal = {black = "#1d1f21", red = "#cc6666", green = "#b5bd68", yellow = "#f0c674", blue = "#81a2be", magenta = "#b294bb", cyan = "#8abeb7", white = "#c5c8c6" }

# Bright colors (will be overridden by pywal)
bright = {black = "#666666", red = "#d54e53", green = "#b9ca4a", yellow = "#e7c547", blue = "#7aa6da", magenta = "#c397d8", cyan = "#70c0b1", white = "#eaeaea" }

# Fake colors (unused in abundance)
# dim = { ... }

# The main window wallpaper
# Here we guide that the background is fully pure black.
draw_bold_text_with_bright_colors = true

[terminal.shell]
program = "/bin/bash"
args = [
  "-c",
  "fastfetch && exec bash",
]
EOL

# ========================
# FastFetch Configuration
# ========================
cat <<EOL > ~/.config/fastfetch/config.jsonc
{
    // === Logo Settings (ASCII Art) ===
    "logo": {
        // Logo type: "file" to use custom ASCII from an external file.
        "type": "file",
        // Path to the custom ASCII technical file. 
        "key": "~/.config/fastfetch/desind.txt",
        
        // Use Pywal colors to encode ASCII art
        // These colors are set as environment variables by Pywal
        "color": {
            //$color0: background color (dark color)
            "0": "$color0", 
            // $color1: First highlight color (Pywal red)
            "1": "$color1",
            "2": "$color2", 
            "3": "$color3", 
            "4": "$color4",
            "5": "$color5", 
            "6": "$color6", 
            "7": "$color7",
            // Bright colors
            "8": "$color8",
            "9": "$color9",
            "A": "$colorA",
            "B": "$colorB",
            "C": "$colorC",
            "D": "$colorD",
            "E": "$colorE",
            "F": "$colorF"
        },
        
        // Logo and text formatting settings
        "padding": {
            "top": 0,
            "right": 4, 
            "bottom": 0,
            "left": 0
        },
        "side": "left"
    },

    // === Information Modules Settings (Modules) ===
    // This order will determine the sequence in which information is displayed
    "modules": [
        "os",             // Operating system
        "host",           //Host/Model
        "kernel",         // Kernel version
        "uptime",         // System runtime
        "packages",       // Number of installed packages
        "shell",          // Shell used
        "display",        // Screen resolution
        "wm",             // Window Manager
        "cpu",            // Processor
        "gpu",            // Graphics card
        "memory",         // Random Access Memory (RAM) Usage
        "disk",           // Disk usage
        "Terminal"        // Name of the terminal used
    ],

    // === General Formatting Settings (Using Pywal Colors) ===
    // Display a header (Header) that includes the username and hostname
    "display-header": true,
    "header": {
        "format": "$user@$hostname"
    },
    
    // Color of information keys (e.g. "OS:", "CPU:")
    // We use $color4 (usually blue or purple from Pywal)
    "key-color": "$color4",   
    
    // Color the information value (e.g. "Arch Linux", "Intel i7")
    // We use $colorF (usually white or a light foreground color)
    "text-color": "$colorF", 
    
    // Separator color
    "separator-color": "default", 
    
    // The symbol separating the key from the value
    "separator": ": "
}
EOL

cat <<EOL > ~/.config/fastfetch/desind.txt
                 *@@@@@@@@@@@@@                   
              @@@@@@@           :@@               
             @@@@      @@@@@@@@    -@+            
         =         @@@@@@@@@@@@@    *@           
        @       @@@@@@@@@@@@@@@@@+     @@         
      -@      @@@@@@@@@@@@@@@@@@       @@        
      @@    @@@@@@@.      @@@@@         @@@       
     @@@@@@@@@@@.        %@@@=           @@       
    +@@@@@@@@@=         @@@+             @@@      
    @@@@@@@@@          @@@               @@@      
    @@@@@@@@%        -@@                @@@@      
    @@@@@@@@        @@                  @@@@      
    =@@@@@@@       @@                  @@@@@      
     @@@@@@@      @@                  @@@@@:      
      @@@@@@     @@                 %@@@@@@       
      :@@@@@@   =@@               :@@@@@@@        
        @@@@@   @@@             @@@@@@@@@         
         @@@@  :@@@@=        @@@@@@@@@@           
               :@@@@@@@@@@@@@@@@@@@@@             
                @@@@@@@@@@@@@@@@@@%               
                  @@@@@@@@@@@@@
EOL

# =======================
# Hyprland Configuration
# =======================
echo "====================
echo "Hyprland Configuration..."
echo "====================
cat <<EOL > ~/.config/hypr/hyprland.conf
# =========================
# Basic input settings
# =========================

# ------
# Keyboard settings
# ------
input {
    kb_layout = ar, us
    kb_variant = ,
    kb_options = grp:super_space_toggle
    follow_mouse = 1
    sensitivity = 0.0
    repeat_rate = 25
    repeat_delay = 300
    scroll_method = two_finger
    scroll_button = 273
    scroll_button_lock = false
}

# -------
# Mouse settings
# -------
device:* {
    sensitivity = 0.0
    scroll_factor = 1.0
    scroll_button_lock = false
    scroll_event_multiplier = 1.0
    tap = true
    tap_button = 1
    tap_drag = true
    tap_drag_lock = false
    natural_scroll = true
    middle_button_emulation = true
    left_handed = false
    accel_profile = flat
    click_method = button_areas
    disable_while_typing = false
}

# =================
# Window settings
# =================

# ------
# Default window behavior
# ------
general {
    gaps_in = 10
    gaps_out = 25
    border_size=2
    col.active_border = rgba(4169E1FF)
    col.inactive_border = rgba(00000000)
    rounding = 15
    layout = dwindle
    border_size=2
    full_no_gaps = true
    allow_tearing = false
    resize_on_border = true
    resize_on_border_only = true
    mouse_move_enables_hyprland_drag = true
    new_window = default
    focus_on_activate = true
    swallow = true
    cursor_inactive_timeout = 0
    initial_workspace=1
}

# ------
# Animation settings
# ------
decoration {
    rounding = 15
    active_opacity = 1.0
    inactive_opacity = 1.0
    fullscreen_opacity = 1.0
    dim_special = false
    dim_strength = 0.0
    blur = true
    blur_size = 4
    blur_passes=1
    blur_new_optimizations = true
    drop_shadow = true
    shadow_range = 10
    shadow_render_power=2
    col.shadow = rgba(000000AA)
    no_vfr = false
    no_rdr = false
    no_maps = false
}

# ==============
# Performance settings
# ==============

# -------
# Performance improvements
# -------
misc {
    vfr = true
    vrr = 2
    disable_hyprland_logo = false
    disable_splash_rendering = false
    mouse_move_enables_hyprland_drag = true
    enable_swallow = true
    vrr_workaround = true
    allow_tearing = false
    animate_manual_resizes = true
    animate_mouse_windowdragging = true
    prefer_primary_as_master = true
    resize_on_border = true
    resize_on_border_only = true
    new_window = default
    focus_on_activate = true
    swallow = true
    cursor_inactive_timeout = 0
    initial_workspace=1
    debug {
        enable_rendering = true
        enable_debug_marks = false
    }
}

# ===============
# Screen settings
# ===============
monitor = ,preferred, auto, auto,1

# =========
# Abbreviations
# =========

# ------
# Abbreviation of the basic system
# ------
$mainMod = SUPER

# ------
# Virtual applications
# ------
env = TERMINAL, alacritty-smooth-cursor-git
env = BROWSER, chromium
env = EDITOR, nvim

# ------
# Application shortcuts
# ------
bind = $mainMod, RETURN, exec, $TERMINAL
bind = $mainMod, T, exec, $TERMINAL -e $EDITOR 
bind = $mainMod, K, killactive,
bind = $mainMod, F, fullscreen,
bind = $mainMod, P, pseudo,
bind = $mainMod, X, exec, $BROWSER
bind = $mainMod, Z, togglefloating,
bind = $mainMod, J, toggleopaque,
bind = $mainMod, B, toggleborder,

# ------
# Shortcuts for navigating between workspaces
# ------
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# ------
# Shortcuts for navigating between windows
# ------
bind = $mainMod, LEFT, movefocus, l
bind = $mainMod, RIGHT, movefocus, r
bind = $mainMod, UP, movefocus, u
bind = $mainMod, DOWN, movefocus, d

# ------
# Window resize shortcuts
# ------
bind=$mainMod SHIFT, LEFT, resizeactive, -10 0
bind=$mainMod SHIFT, RIGHT, resizeactive, 10 0
bind = $mainMod SHIFT, UP, resizeactive, 0 -10
bind = $mainMod SHIFT, DOWN, resizeactive, 0 10
bind=$mainMod SHIFT, J, resizeactive, -10 0
bind=$mainMod SHIFT, L, resizeactive, 10 0
bind = $mainMod SHIFT, I, resizeactive, 0 -10
bind = $mainMod SHIFT, K, resizeactive, 0 10

# -------
# Shortcut to change ratios in Dwindle mode
# -------
bind = $mainMod, H, togglesplit,

# ------
# Screenshot Shortcuts
# ------
# Capture the entire screen
bind = SUPER, F12, exec, grim ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
# Capture a specific area
bind = SUPER, F11, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
# Capture the active window
bind = SUPER, F10, exec, grim -g "$(hyprctl activewindow | grep 'at: ' | cut -d' ' -f3 | sed 's/,.*//;s/^/0x/')+$(hyprctl activewindow | grep 'size: ' | cut -d' ' -f3)" ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
# Capture with 5 second timer
bind = SUPER, F9, exec, sleep 5 && grim ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png

# ------
# QuickShell Shortcuts
# ------
bind = , XF86AudioMicMute, exec, pamixer --default-source -m
bind = , XF86AudioMute, exec, pamixer -t
bind = , XF86AudioPlay, exec, playerctl play-pause
bind = , XF86AudioPause, exec, playerctl play-pause
bind = , XF86AudioNext, exec, playerctl next
bind = , XF86AudioPrev, exec, playerctl previous
bind = , XF86AudioLowerVolume, exec, pamixer --decrease 1
bind = , XF86AudioRaiseVolume, exec, pamixer --increase 1
bind = , XF86MonBrightnessDown, exec, brightnessctl set 1%-
bind = , XF86MonBrightnessUp, exec, brightnessctl set 1%+

# ==========================
# Run applications automatically
# ==========================
exec-once = dbus-update-activation-environment --systemd DISPLAY
exec-once = systemctl --user import-environment DISPLAY
exec-once = wal
exec-once = quickshell
exec-once = xdg-desktop-portal-hyprland
exec-once = xdg-desktop-portal
exec-once = alactritty
exec-once = mpd
exec-once = mpd-mpris

# ===============
# Additional settings
# ===============

# ------
# Customize mouse pointer
# ------
env = HYPRCURSOR_THEME, Bibata-Modern-Ice
env = HYPRCURSOR_SIZE,12

# ------
# Interface settings
# ------
env = QT_QPA_PLATFORM, wayland
env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
env = XDG_CURRENT_DESKTOP, Hyprland
env = XDG_SESSION_DESKTOP, Hyprland
env = MOZ_ENABLE_WAYLAND, 1
env = QT_QPA_PLATFORMTHEME, qt6ct
env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
env = SDL_VIDEODRIVER, wayland

# -------
# Language settings
# -------
env = LANG, en_US.UTF-8
env = LC_ALL, en_US.UTF-8
env = LC_CTYPE, en_US.UTF-8
env = LC_MESSAGES, en_US.UTF-8
env = LC_TIME, en_US.UTF-8
env = LC_NUMERIC, en_US.UTF-8
env = LC_MONETARY, en_US.UTF-8
env = LC_PAPER, en_US.UTF-8
env = LC_NAME, en_US.UTF-8
env = LC_ADDRESS, en_US.UTF-8
env = LC_TELEPHONE, en_US.UTF-8
env = LC_MEASUREMENT, en_US.UTF-8
env = LC_IDENTIFICATION, en_US.UTF-8

# ------
# QuickShell Default Settings
# ------
env = QUICKSHELL_THEME, pure-black
env = QUICKSHELL_LAYOUT_DIRECTION, rtl
env = QUICKSHELL_BLUR_EFFECT, true
env = QUICKSHELL_ANIMATIONS, smooth
env = QUICKSHELL_FONT, "IBM Plex Sans Thin"

# ------
# Touch screen settings
# ------
gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
    workspace_swipe_invert = false
    workspace_swipe_distance = 200
    workspace_swipe_time = 200
    workspace_swipe_cancel_distance = 50
    workspace_swipe_cancel_time = 100
    workspace_swipe_cancel_velocity = 0.5
    workspace_swipe_cancel_acceleration = 0.5
    workspace_swipe_cancel_angle = 30
    workspace_swipe_cancel_direction = 0
    workspace_swipe_cancel_distance = 50
    workspace_swipe_cancel_time = 100
    workspace_swipe_cancel_velocity = 0.5
    workspace_swipe_cancel_acceleration = 0.5
    workspace_swipe_cancel_angle = 30
    workspace_swipe_cancel_direction = 0
}

# -------
# Display settings
# -------
device:* {
    sensitivity = 0.0
    scroll_factor = 1.0
    scroll_button_lock = false
    scroll_event_multiplier = 1.0
    tap = true
    tap_button = 1
    tap_drag = true
    tap_drag_lock = false
    natural_scroll = true
    middle_button_emulation = true
    left_handed = false
    accel_profile = flat
    click_method = button_areas
    disable_while_typing = false
}
EOL

cat <<EOL > ~/.config/quickshell/welcome.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

ApplicationWindow {
    id: root
    visible: true
    width: 1024
    height: 768
    color: isDarkTheme ? "#000000": "#FFFFFF"

    // Dynamic color scheme
    property var pywalColors: {
        "colors": [
            "#000000", // background color
            "#BC412B", // base color 1
            "#568C3B", // base color 2
            "#F7D000", // base color 3
            "#4169E1", // base color 4
            "#A020F0", // base color 5
            "#00CED1", // base color 6
            "#F5F5F5"  // Text color
        ],
        "special": {
            "background": "#000000",
            "foreground": "#F5F5F5",
            "cursor": "#F5F5F5"
        }
    }

    //State variables
    property bool isDarkTheme: true
    property int currentPage: 0
    property var keyboardLayouts: ["US", "AR"]
    property var notificationMessages: ["Welcome to Desind OS", "An innovative operating system that combines speed and beauty"]

    // Application settings
    Settings {
        property bool isFirstRun: true
    }

    // Check the first run
    Component.onCompleted: {
        if(!settings.isFirstRun) {
            rootLoader.source = "shell.qml" // Go directly to the home screen
        } else {
            settings.isFirstRun = false // Update the state after the first run
        }
    }

    //Welcome home page
    Rectangle {
        id: welcomeScreen
        anchors.fill: parent
        color: pywalColors.special.background
        visible: currentPage===0

        Column {
            anchors.centerIn: parent
            Spacing: 20

            Text {
                text: "Welcome to Desind OS"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 36
                color: pywalColors.special.foreground
            }

            Text {
                text: "An innovative operating system that combines speed, simplicity, and beauty."
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 18
                color: pywalColors.colors[5]
                horizontalAlignment: Text.AlignHCenter
                width: parent.width * 0.8
                wrapMode: Text.Wrap
            }

            Button {
                text: "Let's get started >"
                width: 150
                height: 50
                radius: 25
                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                border.color: pywalColors.colors[6]
                border.width: 1

                onClicked: {
                    currentPage = 1 // Go to the first page
                }
            }
        }
    }

    //Feature pages
    StackView {
        id: featurePages
        anchors.fill: parent
        visible: currentPage > 0
        initialItem: FeaturePage {featureIndex: 0}

        onCurrentIndexChanged: {
            if (featurePages.depth === 0) {
                currentPage = 0
            }
        }
    }

    // Feature page component
    Component {
        id: featurePageComponent
        Item {
            id: featurePage
            property int featureIndex: 0
            width: parent.width
            height: parent.height

            Column {
                anchors.centerIn: parent
                Spacing: 20

                Text {
                    text: getFeatureTitle(featureIndex)
                    font.family: "IBM Plex Sans Bold"
                    font.pixelSize: 28
                    color: pywalColors.special.foreground
                }

                Text {
                    text: getFeatureDescription(featureIndex)
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: pywalColors.colors[5]
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width * 0.8
                    wrapMode: Text.Wrap
                }

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Spacing: 10

                    Button {
                        text: "< previous"
                        width: 100
                        height: 40
                        radius: 20
                        visible: featureIndex > 0

                        onClicked: {
                            featureIndex -= 1
                            featurePages.pop()
                        }
                    }

                    Button {
                        text: "Next >"
                        width: 100
                        height: 40
                        radius: 20
                        visible: featureIndex < 2

                        onClicked: {
                            featureIndex += 1
                            featurePages.push(FeaturePage {featureIndex: featureIndex})
                        }
                    }
                }
            }
        }
    }

    // Change the theme
    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Spacing: 10

        Text {
            text: isDarkTheme ? "light mode": "dark mode"
            font.family: "IBM Plex Sans Thin"
            font.pixelSize: 16
            color: pywalColors.special.foreground
        }

        Switch {
            checked: isDarkTheme
            onCheckedChanged: {
                isDarkTheme = !isDarkTheme
                applyTheme()
            }
        }
    }

    // Manage keyboard layout
    Rectangle {
        id: keyboardSettings
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        height: 200
        radius: 20
        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
        border.color: pywalColors.colors[6]
        border.width: 1
        visible: currentPage===3

        Column {
            anchors.fill: parent
            Spacing: 10

            Text {
                text: "Keyboard Layout Management"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 20
                color: pywalColors.special.foreground
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ListView {
                width: parent.width
                height: 100
                model: keyboardLayout
                delegate: Item {
                    width: parent.width
                    height: 30

                    Row {
                        anchors.fill: parent
                        Spacing: 10

                        Text {
                            text: modelData
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.special.foreground
                        }

                        Button {
                            text: "Delete"
                            width: 60
                            height: 25
                            radius: 10
                            visible: model.index!== 0

                            onClicked: {
                                keyboardLayout.splice(model.index, 1)
                            }
                        }
                    }
                }
            }

            Button {
                text: "Add new layout"
                width: 150
                height: 40
                radius: 20
                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                border.color: pywalColors.colors[6]
                border.width: 1

                onClicked: {
                    keyboardLayout.push("New Layout")
                }
            }
        }
    }

    //Help functions
    function getFeatureTitle(index) {
        switch (index) {
        case 0: return "Drile: Lightweight File Manager"
        case 1: return "Crosire: AI Engine"
        case 2: return "ArchStart: Application Manager"
        default: return ""
        }
    }

    function getFeatureDescription(index) {
        switch (index) {
        case 0: return "Drile is the lightest file manager ever!"
        case 1: return "Crosire is an AI engine that learns from you and adapts."
        case 2: return "ArchStart is a built-in application manager that provides speed and flexibility."
        default: return ""
        }
    }

    function applyTheme() {
        if (isDarkTheme) {
            pywalColors.special.background = "#000000"
            pywalColors.special.foreground = "#F5F5F5"
        } else {
            pywalColors.special.background = "#FFFFFF"
            pywalColors.special.foreground = "#000000"
        }
    }
}
EOL

# =========================
# QuickShell Configuration
# =========================
echo "QuickShell configuration..."
echo "=========================
echo "(1/5) System configuration..."
cat <<EOL > ~/.config/quickshell/shell.qml
//===========
// Imports
//===========
import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Layouts 6.8
import QtQuick.Window 6.8
import QtQuick.Controls.impl 6.8
import QtQuick.Templates 6.8 as T
import QuickShell.Effects 6.8
import QtGraphicalEffects 6.8
import QtQuick.Studio.Effects 6.8
import Qt.labs.processes 6.8
import Qt.labs.settings 6.8
import Qt.labs.folderlistmodel 6.8
import Qt.labs.platform 6.8
import Qt.labs.fileio 6.8
import QuickShell.Processor 6.8
import QuickShell.Effects 6.8
import QtQuick.ShaderEffect 6.8
import QtQuick.Particles 6.8
import QuickShell.Audio 6.8
import QuickShell.AI 6.8
import QuickShell.Resources 6.8
import QuickShell.Animation 6.8
import QuickShell.Effects 6.8
import QuickShell.System 6.8
import org.freedesktop.UPower 6.8

//========================
// Basic application configuration
//========================
ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    color: "#000000"
    title: "Desind"
    
    locale: Qt.locale("en_US")
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    //==============
    // System objects
    //==============
    QuickShellAnimation {
        id: animationEngine
        animationduration: 50
        animationEasing: 8 // Easing.OutQuart
        enabled: true
    }

    QuickShellEffects {
        id: visualEffects
        blurRadius: 32
        opacity: 0.85
        enabled: true
        backgroundColor: "#000000"
    }

    QuickShellSystem {
        id: systemInfo
    }

    Rectangle {
        id: glassPanel
        width: 300
        height: 200

        GlassMorphismEffect {
            id: glassEffect
            source: background
            radius: 20
            intensity: 0.7
            enabled: true
        }

        Image {
            id: background
            source: "qrc:/wallpaper1.jpg"
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent
        }
    }

    //=============================================
    // Improve pods using new integrations
    //=============================================
    Capsule {
        id: settingsCapsule
        icon: "\uf013" // Settings icon
        colorIndex: 4
        capsuleId: "settings"
        width: 50
        height: 50
        property bool isExpanded: false
        property bool isRightClicked: false
        
        // Base capsule (circular)
        Rectangle {
            id: capsuleBase
            anchors.fill: parent
            radius: width/2
            color: "#000000"
            border.width: 0
            
            // Icon
            Text {
                anchors.centerIn: parent
                text: settingsCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
        }
        
        // Mouse interaction
        MouseArea {
            id: settingsMouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            
            onEntered: {
                //Light zoom effect
                animationEngine.startAnimation(capsuleBase, "scale", 1.0, 1.05, 80);
            }
            
            onExited: {
                // Return to normal scale
                animationEngine.startAnimation(capsuleBase, "scale", 1.05, 1.0, 80);
            }
            
            // Left-click processing
            onClicked: {
                if (mouse.button === Qt.LeftButton) {
                    // Close all other capsules
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded && child.capsuleId!== "settings") {
                            animationEngine.startAnimation(child, "width", child.width, 100, 100);
                            child.isExpanded = false;
                        }
                    }
                    
                    // Temporarily expand this capsule
                    animationEngine.startAnimation(settingsCapsule, "width", 50, 100, 100);
                    isExpanded = true;
                    activeCapsule = capsuleId;
                    
                    // Open the Settings app as a separate app
                    openSettingsApp();
                    
                    // Close the capsule after opening the settings
                    setTimeout(function() {
                        animationEngine.startAnimation(settingsCapsule, "width", 100, 50, 100);
                        isExpanded = false;
                        activeCapsule = "";
                    }, 200);
                }
            }
            
            // Right click processing
            onPressAndHold: {
                if(!isExpanded) {
                    // Close all other capsules
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded && child.capsuleId!== "settings") {
                            animationEngine.startAnimation(child, "width", child.width, 100, 100);
                            child.isExpanded = false;
                        }
                    }
                    
                    // Expand this capsule
                    animationEngine.startAnimation(settingsCapsule, "width", 50, 200, 100);
                    isExpanded = true;
                    isRightClicked = true;
                    activeCapsule = capsuleId;
                    
                    //apply a slight blur effect to editing options
                    visualEffects.applySmoothBlur(editOptions, 16, 0.7);
                    
                    // Show editing options
                    editOptions.visible = true;
                    animationEngine.startAnimation(editOptions, "opacity", 0, 1, 50);
                } else if (isRightClicked) {
                    // Close the capsule
                    animationEngine.startAnimation(settingsCapsule, "width", 200, 50, 100);
                    isExpanded = false;
                    isRightClicked = false;
                    activeCapsule = "";
                    
                    // Hide editing options
                    animationEngine.startAnimation(editOptions, "opacity", 1, 0, 50);
                    setTimeout(function() {
                        editOptions.visible = false;
                    }, 50);
                }
            }
        }
        
        // Modification options (shown when right-clicked)
        Item {
            id: editOptions
            anchors.fill: parent
            visible: false
            opacity: 0
            
            // Option to modify Hyprland file
            Rectangle {
                id: hyprlandOption
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.verticalCenter: parent.verticalCenter
                width: 120
                height: 40
                radius: 20
                color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                border.color: pywalColors.colors[2]
                border.width: 1
                
                Text {
                    anchors.centerIn: parent
                    text: "Hyprland File"
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[2]
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //Pulse effect when clicking
                        visualEffects.startPulseAnimation(hyprlandOption, pywalColors.colors[2], 300, 600);
                        openHyprlandConfig();
                    }
                    onEntered: {
                        // Zoom effect when passing
                        animationEngine.startAnimation(parent, "scale", 1.0, 1.05, 50);
                    }
                    onExited: {
                        animationEngine.startAnimation(parent, "scale", 1.05, 1.0, 50);
                    }
                }
            }
            
            // Option to modify QuickShell file
            Rectangle {
                id: quickshellOption
                anchors.left: hyprlandOption.right
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                width: 120
                height: 40
                radius: 20
                color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                border.color: pywalColors.colors[5]
                border.width: 1
                
                Text {
                    anchors.centerIn: parent
                    text: "QuickShell file"
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[5]
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        //Pulse effect when clicking
                        visualEffects.startPulseAnimation(quickshellOption, pywalColors.colors[5], 300, 600);
                        openQuickShellConfig();
                    }
                    onEntered: {
                        // Zoom effect when passing
                        animationEngine.startAnimation(parent, "scale", 1.0, 1.05, 50);
                    }
                    onExited: {
                        animationEngine.startAnimation(parent, "scale", 1.05, 1.0, 50);
                    }
                }
            }
        }
        
        //====================
        // System functions
        //====================
        // Open the Settings app as a separate app
        function openSettingsApp() {
            try {
                // Use System to open the Settings app
                systemInfo.executeTerminalCommand("qmlscene qrc:/SettingsApp/SettingsApp.qml");
            } catch(e) {
                console.error("Failed to open Settings app:", e);
            }
        }
        
        //Open Hyprland file for editing
        function openHyprlandConfig() {
            try {
                // Specify the configuration file path using System
                const homeDir = systemInfo.executeCommand("echo", ["$HOME"]).trim();
                const configPath = homeDir + "/.config/hypr/hyprland.conf";
                
                //Open file in Neovim
                systemInfo.executeTerminalCommand("nvim" + configPath);
                
                //Breathing effect on the capsule
                visualEffects.startBreathingAnimation(settingsCapsule, 0.95, 1.05, 3000);
            } catch(e) {
                console.error("Failed to open Hyprland file:", e);
            }
        }
        
        //Open QuickShell file for editing
        function openQuickShellConfig() {
            try {
                // Specify the configuration file path using System
                const homeDir = systemInfo.executeCommand("echo", ["$HOME"]).trim();
                const configPath = homeDir + "/.config/quickshell/config.json";
                
                //Open file in Neovim
                systemInfo.executeTerminalCommand("nvim" + configPath);
                
                //Breathing effect on the capsule
                visualEffects.startBreathingAnimation(settingsCapsule, 0.95, 1.05, 3000);
            } catch(e) {
                console.error("Failed to open QuickShell file:", e);
            }
        }
    }

    //================
    // Productivity analysis
    //===============
    property var productData: {
        daily: [],
        weekly: [],
        Monthly: []
    }

    //==============
    // Smart devices
    //==============
    SmartDeviceManager {
        id: smartDeviceManager
        enabled: true
        
        onDeviceDetected: {
            // Discover a new smart device
            notificationSystem.notificationReceived("Smart Devices", "New Device", 
                "Device detected" + deviceName, "\uf108");
            
            // Integration proposal
            crosireChatMessages.push({
                message: "Device detected" + deviceName + 
                        ". Want to integrate it with QuickShell?
                isUser: false
            });
        }
        
        onDeviceInteractionRequested: {
            // Interact with a smart device
            interactWithSmartDevice(deviceId, interactionType);
        }
        
        onDeviceStatusChanged: {
            // Update device status
            updateDeviceStatus(deviceId, status);
        }
    }

    // Function to interact with a smart device
    function interactWithSmartDevice(deviceId, interactionType) {
        try {
            smartDeviceManager.interact(deviceId, interactionType);
        } catch(e) {
            console.error("Failed to interact with the smart device:", e);
            showToast("Device Interaction Failed", "\uf071");
        }
    }

    // Function to integrate a smart device with the system
    function integrateSmartDevice(deviceId) {
        try {
            smartDeviceManager.integrate(deviceId);
            showToast("Device integrated with system", "\uf108");
        } catch(e) {
            console.error("Smart device integration failed:", e);
            showToast("Device merge failed", "\uf071");
        }
    }

    // Function to update device state
    function updateDeviceStatus(deviceId, status) {
        // Here you can add logic to update the UI
        console.log(`Device status ${deviceId} updated to: ${status}`);
    }

    // Function to search for smart devices
    function discoverSmartDevices() {
        try {
            smartDeviceManager.discover();
            showToast("Search for smart devices started", "\uf108");
        } catch(e) {
            console.error("Smart device search failed:", e);
            showToast("Hardware Search Failed", "\uf071");
        }
    }

    // Timer for detecting smart devices
    Timer {
        id: deviceDiscoveryTimer
        interval: 300,000 // every 5 minutes
        repeat: true
        running: true
        onTriggered: discoverSmartDevices()
    }

    // Function to collect usage data
    function collectUsageData() {
        const now = new Date();
        const hour = now. getHours();
        
        productData.daily.push({
            timestamp: now.toISOString(),
            activeApps: getActiveApplications(),
            cpuUsage: systemMonitor.cpuUsage,
            memoryUsage: systemMonitor.memoryUsage,
            focused: isUserFocused()
        });
        
        // Save data
        saveProductivityData();
    }

    // Function to analyze productivity data
    function analyzeProductivity() {
        const now = new Date();
        const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        
        // Current day analysis
        const todayData = productData.daily.filter(entry => 
            new Date(entry.timestamp).toDateString() === today.toDateString());
        
        if (todayData.length === 0) return null;
        
        // Calculate average resource usage
        const avgCpu = todayData.reduce((sum, entry) => sum + entry.cpuUsage, 0) / todayData.length;
        const avgMemory = todayData.reduce((sum, entry) => sum + entry.memoryUsage, 0) / todayData.length;
        
        // Specify focus periods
        const focusPeriods = detectFocusPeriods(todayData);
        const divisionPeriods = detectDistractionPeriods(todayData);
        
        return {
            productiveHours: focusPeriods.length,
            distributionHours: distributionPeriods.length,
            avgCpu: avgCpu,
            avgMemory: avgMemory,
            focusPeriods: focusPeriods,
            distributionPeriods: distributionPeriods,
            productScore: calculateProductivityScore(focusPeriods, distributionPeriods)
        };
    }

    // Function to specify focus periods
    function detectFocusPeriods(data) {
        const focusPeriods = [];
        let currentPeriod = null;
        
        for (let i = 0; i < data.length; i++) {
            if (data[i].focused) {
                if(!currentPeriod) {
                    currentPeriod = {
                        start: data[i].timestamp,
                        end: data[i].timestamp,
                        duration: 0.1
                    };
                } else {
                    currentPeriod.end = data[i].timestamp;
                    currentPeriod.duration++;
                }
            } else {
                if (currentPeriod && currentPeriod.duration >= 5) {//Focus period of more than 5 data points
                    focusPeriods.push(currentPeriod);
                }
                currentPeriod = null;
            }
        }
        
        if (currentPeriod && currentPeriod.duration >= 5) {
            focusPeriods.push(currentPeriod);
        }
        
        return focusPeriods;
    }

    // Function to specify distraction periods
    function detectDistractionPeriods(data) {
        const divisionPeriods = [];
        let currentPeriod = null;
        
        for (let i = 0; i < data.length; i++) {
            if(!data[i].focused) {
                if(!currentPeriod) {
                    currentPeriod = {
                        start: data[i].timestamp,
                        end: data[i].timestamp,
                        duration: 1,
                        apps: new Set(data[i].activeApps)
                    };
                } else {
                    currentPeriod.end = data[i].timestamp;
                    currentPeriod.duration++;
                    data[i].activeApps.forEach(app => currentPeriod.apps.add(app));
                }
            } else {
                if (currentPeriod && currentPeriod.duration >= 5) {
                    distributionPeriods.push(currentPeriod);
                }
                currentPeriod = null;
            }
        }
        
        if (currentPeriod && currentPeriod.duration >= 5) {
            distributionPeriods.push(currentPeriod);
        }
        
        return divisionPeriods;
    }

    // Function to calculate productivity score
    function calculateProductivityScore(focusPeriods, divisionPeriods) {
        const totalFocusMinutes = focusPeriods.reduce((sum, period) => sum + period.duration, 0) * 5; // Each data point is 5 minutes
        const totalDistractionMinutes = disturbancePeriods.reduce((sum, period) => sum + period.duration, 0) * 5;
        
        if (totalFocusMinutes + totalDistractionMinutes === 0) return 0;
        
        return Math.round((totalFocusMinutes / (totalFocusMinutes + totalDistractionMinutes)) * 100);
    }

    // Function to generate the productivity report
    function generateProductivityReport() {
        const analysis = analyzeProductivity();
        if(!analysis) return "There is not enough data to generate a report.";
        
        return `Your Productivity Report:\n` +
            `- Focus Hours: ${analysis.productiveHours}\n` +
            `- Distraction Hours: ${analysis.distractionHours}\n` +
            Average CPU usage: ${analysis.avgCpu.toFixed(1)}%\n` +
            Average memory usage: ${analysis.avgMemory.toFixed(1)}%\n` +
            `- Productivity score: ${analysis.productivityScore}%\n\n` +
            Tips to improve your productivity:\n` +
            `- ${getProductivityRecommendation(analysis)}`;
    }

    // Function to get recommendations for improving productivity
    function getProductivityRecommendation(analysis) {
        if (analysis.productivityScore < 50) {
            return "Here are some recommendations to improve your productivity:\n" +
                "- Try to reduce the use of distracting apps like social media\n" +
                "- Set aside specific times to focus on important tasks\n" +
                "- Use focus mode when working on critical tasks";
        } else if (analysis.productivityScore < 75) {
            return "Here are some recommendations to improve your productivity:\n" +
                "- Try to improve your concentration intervals\n" +
                "- Reduce frequent switching between applications\n" +
                "- Allocate enough time for rest between work periods";
        } else {
            return "Your productivity performance is excellent! Here are some tips to maintain this level:\n"+
                "- Continue to use focus times efficiently\n" +
                "- Make sure you take enough breaks\n" +
                "- Try to improve the quality of work rather than quantity";
        }
    }

    // Temporary to collect usage data
    Timer {
        id: usageDataCollector
        interval: 300,000 // every 5 minutes
        repeat: true
        running: true
        onTriggered: collectUsageData()
    }

    // Temporary for productivity analysis
    Timer {
        id: productAnalyzer
        interval: 3,600,000 // every hour
        repeat: true
        running: true
        onTriggered: {
            const report = generateProductivityReport();
            crosireChatMessages.push({
                message: report,
                isUser: false
            });
        }
    }

    // Function to store productivity data
    function saveProductivityData() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/home/user/.crosire/productivity.json";
            fs.write(JSON.stringify(productivityData));
        } catch(e) {
            console.error("Failed to save throughput data:", e);
        }
    }

    // Function to load productivity data
    function loadProductivityData() {
        try {
            const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            fs.source = "/home/user/.crosire/productivity.json";
            const data = fs.read();
            if(data) {
                productData = JSON.parse(data);
            }
        } catch(e) {
            console.error("Failed to load throughput data:", e);
        }
    }

    // Load productivity data on startup
    Component.onCompleted: {
        loadProductivityData();
    }

    //=============
    // Task Management
    //=============
    property var tasks: []
    property var taskCategories: ["General", "Work", "Study", "Personal"]

    // Function to add a new task
    function addTask(description, category, priority, dueDate) {
        const task = {
            id: Date.now(),
            description: description,
            category: category,
            priority: priority,
            dueDate: dueDate,
            completed: false,
            createdAt: new Date().toISOString(),
            notes: "",
            subtasks: []
        };
        
        tasks.push(task);
        saveTasks();
        
        // Send an automatic reminder
        scheduleTaskReminder(task);
        
        return task;
    }

    // Function to delete a task
    function deleteTask(taskId) {
        tasks = tasks.filter(task => task.id!== taskId);
        saveTasks();
    }

    // Function to modify a task
    function updateTask(taskId, updates) {
        const index = tasks.findIndex(task => task.id === taskId);
        if(index!== -1) {
            tasks[index] = {...tasks[index], ...updates};
            saveTasks();
            
            //if the expiration date is updated, reschedule the reminder
            if (updates.dueDate) {
                scheduleTaskReminder(tasks[index]);
            }
        }
    }

    // Function to mark a task as finished
    function completeTask(taskId, completed = true) {
        const index = tasks.findIndex(task => task.id === taskId);
        if(index!== -1) {
            tasks[index].completed = completed;
            tasks[index].completedAt = completed ? new Date().toISOString(): null;
            saveTasks();
        }
    }

    // Function to schedule task reminders
    function scheduleTaskReminder(task) {
        const timeUntilDue = new Date(task.dueDate) - new Date();
        if (timeUntilDue > 0) {
            setTimeout(() => {
                notificationSystem.notificationReceived("Tasks", "Task Reminder", 
                    "Task completion date:" + task.description, "\uf021");
                
                // Send a reminder to Crosire
                crosireChatMessages.push({
                    message: "Reminder: Task end date '" + task.description + "' is now!",
                    isUser: false
                });
            }, timeUntilDue - 3600000); // Reminder an hour before the appointment
        }
    }

    // Function to save tasks
    function saveTasks() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/home/user/.crosire/tasks.json";
            fs.write(JSON.stringify(tasks));
        } catch(e) {
            console.error("Failed to save tasks:", e);
        }
    }

    // Function to load tasks
    function loadTasks() {
        try {
            const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            fs.source = "/home/user/.crosire/tasks.json";
            const data = fs.read();
            if(data) {
                tasks = JSON.parse(data);
                
                // Reschedule reminders
                tasks.forEach(task => {
                    if(!task.completed) {
                        scheduleTaskReminder(task);
                    }
                });
            }
        } catch(e) {
            console.error("Failed to load tasks:", e);
        }
    }

    // Function to analyze tasks
    function analyzeTasks() {
        const today = new Date();
        const tomorrow = new Date();
        tomorrow.setDate(today.getDate() + 1);
        
        const overdueTasks = tasks.filter(task => 
            !task.completed && new Date(task.dueDate) < today);
        
        const todayTasks = tasks.filter(task => 
            !task.completed && 
            new Date(task.dueDate).toDateString() === today.toDateString());
        
        const tomorrowTasks = tasks.filter(task => 
            !task.completed && 
            new Date(task.dueDate).toDateString() === tomorrow.toDateString());
        
        return {
            overdue: overdueTasks.length,
            today: todayTasks.length,
            tomorrow: tomorrowTasks.length,
            total: tasks.length,
            completed: tasks.filter(task => task.completed).length
        };
    }

    // Function to generate the task report
    function generateTaskReport() {
        const analysis = analyzeTasks();
        
        return `Task Report:\n` +
            `- Late tasks: ${analysis.overdue}\n` +
            `- Today's tasks: ${analysis.today}\n` +
            `- Tasks tomorrow: ${analysis.tomorrow}\n` +
            `- Total tasks: ${analysis.total}\n` +
            `- Completed tasks: ${analysis.completed}`;
    }

    // Temporary for task analysis
    Timer {
        id: taskAnalysisTimer
        interval: 3,600,000 // every hour
        repeat: true
        running: true
        onTriggered: {
            const report = generateTaskReport();
            crosireChatMessages.push({
                message: report,
                isUser: false
            });
        }
    }

    // Load tasks on startup
    Component.onCompleted: {
        loadTasks();
    }

    //====================
    // Dynamic themes
    //===================
    property var lightThemeColors: {
        "colors": [
            "#FFFFFF", "#C50F1F", "#00C214", "#C19C00", "#00A1F1", "#BB0099", "#00C2C2", "#333333"
            "#CCCCCC", "#E74856", "#16C60C", "#F9F12D", "#3B96D1", "#C218D1", "#1BA1E2", "#000000"
        ],
        "special": {
            "background": "#FFFFFF",
            "foreground": "#333333"
        }
    }

    property var darkThemeColors: {
        "colors": [
            "#000000", "#C50F1F", "#00C214", "#C19C00", "#00A1F1", "#BB0099", "#00C2C2", "#CCCCCC",
            "#333333", "#E74856", "#16C60C", "#F9F12D", "#3B96D1", "#C218D1", "#1BA1E2", "#FFFFFF"
        ],
        "special": {
            "background": "#000000",
            "foreground": "#CCCCCC"
        }
    }

    property var performanceThemeColors: {
        "colors": [
            "#000000", "#FF0000", "#00FF00", "#FFFF00", "#00FFFF", "#FF00FF", "#00FF00", "#FFFFFF",
            "#111111", "#FF5555", "#55FF55", "#FFFF55", "#55FFFF", "#FF55FF", "#55FF55", "#EEEEEE"
        ],
        "special": {
            "background": "#000000",
            "foreground": "#FFFFFF"
        }
    }

    property var creativeThemeColors: {
        "colors": [
            "#1E1E1E", "#FF6B6B", "#4ECDC4", "#FFD166", "#6A4C93", "#FF9F1C", "#118AB2", "#FDFCDC",
            "#2B2B2B", "#FF8585", "#6EDCDC", "#FFE085", "#8A6CAB", "#FFB04C", "#31AAB2", "#F5F5F5"
        ],
        "special": {
            "background": "#1E1E1E",
            "foreground": "#FDFCDC"
        }
    }

    // Function to apply the theme
    function applyTheme(themeName) {
        switch(themeName) {
            case "light":
                pywalColors = lightThemeColors;
                break;
            case "dark":
                pywalColors = darkThemeColors;
                break;
            case "performance":
                pywalColors = performanceThemeColors;
                break;
            case "creative":
                pywalColors = creativeThemeColors;
                break;
            default:
                pywalColors = darkThemeColors;
        }
        
        // Send a notification to change the theme
        notificationSystem.notificationReceived("System", "Theme changed" 
            "Theme applied " + themeName, "\uf042");
    }

    // Function to specify the contextual theme
    function applyContextualTheme() {
        const hour = new Date(). getHours();
        
        // Change theme based on time
        if (hour >= 6 && hour < 18) {
            applyTheme("light");
        } else {
            applyTheme("dark");
        }
        
        // Change theme based on activity
        if (systemMonitor.cpuUsage > 70) {
            applyTheme("performance");
        }
        
        // Change theme based on open apps
        const activeApps = getActiveApplications();
        if (activeApps.includes("video-editor")) {
            applyTheme("creative");
        }
    }

    // Temporary to apply the contextual theme
    Timer {
        id: contextualThemeTimer
        interval: 300,000 // every 5 minutes
        repeat: true
        running: true
        onTriggered: applyContextualTheme()
    }

    // AI token
    property string openRouterApiKey: "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"

    // Download Font Awesome 7 fonts
    FontLoader { id: faSolid; source: "qrc:/fonts/fa-solid-900.otf" }
    FontLoader { id: faRegular; source: "qrc:/fonts/fa-regular-400.otf" }
    FontLoader { id: faBrands; source: "qrc:/fonts/fa-brands-400.0tf" }
    
    // Download the basic system fonts
    FontLoader { id: ibmPlex; source: "qrc:/fonts/IBM-Plex-Sans-Thin.ttf" }
    
    // Load Pywal colors dynamically
    property var pywalColors: {
        try {
            const fs = Qt.createQmlObject('import QtQuick 6.8; FileIO', root, "FileIO")
            fs.source = "qrc:/data/pywal.js"
            return JSON.parse(fs.read())
        } catch(e) {
            console.warn("Pywal colors not found, default values are used")
            return {
                "colors": [
                    "#000000", "#C50F1F", "#00C214", "#C19C00", "#00A1F1", "#BB0099", "#00C2C2", "#CCCCCC",
                    "#333333", "#E74856", "#16C60C", "#F9F12D", "#3B96D1", "#C218D1", "#1BA1E2", "#FFFFFF"
                ],
                "special": {
                    "background": "#000000",
                    "foreground": "#CCCCCC"
                }
            }
        }
    }
    
    //===================
    // System state management
    //===================
    // Basic system state properties
    property bool isLocked: true                  // Screen lock status
    property bool isAppLauncherOpen: false        // Application list opening status
    property bool isPowerMenuOpen: false          // Power menu opening status
    property bool isNotificationCenterOpen: false // Notification Center open status
    property bool isWakingUp: false               //the state of waking the device from sleep mode
    property string activeCapsule: ""             //Currently active capsule
    property int activeWorkspace: 1               // Active workspace
    property int totalWorkspaces: 10              // Total workspaces
    property int visibleStart: 1                  //Visual start of workspaces
    property int maxVisible: 5                    // Maximum number of visible workspaces
    property bool isDarkTheme: true               // Dark Theme Status
    property int maxResults: 8                    // Reduce the number of visible elements
    property int debounceTime: 50                 //50ms to update (ensure response < 5ms)

    //=============
    // Context memory
    //=============
    property var conversationHistory: []
    property var userBehaviorPatterns: {}

    // Function to save the conversation
    function saveConversation() {
        const db = LocalStorage.openDatabaseSync("Crosire", "1.0", "Conversation History", 100000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS conversations (id INTEGER PRIMARY KEY, timestamp TEXT, message TEXT, isUser BOOLEAN)');
            // Save the current conversation
            for (let i = 0; i < crosireChatMessages.length; i++) {
                tx.executeSql('INSERT INTO conversations (timestamp, message, isUser) VALUES (?, ?, ?)', 
                [new Date().toISOString(), crosireChatMessages[i].message, crosireChatMessages[i].isUser]);
            }
        });
    }

    //================
    // Manage notifications
    //===============    
    // Corresponding notification colors
    property var notificationColors: [4, 5, 3, 2, 1, 5, 6, 4, 3, 2]
    
    // Active notifications list
    property list<var> activeNotifications: []
    property int maxVisibleNotifications: 3
    property int notificationHeight: 70
    property int notificationSpacing: 10
    
    // Address list
    property var notificationTitles: [
        "The System"
        "Messages",
        "Email",
        "Updates",
        "Calendar",
        "Alarm clock"
        "Alerts",
        "Messages",
        "Battery"
    ]
    
    //=====================
    //Basic controls
    //=====================
    // System controls (Wi-Fi, Bluetooth, etc.)
    property var controlItems: [
        {icon: "\uf1eb", label: "Wi-Fi", colorIndex: 5, active: true},
        {icon: "\uf293", label: "Bluetooth", colorIndex: 4, active: false},
        {icon: "\uf185", label: "Dark Mode", colorIndex: 6, active: true}
    ]
    
    // Application List
    property var appList: [
        {name: "File", icon: "\uf15b", colorIndex: 4},
        {name: "Editor", icon: "\uf58d", colorIndex: 5},
        {name: "Browser", icon: "\uf268", colorIndex: 3},
        {name: "mail", icon: "\uf0e0", colorIndex: 2},
        {name: "Music", icon: "\uf001", colorIndex: 1},
        {name: "Images", icon: "\uf03e", colorIndex: 6},
        {name: "Video", icon: "\uf03d", colorIndex: 4},
        {name: "Notes", icon: "\uf0f6", colorIndex: 5},
        {name: "Fees", icon: "\uf58d", colorIndex: 3},
        {name: "Projects", icon: "\uf187", colorIndex: 2}
    ]
    
    //=====================
    // Basic system components
    //=====================
    
    // Timer to display the time
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            // Update the time in the clock capsule
            if (clockCapsule) clockCapsule.label = Qt.formatTime(new Date(), "hh:mm")
        }
    }
    
    // Temporary to update workspaces
    Timer {
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            getActiveWorkspace();
        }
    }
    
    // Animation to pass workspaces
    NumberAnimation on x {
        id:workspaceScrollAnimation
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    // Animation for gradual appearance
    OpacityAnimation on opacity {
        id: fadeIn
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    // Slide-up animation
    PropertyAction {
        target: statusBar
        property: "y"
        value: 0
    }
    NumberAnimation on y {
        id: slideUp
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    // Animation for the appearance of the expanded music player
    ParallelAnimation {
        id: musicPlayerExpandAnimation
        OpacityAnimation {
            target: musicPlayerExpanded
            property: "opacity"
            from: 0
            to: 1
            duration: 50
        }
        ScaleAnimation {
            target: musicPlayerExpanded
            property: "scale"
            from: 0.95
            to: 1
            duration: 50
        }
    }
    
    // Animation to hide the extended music player
    ParallelAnimation {
        id: musicPlayerCollapseAnimation
        OpacityAnimation {
            target: musicPlayerExpanded
            property: "opacity"
            from: 1
            to: 0
            duration: 50
        }
        ScaleAnimation {
            target: musicPlayerExpanded
            property: "scale"
            from: 1
            to: 0.95
            duration: 50
        }
    }

    //====================
    //Basic island component
    //====================
    Component {
        id: islandComponent
        
        Item {
            id: islandBase
            property real islandHeight: 50
            property color islandColor: Qt.rgba(0, 0, 0, 0.8)
            property bool isFullRounded: true
            property real blurRadius: 32
            property real blurOpacity: 0.8
            
            //Full oval background
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: isFullRounded ? islandHeight / 2 : 15
                color: islandColor
                border.width: 0
                
                // Improve blur (without using FastBlur)
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: isFullRounded ? islandHeight / 2 : 15
                    }
                    opacity: blurOpacity
                }
            }
            
            // Additional transparency improvements
            property real dynamicOpacity: 0.8
            
            //Interactive effect
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }
        }
    }

    Component.onCompleted: {
        // Animation Start
        fadeIn.target = root
        fadeIn.restart()
        statusBar.y = Screen.height
    }

    Item {
        Component.onCompleted: {
            // Read the Alacritty file
            var alacrittyConfig = fileIO.readFile("qrc:/config/alacritty.toml");
            console.log("Alacritty Config:", alacrittyConfig);

            // Read the FastFetch file
            var fastfetchConfig = fileIO.readFile("qrc:/config/config.jsonc");
            console.log("FastFetch Config:", fastfetchConfig);

            // Read Hyprland file
            var hyprlandConfig = fileIO.readFile("qrc:/config/hyprland.conf");
            console.log("Hyprland Config:", hyprlandConfig);
        }
    }

    //=====================
    // Basic system functions
    //=====================
    // Function to extract the active workspace
    function getActiveWorkspace() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["activeworkspace"]);
            process.waitForFinished();
            const output = process.readAllStandardOutput().trim();
            
            if(output && output.includes("workspace ID")) {
                const workspaceId = output.split("workspace ID")[1].split(":")[0].trim();
                activeWorkspace = parseInt(workspaceId);
            }
        } catch(e) {
            console.error("Failed to fetch active workspace:", e);
        }
    }
    
    // Function to change the workspace
    function switchWorkspace(workspaceId) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
        } catch(e) {
            console.error("Workspace change failed:", e);
        }
    }
    
    //======================
    //Customize UI
    //======================
    property var currentUIContext: "default"

    // Function to modify the user interface according to context
    function adaptUIContext() {
        const activeApp = getActiveApplication();
        
        // Change the user interface based on the active application
        switch(activeApp) {
            case "video-editor":
                adaptVideoEditingUI();
                currentUIContext = "video-editor";
                break;
            case "code-editor":
                adaptCodingUI();
                currentUIContext = "code-editor";
                break;
            case "browser":
                adaptBrowsingUI();
                currentUIContext = "browser";
                break;
            default:
                resetToDefaultUI();
                currentUIContext = "default";
        }
        
        // Change the user interface based on the time of day
        const hour = new Date(). getHours();
        if (hour >= 22 || hour < 6) {
            enableNightMode();
        }
    }

    // Function to modify the video editing interface
    function adaptVideoEditingUI() {
        // Simplify the user interface
        statusBar.visible = false;
        // Add custom video editing tools
        videoEditingTools.visible = true;
        // Enlarge the work area
        workspaceArea.scale = 1.1;
        // Change the theme
        applyTheme("creative");
        
        showToast("Video Editing Mode Activated", "\uf03d");
    }

    // Function to modify the programming interface
    function adaptCodingUI() {
        // Change the font to a suitable font for programming
        ibmPlex.source = "qrc:/fonts/IBM-Plex-Mono-Thin.ttf";
        //Enlarge font size slightly
        statusBar.height = 55;
        // Change the theme
        applyTheme("dark");
        
        showToast("Programming Mode Activated", "\uf121");
    }

    // Function to modify the browsing interface
    function adaptBrowsingUI() {
        //Enlarge address bar
        statusBar.height = 65;
        // Change the theme
        applyTheme("light");
        
        showToast("Browsing mode enabled", "\uf268");
    }

    // Function to return the interface to the default
    function resetToDefaultUI() {
        // Resize to default
        statusBar.height = 50;
        // Restore default font
        ibmPlex.source = "qrc:/fonts/IBM-Plex-Sans-Thin.ttf";
        // Restore the default theme
        applyContextualTheme();
        
        statusBar.visible = true;
        videoEditingTools.visible = false;
    }

    // Temporary to modify the UI according to context
    Timer {
        id: uiContextTimer
        interval: 10000 // every 10 seconds
        repeat: true
        running: true
        onTriggered: adaptUIContext()
    }

    //=============
    // Security monitoring
    //=============
    SecurityMonitor {
        id: securityMonitor
        updateInterval: 30000 // every 30 seconds
        
        onSuspiciousActivityDetected: {
            // Send an alert to Crosire
            crosireSecurityAlert("Suspicious activity detected: " + activityDescription);
            
            // Propose security measures
            crosireChatMessages.push({
                message: "Suspicious activity detected: " + activityDescription + 
                        ". Do you want to take the following security measures: " + recommendedActions.join(","),
                isUser: false
            });
        }
    }

    // Function to send a security alert
    function crosireSecurityAlert(message) {
        notificationSystem.notificationReceived("Security", "Security Alert", message, "\uf023");
        logSecurityEvent(message);
    }

    // Function to record the security event
    function logSecurityEvent(message) {
        const timestamp = new Date().toISOString();
        const logEntry = `[${timestamp}] ${message}`;
        
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/var/log/crosire-security.log";
            fs.append(logEntry + "\n");
        } catch(e) {
            console.error("Security event registration failed:", e);
        }
    }

    // Function to check suspicious activities
    function checkForSuspiciousActivities() {
        try {
            // Check system logs
            const suspendedPatterns = [
                /failed login/i,
                /unauthorized access/i,
                /suspicious port scan/i
            ];
            
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/var/log/auth.log";
            const logContent = fs.read();
        
            for (const pattern of suspendedPatterns) {
                if (pattern.test(logContent)) {
                    securityMonitor.suspiciousActivityDetected("A suspicious pattern was detected in the system logs");
                    break;
                }
            }
            
            // Check active processes
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ps", ["aux"]);
            process.waitForFinished();
            const processOutput = process.readAllStandardOutput().trim();
            
            if(processOutput.includes("suspicious-process")) {
                securityMonitor.suspiciousActivityDetected("Suspicious operation detected");
            }
        } catch(e) {
            console.error("Suspicious activity scan failed:", e);
        }
    }

    // Temporary to check for suspicious activities
    Timer {
        id: securityCheckTimer
        interval: 300,000 // every 5 minutes
        repeat: true
        running: true
        onTriggered: checkForSuspiciousActivities()
    }

    //===========
    // Lock screen
    //===========
    Item {
        id: lockScreen
        anchors.fill: parent
        visible: isLocked
        color: "#000000"

        //Basic variables
        property bool isAODActive: false
        property bool isWakingUp: false
        property int aodDelay: 5000 // 5 seconds
        property int largeClockSize: parent.height * 0.28
        property int smallClockSize: parent.height * 0.08

        // AOD mode activation timer
        Timer {
            id: aodTimer
            interval: aodDelay
            onTriggered: {
                if (isLocked &&!isAODActive && !isWakingUp) {
                    enterAODMode()
                }
            }
        }

        //Time update timer
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                clockDisplay.text = Qt.formatTime(new Date(), "hh:mm")
                if(!isAODActive && !isWakingUp) {
                    clockAnimation.to = largeClockSize
                    clockAnimation.restart()
                }
            }
        }

        //===============================
        // Lock screen elements
        //===============================

        // AOD mode status indicator
        Rectangle {
            id: aodIndicator
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: 10
            height: 10
            radius: 5
            color: isAODActive? pywalColors.colors[6] : "#333333"
            opacity: isAODActive ? 1.0 : 0.3
            visible: isLocked
        }

        // Display the large clock (3/4 of the screen)
        Text {
            id: clockDisplay
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.15
            font.family: "IBM Plex Sans Thin"
            font.pixelSize: largeClockSize
            color: pywalColors.colors[7]
            text: Qt.formatTime(new Date(), "hh:mm")
            horizontalAlignment: Text.AlignHCenter
            opacity: 0 // Start invisible

            // Animation of a big clock
            NumberAnimation on font.pixelSize {
                id: clockAnimation
                duration: animationDuration
                easing.type: animationEasing
            }

            OpacityAnimation on opacity {
                id: largeClockFade
                duration: animationDuration
                easing.type: animationEasing
            }
        }

        // Display user information
        Item {
            id: userInfo
            anchors.top: clockDisplay.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: 30
            opacity: 0

            OpacityAnimation on opacity {
                id: userInfoFade
                duration: animationDuration
                easing.type: animationEasing
            }

            Text {
                text: "Hello, " + userName
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[5]
                horizontalAlignment: Text.AlignHCenter
                width: parent.width * 0.8
            }
        }

        // Unlock status indicator
        property bool isUnlocking: false
        property real unlockProgress: 0.0

        // Unlock animation
        NumberAnimation {
            id: unlockAnimation
            target: lockScreen
            property: "unlockProgress"
            from: 1.0
            to: 0.0
            duration: 450
            easing.type: Easing.OutCubic
            onRunningChanged: {
                if(!running && to == 0.0) {
                    //start status bar animation after unlock animation is complete                statusBarAnimation.restart()
                }
            }
        }

        // Status bar animation
        NumberAnimation {
            id: statusBarAnimation
            target: statusBar
            property: "y"
            from: Screen.height
            to: Screen.height - statusBar.height - 20
            duration: 350
            easing.type: Easing.OutBack
            onRunningChanged: {
                if(!running && to == Screen.height - statusBar.height - 20) {
                    // Unlock complete, hide lock screen                isLocked = false
                }
            }
        }

        // Effect of light wave when unlocking    Rectangle {
            id: unlockEffect
            width: 0
            height: 0
            radius: width/2
            color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.5)
            anchors.centerIn: parent

            OpacityAnimation on opacity {
                duration: 300
                from: 1.0
                to: 0.0
                easing.type: Easing.OutCubic
            }

            NumberAnimation on width {
                duration: 500
                from: 0
                to: Math.max(Screen.width, Screen.height)*2
                easing.type: Easing.OutCubic
            }

            NumberAnimation on height {
                duration: 500
                from: 0
                to: Math.max(Screen.width, Screen.height)*2
                easing.type: Easing.OutCubic
            }
        }

        //===============================
        // AOD (Always On Display) feature
        //===============================

        // Small clock display (for AOD mode)
        Text {
            id: smallClockDisplay
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.05
            font.family: "IBM Plex Sans Thin"
            font.pixelSize: smallClockSize
            color: pywalColors.colors[7]
            text: Qt.formatTime(new Date(), "hh:mm")
            horizontalAlignment: Text.AlignHCenter
            opacity: 0 // Start invisible

            OpacityAnimation on opacity {
                id: smallClockFade
                duration: animationDuration
                easing.type: animationEasing
            }

            Timer {
                interval: 1000
                repeat: true
                running: true
                onTriggered: {
                    smallClockDisplay.text = Qt.formatTime(new Date(), "hh:mm")
                }
            }
        }

        // Light effect for AOD mode
        Rectangle {
            anchors.fill: parent
            radius: parent.height * 0.04
            color: "transparent"
            border.color: pywalColors.colors[7]
            border.width: 1
            visible: lockScreen.isAODActive
        }

        // Awakening animation from AOD mode
        Text {
            id: wakeUpClock
            anchors.centerIn: parent
            font.family: "IBM Plex Sans Thin"
            font.pixelSize: 1
            color: pywalColors.colors[7]
            text: Qt.formatTime(new Date(), "hh:mm")
            opacity: 0

            OpacityAnimation on opacity {
                id: wakeUpAnimation
                duration: 300
                from: 0
                to: 1
                easing.type: Easing.OutCubic
            }

            NumberAnimation on font.pixelSize {
                id: wakeUpSizeAnimation
                duration: 300
                from: 1
                to: largeClockSize
                easing.type: Easing.OutCubic
            }
        }

        //===============================
        // AOD mode control functions
        //===============================
        // Function to enter AOD mode
        function enterAODModeMCX() {
            if (isLocked &&!isWakingUp) {
                isAODActive = true;
                aodTimer.stop();

                //Hide large items very quickly (less than 5ms)
                largeClockFade.to = 0;
                largeClockFade.duration = 4; // Instant response
                largeClockFade.restart();

                userInfo.visible = false;
                userInfoFade.to = 0;
                userInfoFade.duration = 4;
                userInfoFade.restart();

                // Small clock display
                smallClockDisplay.visible = true;
                smallClockFade.to = 1;
                smallClockFade.duration = 4;
                smallClockFade.restart();

                // Fast light effect for AOD mode
                aodLightEffect.start();
            }
        }

        function wakeUpFromAOD() {
            if (isAODActive) {
                isWakingUp = true;
                isAODActive = false;

                // Hide the small clock
                smallClockFade.to = 0;
                smallClockFade.restart();

                // Large clock display with smooth animation
                clockDisplay.visible = true;
                clockAnimation.to = largeClockSize;
                clockAnimation.restart();

                userInfo.visible = true;
                userInfoFade.to = 1;
                userInfoFade.restart();

                // Restart AOD timer
                aodTimer.start();
                isWakingUp = false;
            }
        }

        //===============
        // Event handling
        //===============
        //process mouse events to wake up the device
        MouseArea {
            anchors.fill: parent
            enabled: isAODActive
            onPressed: {
                wakeUpFromAOD()
            }
        }

        // Process keyboard events to wake the device from AOD
        Keys.onPressed: {
            if (isAODActive) {
                wakeUpFromAOD()
            }
        }

        // Turn on the AOD timer when the screen is locked
        Component.onCompleted: {
            if (isLocked) {
                aodTimer.start()
            }
        }

        //Lock screen background effect    Rectangle {
            anchors.fill: parent
            color: "#000000"
        }

        //==================
        // Unlock processing
        //==================
        // Close when background is clicked
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (isLocked &&!isAODActive) {
                    launcherCloseAnimation.onCompleted = function() {
                        isAppLauncherOpen = false
                    }
                    launcherCloseAnimation.restart()

                    // Effect of a click on the application 
                    parent.children[0].scale = 0.95
                    setTimeout(function() {
                        parent.children[0].scale = 1.0
                    }, 100)
                }
            }
        }

        // Password input field
        Rectangle {
            id: passwordInput
            width: 300
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 25
            color: "#1E1E1E"
            border.color: pywalColors.colors[2]
            border.width: 1
            opacity: 0

            OpacityAnimation on opacity {
                id: passwordFade
                duration: animationDuration
                easing.type: animationEasing
            }

            TextInput {
                anchors.fill: parent
                anchors.margins: 10
                text: ""
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 20
                color: pywalColors.colors[7]
                echoMode: TextInput.Password
                focus: true
                horizontalAlignment: TextInput.AlignHCenter
                onAccepted: {
                    // Start animation Close lock screen                isUnlocking = true
                    unlockAnimation.restart()
                }
            }

            // Animation of interaction with the mouse        ScaleAnimation on scale {
                target: parent
                from: 1
                to: 1.05
                duration: 150
                easing.type: Easing.OutBounce
                triggeredOnStart: false
            }

            MouseArea {
                anchors.fill: parent
                onClicked: parent.scale = 1.05
                onReleased: parent.scale = 1.0
            }
        }
    }

    //=================
    //Automatic optimization
    //=================
    Timer {
        id: autoOptimizeTimer
        interval: 600,000 // every 10 minutes
        repeat: true
        running: true
        onTriggered: autoOptimizeSystem()
    }

    // Function to clean cache
    function cleanTemporaryFiles() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("rm", ["-rf", "/tmp/*"]);
            process.start("journalctl", ["--vacuum-size=100M"]);
            showToast("Temporary files cleaned", "\uf014");
        } catch(e) {
            console.error("Failed to clean temporary files:", e);
        }
    }

    // Function to improve system performance
    function optimizeSystemPerformance() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("sysctl", ["vm.swappiness=10"]);
            process.start("sysctl", ["vm.vfs_cache_pressure=50"]);
            showToast("System performance improved", "\uf085");
        } catch(e) {
            console.error("System performance optimization failed:", e);
        }
    }

    //============
    // Status bar
    //============
    // Status bar area
    Item {
        id: statusBar
        width: parent.width
        height: 50
        anchors.top: parent.top
        z: 999
        
        // Background
        Rectangle {
            id: statusBarBackground
            anchors.fill: parent
            color: "#000000"
            opacity: 0.7
            
            // Glass effect
            GlassMorphismEffect {
                radius: 20
                intensity: 0.7
                enabled: true
            }
        }
        
        // Capsule layout
        RowLayout {
            id: capsuleLayout
            anchors.fill: parent
            anchors.margins: 5
            Spacing: 10

        Item {
            id: capsuleLayout
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.7
            height: 60
            spacing: 10 // Distance between capsules

            // List of capsules
            Repeater {
                model: ["arch", "activeWindow", "workspaces", "music", "keyboard", "network", "volume", "battery", "clock", "crosire", "notifire", "settings", "power"]
                delegate: Capsule {
                    id: capsule
                    icon: "\uf017" // Capsule icon
                    label: modelData === "clock" ? "The clock": ""
                    colorIndex: index %6
                    capsuleId: modelData
                    width: 100
                    height: 50
                    x: index * (100 + 10) // Specify the original location of the capsule

                    // Expansion Animation
                    ParallelAnimation {
                        id: expandAnimation
                        NumberAnimation {
                            target: capsule
                            property: "width"
                            to: 450
                            duration: 50
                            easing.type: Easing.OutQuart
                        }
                        ScaleAnimation {
                            target: capsuleBase
                            property: "scale"
                            to: 1.05
                            duration: 50
                            easing.type: Easing.OutQuart
                        }

                        // Move other capsules
                        ScriptAction {
                            script: {
                                for (let i = 0; i < capsuleLayout.children.length; i++) {
                                    let child = capsuleLayout.children[i];
                                    if (child!== capsule && child.x > capsule.x) {
                                        moveCapsule(child, child.x, child.x + 350);
                                    }
                                }
                            }
                        }
                    }

                    // Shrinkage animation
                    ParallelAnimation {
                        id: collapseAnimation
                        NumberAnimation {
                            target: capsule
                            property: "width"
                            to: 100
                            duration: 50
                            easing.type: Easing.OutQuart
                        }
                        ScaleAnimation {
                            target: capsuleBase
                            property: "scale"
                            to: 1
                            duration: 50
                            easing.type: Easing.OutQuart
                        }

                        // Return the capsules to their original locations
                        ScriptAction {
                            script: {
                                for (let i = 0; i < capsuleLayout.children.length; i++) {
                                    let child = capsuleLayout.children[i];
                                    if (child!== capsule && child.x > capsule.x) {
                                        moveCapsule(child, child.x, child.x - 350);
                                    }
                                }
                            }
                        }
                    }

                    //Click interaction
                    onClicked: {
                        if(!isExpanded) {
                            // Close all other capsules quickly
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }

                            // Expand this capsule
                            expandAnimation.restart();
                            isExpanded = true;
                        } else {
                            // Close this capsule
                            collapseAnimation.restart();
                            isExpanded = false;
                        }
                    }
                }
            }

            // Function to move capsules
            function moveCapsule(capsule, fromX, toX) {
                NumberAnimation {
                    target: capsule
                    property: "x"
                    from: fromX
                    to: toX
                    duration: 50
                    easing.type: Easing.OutQuart
                }.start();
            }
        }
            
        //=================
        // ArchStart Capsule
        //=================
        Capsule {
            id: archCapsule
            icon: "\f669"
            colorIndex: 5
            capsuleId: "arch"
            width: 50
            height: 50
            property bool isExpanded: false
            property bool isSearching: false
            property string searchQuery: ""
            property var searchResults: []
            property int activeResultIndex: -1
            property bool showResults: false
            
            // Performance characteristics
            property int debounceTime: 50 // 50ms to update (ensure < 5ms response)
            property int maxResults: 8
            property var searchTimer: null
            property bool isProcessing: false
            
            // Expansion Animation 
            ParallelAnimation {
                id: archExpandAnimation
                NumberAnimation {
                    target: archCapsule
                    property: "width"
                    to: 600
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.05
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }
            
            // Shrinkage animation 
            ParallelAnimation {
                id: archCollapseAnimation
                NumberAnimation {
                    target: archCapsule
                    property: "width"
                    to: 50
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }
            
            // Base capsule (circular)
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width/2
                color: "#000000"
                border.width: 0
                
                // Icon
                Text {
                    anchors.centerIn: parent
                    text: archCapsule.icon
                    font.family: faBrands.name
                    font.pixelSize: 20
                    color: pywalColors.colors[colorIndex]
                }
            }
            
            // Hover animation 
            ScaleAnimation {
                id: hoverAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Mouse interaction
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                
                onEntered: {
                    if(!isExpanded) {
                        hoverAnimation.running = true;
                    }
                }
                
                onExited: {
                    hoverAnimation.to = 1.0;
                    hoverAnimation.running = true;
                    if(!isExpanded) capsuleBase.scale = 1.0;
                }
                
                onClicked: {
                    if(!isExpanded) {
                        // Close all other capsules quickly
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        // Expand this capsule
                        expandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        // View ArchStart Capsule
                        archContent.visible = true;
                        archContent.opacity = 0;
                        fadeInAnimation.target = archContent;
                        fadeInAnimation.restart();
                        
                        // Focus on the search bar
                        searchInput.forceActiveFocus();
                    } else {
                        // Close this capsule
                        archCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        // Hide ArchStart Capsule
                        fadeOutAnimation.target = archContent;
                        fadeOutAnimation.onCompleted = function() {
                            archContent.visible = false;
                        };
                        fadeOutAnimation.restart();
                    }
                }
            }
            
            //====================
            // ArchStart interface
            //====================
            Item {
                id: archContent
                anchors.fill: parent
                visible: false
                opacity: 0
                
                //Search Island 
                Item {
                    id: islandContainer
                    width: parent.width * 0.9
                    height: 50
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    
                    //Full oval background
                    Rectangle {
                        id: islandBackground
                        anchors.fill: parent
                        radius: 25
                        color: Qt.rgba(0, 0, 0, 0.85)
                        border.width: 0
                        
                        // Improve blur
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Rectangle {
                                width: parent.width
                                height: parent.height
                                radius: 25
                            }
                            opacity: 0.7
                        }
                    }
                    
                    // Search bar
                    Rectangle {
                        id: searchInputContainer
                        anchors.fill: parent
                        radius: 25
                        color: "#000000"
                        border.width: 0
                        
                        TextInput {
                            id: searchInput
                            anchors.fill: parent
                            anchors.margins: 15
                            text: ""
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[5]
                            placeholderText: "Find apps, files, settings..."
                            placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                            selectByMouse: true
                            focus: false
                            maximumLength: 100
                            
                            // Update event
                            onTextChanged: {
                                if (isProcessing) return;
                                
                                searchQuery = text;
                                activeResultIndex = -1;
                                
                                if (searchTimer) {
                                    clearTimeout(searchTimer);
                                }
                                
                                if(text.length > 0) {
                                    isProcessing = true;
                                    searchTimer = setTimeout(function() {
                                        performSearch(text);
                                        isProcessing = false;
                                    }, debounceTime);
                                } else {
                                    searchResults = [];
                                    showResults = false;
                                }
                            }
                            
                            //Stock key processing
                            Keys.onUpPressed: {
                                event.accepted = true;
                                if (activeResultIndex > 0) {
                                    activeResultIndex--;
                                }
                            }
                            
                            Keys.onDownPressed: {
                                event.accepted = true;
                                if (activeResultIndex < Math.min(maxResults, searchResults.length) - 1) {
                                    activeResultIndex++;
                                }
                            }
                            
                            // Execute the selection
                            Keys.onReturnPressed: {
                                event.accepted = true;
                                if (activeResultIndex >= 0 && activeResultIndex < searchResults.length) {
                                    executeResult(searchResults[activeResultIndex]);
                                }
                            }
                            
                            // Close results
                            Keys.onEscapePressed: {
                                event.accepted = true;
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        }
                    }
                }
                
                // Search results
                ListView {
                    id: resultsList
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.85
                    height: Math.min(maxResults * 50, searchResults.length * 50)
                    model: searchResults.length > 0 && showResults ? searchResults: null
                    clip: true
                    interactive: false
                    visible: searchResults.length > 0 && showResults
                    
                    delegate: SearchResultItem {
                        width: parent.width
                        height: 50
                        result: modelData
                        isActive: index === archContent.activeResultIndex
                        onClicked: {
                            archContent.executeResult(modelData);
                        }
                    }
                    
                    // Appearance animation
                    OpacityAnimation on opacity {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 0
                        to: 1
                    }
                }
            }
            
            // Appearance animation
            OpacityAnimation {
                id: fadeInAnimation
                from: 0
                to: 1
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            //Disappearance Animation
            OpacityAnimation {
                id: fadeOutAnimation
                from: 1
                to: 0
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            //=======================
            // Search and processing functions
            //=======================
            
            //Main search function
            function performSearch(query) {
                if (query.length === 0) {
                    searchResults = [];
                    showResults = false;
                    return;
                }
                
                const startTime = performance.now();
                
                // Clear old results
                searchResults = [];
                showResults = true;
                
                // 1. Search for applications
                const apps = searchApplications(query);
                searchResults = searchResults.concat(apps.map(app => ({
                    type: "app",
                    title: app.name,
                    subtitle: "Application",
                    icon: app.icon,
                    action: function() {
                        // Run the application
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("exec", [app.exec]);
                        } catch(e) {
                            console.error("Application failed to launch:", e);
                        }
                    }
                })));
                
                // Load applications from .desktop files
                property var apps: loadDesktopApps("/usr/share/applications");

                function loadDesktopApps(path) {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("ls", [path]);
                    process.waitForFinished();
                    const files = process.readAllStandardOutput().trim().split("\n");
                    
                    const appList = [];
                    for (const file of files) {
                        if(file.endsWith(".desktop")) {
                            const desktopFile = readDesktopFile(path + "/" + file);
                            if (desktopFile) {
                                appList.push(desktopFile);
                            }
                        }
                    }
                    return appList;
                }

                function readDesktopFile(filePath) {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("cat", [filePath]);
                    process.waitForFinished();
                    const content = process.readAllStandardOutput().trim();
                    
                    const app = {};
                    const lines = content.split("\n");
                    for (const line of lines) {
                        if (line.startsWith("Name=")) {
                            app.name = line.split("=")[1];
                        } else if (line.startsWith("Exec=")) {
                            app.exec = line.split("=")[1];
                        } else if (line.startsWith("Icon=")) {
                            app.icon = line.split("=")[1];
                        }
                    }
                    return app;
                }

                // Download apps using Depender
                function loadDesktopApps() {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("depender", ["list", "-j"]);
                    process.waitForFinished();
                    
                    if (process.exitCode() === 0) {
                        const output = process.readAllStandardOutput().trim();
                        try {
                            return JSON.parse(output);
                        } catch(e) {
                            console.error("Depender output analysis failed:", e);
                        }
                    }
                    return [];
                }

                // Run an application using Depender
                function runApp(appName) {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("depender", ["run", appName]);
                }

                // 2. Search for files
                const files = searchFiles(query);
                searchResults = searchResults.concat(files.map(file => ({
                    type: "file",
                    title: file.name,
                    subtitle: file.path,
                    icon: "\uf15b",
                    action: function() {
                        // Open file
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xdg-open", [file.path]);
                        } catch(e) {
                            console.error("Failed to open file:", e);
                        }
                    }
                })));
                
                // 3. Find settings
                const settings = searchSettings(query);
                searchResults = searchResults.concat(settings.map(setting => ({
                    type: "setting",
                    title: setting.title,
                    subtitle: setting.section,
                    icon: "\uf013",
                    action: function() {
                        // Open certain settings
                        try {
                            loader.source = "qrc:/SettingsApp/SettingsApp.qml";
                            settingsApp.activeTab = setting.tab;
                            isAppLauncherOpen = false;
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        } catch(e) {
                            console.error("Failed to open settings:", e);
                        }
                    }
                })));
                
                // 4. Package Search (Pacman and AUR)
                if(query.length >= 3) { // Only search at least 3 characters
                    searchPackages(query);
                }
                
                // 5. Simple command processing
                const commands = processCommands(query);
                if(commands) {
                    searchResults.unshift({
                        type: "command",
                        title: commands.title,
                        subtitle: commands.description,
                        icon: "\uf120",
                        action: commands.action
                    });
                }
                
                // Restrict the number of results
                searchResults = searchResults.slice(0, maxResults);
                
                // Performance measurement
                const endTime = performance.now();
                const duration = endTime - startTime;
                console.log(`The search took ${duration.toFixed(2)}ms`);
                
                // Ensure a response of less than 5ms
                if (duration > 5) {
                    console.warn(`Warning: Search time exceeded 5ms (${duration.toFixed(2)}ms)`);
                }
            }
            
            // Application search function
            function searchApplications(query) {
                try {
                    const apps = [];
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    
                    // Use xdg-desktop-menu to get applications
                    process.start("find", ["/usr/share/applications", "-name", "*.desktop"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput().trim();
                    
                    const desktopFiles = output.split('\n');
                    for (const file of desktopFiles) {
                        if(!file) continue;
                        
                        // Read the .desktop file
                        const appProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        appProcess.start("grep", ["-E", "^(Name|Exec|Icon)=", file]);
                        appProcess.waitForFinished();
                        const appOutput = appProcess.readAllStandardOutput().trim();
                        
                        let name = "", exec = "", icon = "";
                        const lines = appOutput.split('\n');
                        for (const line of lines) {
                            if (line.startsWith("Name=")) {
                                name = line.substring(5);
                            } else if (line.startsWith("Exec=")) {
                                exec = line.substring(5).split('%')[0].trim();
                            } else if (line.startsWith("Icon=")) {
                                icon = line.substring(5);
                            }
                        }
                        
                        if (name && exec && (name.toLowerCase().includes(query.toLowerCase()) || 
                            exec.toLowerCase().includes(query.toLowerCase()))) {
                            apps.push({ name, exec, icon});
                        }
                    }
                    
                    return apps;
                } catch(e) {
                    console.error("App search failed:", e);
                    return [];
                }
            }
            
            // File search function
            function searchFiles(query) {
                try {
                    const files = [];
                    const homeDir = "/home/" + Qt.application.arguments[2];
                    
                    // Search main folders
                    const dirs = [
                        homeDir + "/Documents",
                        homeDir + "/Pictures",
                        homeDir + "/Downloads",
                        homeDir + "/Music",
                        homeDir + "/Videos"
                    ];
                    
                    for (const dir of dirs) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("find", [dir, "-maxdepth", "1", "-iname", `*${query}*`, "-type", "f"]);
                            process.waitForFinished(500); // 500ms timeout for search
                            
                            if(process.running) {
                                process.kill();
                                continue;
                            }
                            
                            const output = process.readAllStandardOutput().trim();
                            const foundFiles = output.split('\n');
                            
                            for (const file of foundFiles) {
                                if(!file) continue;
                                
                                const fileName = file.split('/').pop();
                                files.push({
                                    name: fileName,
                                    path: file
                                });
                                
                                // Do not exceed the maximum results
                                if (files.length >= maxResults) break;
                            }
                            
                            // Do not exceed the maximum results
                            if (files.length >= maxResults) break;
                        } catch(e) {
                            console.error("Failed to search folder:", dir, e);
                        }
                    }
                    
                    return files;
                } catch(e) {
                    console.error("File search failed:", e);
                    return [];
                }
            }
            
            // Settings search function
            function searchSettings(query) {
                const settings = [];
                const lowerQuery = query.toLowerCase();
                
                // Screen settings
                if("screen".includes(lowerQuery) || "display".includes(lowerQuery) || 
                    "Brightness".includes(lowerQuery) || "brightness".includes(lowerQuery) ||
                    "Accuracy".includes(lowerQuery) || "resolution".includes(lowerQuery)) {
                    settings.push({
                        title: "Screen Settings",
                        section: "Screen and Display",
                        tab: "display"
                    });
                }
                
                // Sound settings
                if("voice".includes(lowerQuery) || "volume".includes(lowerQuery) || 
                    "microphone".includes(lowerQuery) || "microphone".includes(lowerQuery)) {
                    settings.push({
                        title: "Audio Settings",
                        section: "Audio and Image"
                        tab: "audio"
                    });
                }
                
                // Network Settings
                if("network".includes(lowerQuery) || "network".includes(lowerQuery) || 
                    "Wi-Fi".includes(lowerQuery) || "wifi".includes(lowerQuery) ||
                    "Bluetooth".includes(lowerQuery) || "bluetooth".includes(lowerQuery)) {
                    settings.push({
                        title: "Network Settings",
                        section: "Contact",
                        tab: "network"
                    });
                }
                
                // Battery settings
                if("battery".includes(lowerQuery) || "battery".includes(lowerQuery) || 
                    "Energy".includes(lowerQuery) || "power".includes(lowerQuery)) {
                    settings.push({
                        title: "Battery Settings",
                        section: "Energy",
                        tab: "power"
                    });
                }
                
                //Animation settings
                if("Animation".includes(lowerQuery) || "Animation".includes(lowerQuery) || 
                    "Movement".includes(lowerQuery) || "motion".includes(lowerQuery)) {
                    settings.push({
                        title: "Animation Settings",
                        section: "Visual Experience",
                        tab: "animations"
                    });
                }
                
                return settings;
            }
            
            // Packet search function
            function searchPackages(query) {
                try {
                    // Search for Pacman packages
                    const pacmanProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    pacmanProcess.start("pacman", ["-Ss", query]);
                    pacmanProcess.waitForFinished(1000); // 1 second timeout
                    
                    if (pacmanProcess.exitCode() === 0) {
                        const output = pacmanProcess.readAllStandardOutput().trim();
                        const lines = output.split('\n');
                        
                        for (const line of lines) {
                            if (line.startsWith("core/") || line.startsWith("extra/") || 
                                line.startsWith("community/") || line.startsWith("multilib/")) {
                                
                                const parts = line.split(' ');
                                const pkgName = parts[0];
                                const pkgDesc = parts.slice(1).join(' ');
                                
                                searchResults.push({
                                    type: "package",
                                    title: pkgName,
                                    subtitle: "Pacman Package -" + pkgDesc,
                                    icon: "\uf17c",
                                    action: function() {
                                        try {
                                            const termProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                            termProcess.start("alacritty", ["-e", "sudo", "pacman", "-S", "--noconfirm", pkgName]);
                                        } catch(e) {
                                            console.error("Failed to open terminal:", e);
                                        }
                                    }
                                });
                                
                                // Do not exceed the maximum results
                                if (searchResults.length >= maxResults) return;
                            }
                        }
                    }
                    
                    // Search for AUR packages
                    const aurProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    aurProcess.start("yay", ["-Ss", query]);
                    aurProcess.waitForFinished(1000); // 1 second timeout
                    
                    if (aurProcess.exitCode() === 0) {
                        const output = aurProcess.readAllStandardOutput().trim();
                        const lines = output.split('\n');
                        
                        for (const line of lines) {
                            if(line.startsWith("aur/")) {
                                const parts = line.split(' ');
                                const pkgName = parts[0].replace("aur/", "");
                                const pkgDesc = parts.slice(1).join(' ');
                                
                                searchResults.push({
                                    type: "package",
                                    title: pkgName,
                                    subtitle: "AUR package - " + pkgDesc,
                                    icon: "\uf17c",
                                    action: function() {
                                        try {
                                            const termProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                            termProcess.start("alacritty", ["-e", "yay", "-S", "--noconfirm", pkgName]);
                                        } catch(e) {
                                            console.error("Failed to open terminal:", e);
                                        }
                                    }
                                });
                                
                                // Do not exceed the maximum results
                                if (searchResults.length >= maxResults) return;
                            }
                        }
                    }
                } catch(e) {
                    console.error("Failed to find packages:", e);
                }
            }
            
            // Simple command processing function
            function processCommands(query) {
                const lowerQuery = query.toLowerCase();
                
                //Timer order
                const timerMatch = lowerQuery.match(/^(set|add|create|start)\s+(\d+)\s*(second|minute|hour|second|minute|hour)/);
                if(timerMatch) {
                    const amount = parseInt(timerMatch[2]);
                    const unit = timerMatch[3];
                    let seconds = 0;
                    
                    if (unit.includes("second") || unit === "second") {
                        seconds = amount;
                    } else if (unit.includes("minute") || unit === "minute") {
                        seconds = amount * 60;
                    } else if (unit.includes("hour") || unit === "hour") {
                        seconds = amount * 3600;
                    }
                    
                    if (seconds > 0) {
                        return {
                            title: `temporary ${amount} ${unit}`,
                            description: `You will be alerted after ${amount} ${unit}`,
                            action: function() {
                                // Run the timer
                                clockExpanded.activeTimer = {
                                    id: Date.now(),
                                    endTime: Date.now() + (seconds*1000),
                                    isActive: true,
                                    paused: false,
                                    soundPath: "/usr/share/sounds/classic-alarm.wav"
                                };
                                clockExpanded.checkDynamicIsland();
                                
                                // Close the search capsule
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        };
                    }
                }
                
                // Alarm command
                const alarmMatch = lowerQuery.match(/^(set|add|create|set)\s+alarm\s+l\s+(\d{1,2}):(\d{2})/);
                if (alarmMatch) {
                    const hour = parseInt(alarmMatch[2]);
                    const minute = parseInt(alarmMatch[3]);
                    
                    if (hour >= 0 && hour <= 23 && minute >= 0 && minute <= 59) {
                        return {
                            title: `alarm ${hour}:${minute}`,
                            description: `You will be alerted at ${hour}:${minute}`,
                            action: function() {
                                // Add alarm
                                clockExpanded.alarms.push({
                                    id: Date.now(),
                                    time: `${hour < 10 ? '0' : ''}${hour}:${minute < 10 ? '0': ''}${minute}`,
                                    label: "Custom Alarm Clock",
                                    days: [true, true, true, true, true, true, true],
                                    isActive: true,
                                    soundPath: "/usr/share/sounds/classic-alarm.wav"
                                });
                                
                                // Close the search capsule
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        };
                    }
                }
                
                // System shutdown command
                if (lowerQuery.includes("Shutdown") || lowerQuery.includes("shutdown")) {
                    return {
                        title: "Shutdown",
                        description: "Turn off the device",
                        action: function() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("systemctl", ["poweroff"]);
                            } catch(e) {
                                console.error("Shutdown Failed:", e);
                            }
                            
                            // Close the search capsule
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        }
                    };
                }
                
                // Restart command
                if(lowerQuery.includes("reboot") || lowerQuery.includes("reboot")) {
                    return {
                        title: "Restart",
                        description: "Restart the device",
                        action: function() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("systemctl", ["reboot"]);
                            } catch(e) {
                                console.error("Restart Failed:", e);
                            }
                            
                            // Close the search capsule
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        }
                    };
                }
                
                return null;
            }
            
            // Result execution function
            function executeResult(result) {
                if (result && result.action) {
                    result.action();
                }
            }
            
            //=======================
            // User interface components
            //=======================
            
            // Search result component
            Component {
                id: searchResultComponent
                
                Item {
                    id: searchResult
                    property var result
                    property bool isActive: false
                    width: parent.width
                    height: 50
                    
                    // Background
                    Rectangle {
                        anchors.fill: parent
                        radius: 15
                        color: searchResult.isActive ? 
                            Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1): 
                            "#000000"
                        border.width: 0
                    }
                    
                    // Icon
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: searchResult.result.icon
                        font.family: searchResult.result.type === "package" ? faBrands.name : faSolid.name
                        font.pixelSize: 18
                        color: pywalColors.colors[5]
                    }
                    
                    // Address
                    Text {
                        anchors.left: iconText.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: searchResult.result.title
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[5]
                        elide: Text.ElideRight
                        width: parent.width * 0.6
                    }
                    
                    // Description
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: searchResult.result.subtitle
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                        elide: Text.ElideRight
                        width: parent.width * 0.3
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            if (searchResult.onClicked) {
                                searchResult.onClicked();
                            }
                        }
                        onEntered: {
                            parent.scale = 1.02;
                        }
                        onExited: {
                            parent.scale = 1.0;
                        }
                    }
                }
            }
        }

        //================================
        // Process keyboard shortcuts
        //================================
        Keys.onPressed: {
            // Meta shortcut to open the ArchStart capsule
            if (event.key === Qt.Key_Meta && !isExpanded && activeCapsule === "") {
                archCapsule.onClicked();
                event.accepted = true;
            }
            
            //Esc shortcut to close the ArchStart capsule
            if (event.key === Qt.Key_Escape && isExpanded) {
                archCollapseAnimation.restart();
                isExpanded = false;
                activeCapsule = "";
                event.accepted = true;
            }
        }
            
        //==========================
        // Capsule name of the active application
        //=========================
        Capsule {
            id: activeWindowCapsule
            icon: "\uf2d2" // Window icon from Font Awesome 7
            label: activeWindowName || "Desktop"
            colorIndex: 3
            capsuleId: "activeWindow"
            width: activeWindowCapsule.implicitWidth + 20
            
            property string activeWindowName: "Desktop"
            property string activeWindowIcon: "\uf10c" // Default icon
            
            // Function to extract active window information
            function getActiveWindowInfo() {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("hyprctl", ["activewindow"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput().trim();
                    
                    if(output && output.includes("class:")) {
                        const className = output.split("class:")[1].split("\n")[0].trim();
                        activeWindowName = className;
                        
                        // You can add logic to display additional information about the window
                        console.log("Active Window Details:", activeWindowName);
                    }
                } catch(e) {
                    console.error("Failed to fetch active window information:", e);
                }
            }
            
            // Temporary to update active window information
            Timer {
                interval: 1000
                repeat: true
                running: true
                onTriggered: getActiveWindowInfo()
            }
            
            // Base capsule
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: 25
                color: "#000000"
                border.width: 0
                layer.enabled: isExpanded || isAnimating
                layer.smooth: isExpanded
                layer.effect: isExpanded ? dropShadowEffect: null

                onVisibleChanged: {
                    if(!visible) {
                        layer.enabled = false;
                    }
                }

                // Window icon
                Text {
                    id: windowIcon
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: activeWindowIcon
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: pywalColors.colors[colorIndex]
                    
                    Component.onCompleted: {
                        iconAnimation.restart();
                    }
                }
                
                // Window title
                Text {
                    id: windowTitle
                    anchors.left: windowIcon.right
                    anchors.leftMargin: 10
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: activeWindowName
                    font.family: ibmPlex.name
                    font.pixelSize: 16
                    color: pywalColors.colors[colorIndex]
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }
            }

            //======================
            //Music player capsule
            //======================
            Capsule {
                icon: "\uf001"  //Music icon
                label: musicPlayer.isPlaying ? "turns on": "off"
                colorIndex: 6
                capsuleId: "music"
                width: 120
                height: 50
                property bool isExpanded: false

                //Music properties
                property bool isPlaying: false
                property string currentTitle: "No music playing"
                property string currentArtist: ""
                property double progress: 0.0
                property double duration: 180.0 // 3 minutes by default
                property double position: 0.0

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: musicHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Expansion Animation
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 250
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    // Add a "click" effect on click
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        from: 1.1
                        duration: 50
                        easing.type: Easing.OutBack
                        delay: 100
                    }
                }

                // Shrinkage animation
                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 100
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Click animation on click
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }

                //Click processing
                onClicked: {
                    if(!isExpanded) {
                        // Close all other capsules quickly
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }

                        // Expand this capsule
                        musicExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;

                        // Display the expanded music player
                        musicPlayerExpanded.visible = true;
                        musicPlayerExpanded.z = 100;
                        
                        // Start updating music data
                        musicPlayerExpanded.musicDataTimer.running = true;
                        musicPlayerExpanded.updateMusicDisplay();
                    } else {
                        // Close this capsule
                        musicCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";

                        // Hide the extended music player
                        musicPlayerExpanded.visible = false;
                        musicPlayerExpanded.musicDataTimer.running = false;
                    }
                }

                //============================
                //Extended music player interface
                //============================
                Item {
                    id: musicPlayerExpanded
                    anchors.fill: parent
                    visible: false
                    z: 100

                    // Temporary to update music data
                    Timer {
                        id: musicDataTimer
                        interval: 1000
                        repeat: true
                        running: false
                        onTriggered: {
                            updateMusicData();
                        }
                    }

                    // Function to update music data
                    function updateMusicData() {
                        try {
                            // Get a list of available music players
                            const dbus = Qt.createQmlObject('import Qt.labs.dbus 6.8; DBus', root, "DBus");
                            const players = getAvailablePlayers();
                            
                            if(players.length > 0) {
                                const player = players[0];
                                
                                // Set music properties
                                currentTitle = getTrackTitle(player);
                                currentArtist = getArtist(player);
                                duration = getDuration(player);
                                position = getPosition(player);
                                progress = duration > 0? position / duration: 0;
                                isPlaying = isPlaying(player);
                                
                                // Update the capsule
                                musicCapsule.label = isPlaying ? "on": "off";
                                
                                // Update display
                                if (visible) {
                                    updateMusicDisplay();
                                }
                            } else {
                                //No active music player
                                currentTitle = "No music playing";
                                currentArtist = "";
                                progress = 0.0;
                                isPlaying = false;
                                musicCapsule.label = "Stopped";
                                
                                if (visible) {
                                    updateMusicDisplay();
                                }
                            }
                        } catch(e) {
                            console.error("Music data update failed:", e);
                        }
                    }

                    // Function to update the user interface
                    function updateMusicDisplay() {
                        if(!visible) return;
                        
                        // Update texts
                        musicTitle.text = currentTitle;
                        musicArtist.text = currentArtist;
                        
                        // Update progress bar
                        progressBar.width = musicProgressContainer.width * progress;
                        
                        // Update control buttons
                        playPauseButton.icon = isPlaying ? "\uf04c" : "\uf04b"; // Stop/play icon
                    }

                    //====================
                    // Music player interface
                    //====================
                    Rectangle {
                        id: musicContainer
                        anchors.fill: parent
                        color: "#000000"
                        visible: false
                        z: 100

                        // Background with blur effect
                        FastBlur {
                            anchors.fill: parent
                            source: parent
                            radius: 32
                            opacity: 0.8
                        }

                        //Music information
                        ColumnLayout {
                            anchors.centerIn: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            Spacing: 20
                            width: parent.width * 0.8

                            // Path information
                            Item {
                                width: parent.width
                                height: 60

                                Text {
                                    id: musicTitle
                                    text: currentTitle
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 18
                                    color: pywalColors.colors[7]
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Text {
                                    id: musicArtist
                                    anchors.top: musicTitle.bottom
                                    anchors.topMargin: 5
                                    text: currentArtist
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[6]
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                    horizontalAlignment: Qt.AlignHCenter
                                }
                            }

                            // Progress bar
                            Item {
                                id: musicProgressContainer
                                width: parent.width
                                height: 10

                                Rectangle {
                                    anchors.fill: parent
                                    radius: 5
                                    color: "#333333"
                                }

                                Rectangle {
                                    id: progressBar
                                    height: parent.height
                                    radius: 5
                                    color: pywalColors.colors[6]
                                    width: musicProgressContainer.width*progress
                                }

                                // Show time
                                RowLayout {
                                    anchors.top: musicProgressContainer.bottom
                                    anchors.topMargin: 5
                                    width: parent.width
                                    Spacing: 20

                                    Text {
                                        text: formatTime(position)
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 12
                                        color: pywalColors.colors[6]
                                        Layout.alignment: Qt.AlignLeft
                                    }

                                    Item {
                                        Layout.fillWidth: true
                                    }

                                    Text {
                                        text: formatTime(duration)
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 12
                                        color: pywalColors.colors[6]
                                        Layout.alignment: Qt.AlignRight
                                    }
                                }
                            }

                            // Control buttons
                            RowLayout {
                                Spacing: 25
                                Layout.alignment: Qt.AlignHCenter

                                //Previous button
                                MusicButton {
                                    icon: "\uf048"
                                    tooltip: "previous path"
                                    onClicked: {
                                        previousTrack();
                                        updateMusicData();
                                    }
                                }

                                //Play button/Stop
                                MusicButton {
                                    id: playPauseButton
                                    icon: isPlaying ? "\uf04c" : "\uf04b"
                                    tooltip: isPlaying ? "off": "on"
                                    width: 40
                                    height: 40
                                    onClicked: {
                                        if (isPlaying) {
                                            pauseTrack();
                                        } else {
                                            playTrack();
                                        }
                                        isPlaying = !isPlaying;
                                        updateMusicDisplay();
                                    }
                                }

                                //Next button
                                MusicButton {
                                    icon: "\uf051"
                                    tooltip: "Next path"
                                    onClicked: {
                                        nextTrack();
                                        updateMusicData();
                                    }
                                }
                            }
                        }
                    }

                    //====================
                    //Music service functions
                    //====================
                    // Time format function
                    function formatTime(seconds) {
                        if(!seconds || isNaN(seconds)) return "0:00";
                        let minutes = Math.floor(seconds / 60);
                        let remainingSeconds = Math.floor(seconds % 60);
                        return minutes + ":" + (remainingSeconds < 10 ? "0" : "") + remainingSeconds;
                    }

                    // Function to get available music players
                    function getAvailablePlayers() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", ["--session", "org.freedesktop.DBus", "/org/freedesktop/DBus", "org.freedesktop.DBus.ListNames"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            const players = [];
                            const lines = output.split('\n');
                            for (let i = 0; i < lines.length; i++) {
                                if (lines[i].includes("org.mpris.MediaPlayer2")) {
                                    players.push(lines[i]);
                                }
                            }
                            
                            return players;
                        } catch(e) {
                            console.error("Failed to fetch music players:", e);
                            return [];
                        }
                    }

                    // Function to get the path address
                    function getTrackTitle(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            // Parse the output to get the path address
                            const metadata = parseMetadata(output);
                            return metadata["xesam:title"] || "Unknown title";
                        } catch(e) {
                            console.error("Failed to fetch path address:", e);
                            return "Unknown address";
                        }
                    }

                    // Function to get the artist's name
                    function getArtist(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            // Parse the output to get the artist name
                            const metadata = parseMetadata(output);
                            const artist = metadata["xesam:artist"] || "Unknown artist";
                            return Array.isArray(artist)? artist[0] : artist;
                        } catch(e) {
                            console.error("Failed to fetch artist name:", e);
                            return "Unknown Artist";
                        }
                    }

                    // Function to get the path duration
                    function getDuration(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            // Parse the output to get the duration
                            const metadata = parseMetadata(output);
                            const durationMicroseconds = metadata["mpris:length"] || 0;
                            return durationMicroseconds / 1000000; // Convert to seconds
                        } catch(e) {
                            console.error("Failed to fetch path duration:", e);
                            return 180; // 3 minutes by default
                        }
                    }

                    // Function to get the current location
                    function getPosition(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Position"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            // Convert position from microseconds to seconds
                            const positionMicroseconds = parseInt(output);
                            return positionMicroseconds / 1000000;
                        } catch(e) {
                            console.error("Failed to fetch current location:", e);
                            return 0;
                        }
                    }

                    // Function to check the operating status
                    function isPlaying(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "PlaybackStatus"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            return output.includes("Playing");
                        } catch(e) {
                            console.error("Failed to fetch operating status:", e);
                            return false;
                        }
                    }

                    // Function to run
                    function playTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if(players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Play"]);
                            process.waitForFinished();
                        } catch(e) {
                            console.error("Failed to run path:", e);
                        }
                    }

                    // Stop function
                    function pauseTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if(players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Pause"]);
                            process.waitForFinished();
                        } catch(e) {
                            console.error("Failed to stop path:", e);
                        }
                    }

                    // Function for the previous path
                    function previousTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if(players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Previous"]);
                            process.waitForFinished();
                        } catch(e) {
                            console.error("Failed to move to previous path:", e);
                        }
                    }

                    // Function for the next path
                    function nextTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if(players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Next"]);
                            process.waitForFinished();
                        } catch(e) {
                            console.error("Failed to move to the next path:", e);
                        }
                    }

                    // Function to analyze meta data
                    function parseMetadata(metadataOutput) {
                        try {
                            const result = {};
                            const lines = metadataOutput.split('\n');
                            
                            for (let i = 0; i < lines.length; i++) {
                                if (lines[i].includes("variant")) {
                                    const key = lines[i - 1]. trim();
                                    const value = lines[i + 1]. trim();
                                    
                                    if (key.includes("xesam:") || key.includes("mpris:")) {
                                        // Remove quotes and navigation
                                        let cleanValue = value.replace(/"/g, '').trim();
                                        
                                        // Process array values
                                        if (cleanValue.startsWith('[') && cleanValue.endsWith(']')) {
                                            cleanValue = cleanValue.substring(1, cleanValue.length - 1)
                                                .split(',')
                                                .map(item => item.trim().replace(/"/g, ''));
                                        }
                                        
                                        result[key] = cleanValue;
                                    }
                                }
                            }
                            
                            return result;
                        } catch(e) {
                            console.error("Meta data analysis failed:", e);
                            return {};
                        }
                    }
                }
            }

            //====================
            //Music button component
            //====================
            Item {
                id: MusicButton
                property string icon
                property string tooltip
                width: 35
                height: 35
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 17
                    color: "#000000"
                    border.width: 0
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: MusicButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                    
                    // Animation of interaction with the mouse
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            parent.scale = 1.05
                        }
                        onReleased: {
                            parent.scale=1.0
                        }
                        onClicked: {
                            if (MusicButton.onClicked) {
                                MusicButton.onClicked()
                            }
                        }
                        onEntered: {
                            if(MusicButton.tooltip) {
                                showTooltip(MusicButton.tooltip, mouseX, mouseY)
                            }
                        }
                        onExited: {
                            hideTooltip()
                        }
                    }
                }
            }

            //====================
            //Tips management functions
            //====================
            function showTooltip(text, x, y) {
                tooltipText.text = text
                tooltip.visible = true
                tooltip.x=x+10
                tooltip.y = y - 30
            }

            function hideTooltip() {
                tooltip.visible = false
            }

            //====================
            // Advice element
            //====================
            Rectangle {
                id: tooltip
                width: tooltipText.implicitWidth + 20
                height: tooltipText.implicitHeight + 10
                radius: 10
                color: Qt.rgba(0, 0, 0, 0.8)
                border.width: 0
                visible: false
                z: 999
                
                Text {
                    id: tooltipText
                    anchors.centerIn: parent
                    color: pywalColors.colors[7]
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                }
            }

            //====================
            // Workspace Capsule
            //====================
            Capsule {
                icon: "\uf111" // Empty circle icon
                label: activeWorkspace.toString()
                colorIndex: 6
                capsuleId: "workspaces"
                width: 180
                height: 50
                property int activeWorkspace: 1
                property int visibleStart: 1
                property int maxVisible: 5
                property int totalWorkspaces: 10
                
                // Interaction properties
                property bool isDragging: false
                property var draggingWindow: null
                property var currentWorkspace: null
                property var windowUnderDrag: null
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id:workspacesHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }
                
                // Expansion Animation
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 250
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    // Add a "click" effect on click
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        from: 1.1
                        duration: 50
                        easing.type: Easing.OutBack
                        delay: 100
                    }
                }

                // Shrinkage animation
                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 100
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Click animation on click
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
                
                // Right click processing
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    hoverEnabled: true
                    onClicked: {
                        workspacesOverlay.showWorkspaces();
                    }
                }
                
                // Left-click processing
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        if(!isExpanded) {
                            // Close all other capsules quickly
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            // Expand this capsule
                            workspacesExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            // Display the expanded panel
                            workshopsExpanded.visible = true;
                            workshopsExpanded.z = 100;
                        } else {
                            // Close this capsule
                            workspacesCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                            
                            // Hide the expanded panel
                            workshopsExpanded.visible = false;
                        }
                    }
                }
                
                //====================
                // Expanded Workspace Interface
                //====================
                Item {
                    id:workspacesExpanded
                    anchors.fill: parent
                    visible: false
                    z: 100
                    
                    // Temporary to update workspace information
                    Timer {
                        id:workspaceTimer
                        interval: 500
                        repeat: true
                        running: false
                        onTriggered: {
                            getActiveWorkspace();
                            updateWorkspacesDisplay();
                        }
                    }
                    
                    // Function to extract the active workspace
                    function getActiveWorkspace() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["activeworkspace"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            if(output && output.includes("workspace ID")) {
                                const workspaceId = parseInt(output.split("workspace ID")[1].trim().split("")[0]);
                                if(!isNaN(workspaceId)) {
                                    activeWorkspace = workspaceId;
                                    return workspaceId;
                                }
                            }
                        } catch(e) {
                            console.error("Failed to fetch active workspace:", e);
                        }
                        return 1;
                    }
                    
                    // Function to display workspace information
                    function getWorkspacesInfo() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["workspaces"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            // Analyze the output to get workspace information
                            const workspaces = [];
                            const lines = output.split('\n');
                            
                            for (let i = 0; i < lines.length; i++) {
                                if (lines[i].includes("workspace ID")) {
                                    const workspaceId = parseInt(lines[i].split("workspace ID")[1].trim().split("")[0]);
                                    const windows = [];
                                    
                                    // Add workspace windows
                                    for (let j = i + 1; j < lines.length; j++) {
                                        if (lines[j].includes("workspace ID")) break;
                                        if (lines[j].includes("class:")) {
                                            const className = lines[j].split("class:")[1].trim().split(" ")[0];
                                            const title = lines[j].split("title:")[1].trim();
                                            windows.push({ className, title});
                                        }
                                    }
                                    
                                    workspaces.push({
                                        id:workspaceId,
                                        windows: windows,
                                        active: lines[i].includes("active")
                                    });
                                }
                            }
                            
                            // Sort workspaces by ID
                            workshopspaces.sort((a, b) => a.id - b.id);
                            
                            return workspaces;
                        } catch(e) {
                            console.error("Failed to fetch workspace information:", e);
                            return Array.from({length: totalWorkspaces}, (_, i) => ({
                                id: i + 1,
                                windows: i===0? [{ className: "Shell", title: "Desind"}] : [],
                                active: i === 0
                            }));
                        }
                    }
                    
                    // Function to update the width of workspaces
                    function updateWorkspacesDisplay() {
                        const workshopspaces = getWorkspacesInfo();
                        
                        // Update display
                        workshopspacesGrid.model = workshopspaces;
                        
                        // Update workspace capsule
                        workshopsCapsule.activeWorkspace = getActiveWorkspace();
                        workshopsCapsule.label = workshopsCapsule.activeWorkspace.toString();
                    }
                    
                    // Function to change the workspace
                    function switchWorkspace(workspaceId) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
                            process.waitForFinished();
                            
                            // Update active workspace information
                            activeWorkspace = workspaceId;
                            workshopsCapsule.activeWorkspace = workshopspaceId;
                            workshopsCapsule.label = workshopspaceId.toString();
                            
                            // Close the expanded capsule
                            workspacesCollapseAnimation.restart();
                            workshopsCapsule.isExpanded = false;
                            activeCapsule = "";
                            workshopsExpanded.visible = false;
                        } catch(e) {
                            console.error("Workspace change failed:", e);
                        }
                    }
                    
                    // Function to move a window into a workspace
                    function moveWindowToWorkspace(windowClass, workspaceId) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["dispatch", "movetoworkspace", workspaceId.toString(), windowClass]);
                            process.waitForFinished();
                            
                            // Update the display immediately
                            updateWorkspacesDisplay();
                        } catch(e) {
                            console.error("Failed to move window to workspace:", e);
                        }
                    }
                    
                    // Function to start dragging the window
                    function startDragging(windowItem) {
                        isDragging = true;
                        draggingWindow = windowItem;
                        windowUnderDrag = windowItem.parent.parent;
                        
                        // Add a drag effect
                        windowItem.parent.scale = 1.1;
                        windowItem.parent.z = 100;
                    }
                    
                    // Function to terminate the withdrawal
                    function stopDragging() {
                        isDragging = false;
                        if (draggingWindow) {
                            draggingWindow.parent.scale = 1;
                            draggingWindow.parent.z = 0;
                            draggingWindow = null;
                            windowUnderDrag = null;
                        }
                    }
                    
                    //====================
                    // Expanded Workspace Interface
                    //====================
                    Rectangle {
                        id:workspacesContainer
                        anchors.fill: parent
                        color: "#000000"
                        visible: false
                        z: 100
                        
                        // Background with blur effect
                        FastBlur {
                            anchors.fill: parent
                            source: parent
                            radius: 32
                            opacity: 0.8
                        }
                        
                        // Workspace content
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            Spacing: 20
                            
                            // Panel title
                            Text {
                                text: "Work Spaces"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                                Layout.alignment: Qt.AlignHCenter
                            }
                            
                            // Navigation bar
                            RowLayout {
                                Spacing: 10
                                Layout.alignment: Qt.AlignHCenter
                                
                                //Previous button
                                WorkspaceButton {
                                    icon: "\uf060" // Left arrow icon
                                    onClicked: {
                                        if (visibleStart > 1) {
                                            visibleStart = Math.max(1, visibleStart - 1);
                                            workspaceScrollAnimation.to = -((visibleStart - 1) * 80);
                                            workspaceScrollAnimation.restart();
                                        }
                                    }
                                }
                                
                                // Scroll indicator
                                Rectangle {
                                    width: 150
                                    height: 8
                                    radius: 4
                                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                                    
                                    Rectangle {
                                        id: scrollIndicator
                                        height: parent.height
                                        width: Math.min(150, 150 * (maxVisible / totalWorkspaces))
                                        radius: 4
                                        color: pywalColors.colors[6]
                                        x: 150 * ((visibleStart - 1) / (totalWorkspaces - maxVisible + 1))
                                    }
                                }
                                
                                //Next button
                                WorkspaceButton {
                                    icon: "\uf061" // Right arrow icon
                                    onClicked: {
                                        if (visibleStart < totalWorkspaces - maxVisible + 1) {
                                            visibleStart = Math.min(totalWorkspaces - maxVisible + 1, visibleStart + 1);
                                            workspaceScrollAnimation.to = -((visibleStart - 1) * 80);
                                            workspaceScrollAnimation.restart();
                                        }
                                    }
                                }
                            }
                            
                            //View workspaces
                            Item {
                                id:workspacesScroller
                                width: parent.width
                                height: 120
                                clip: true
                                
                                GridView {
                                    id:workspacesGrid
                                    x: 0
                                    y: 0
                                    width: totalWorkspaces * 80
                                    height: 100
                                    cellWidth: 70
                                    cellHeight: 100
                                    model: 10
                                    delegate: WorkspaceItem {
                                        index: modelData
                                        width: parent.cellWidth
                                        height: parent.cellHeight
                                        opacity:workspacesExpanded.isDragging && windowUnderDrag === parent ? 0.5: 1
                                    }
                                }
                                
                                // Animation of scrolling between workspaces
                                NumberAnimation on x {
                                    id:workspaceScrollAnimation
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                }
                            }
                        }
                    }
                }
            }

            //====================
            // Workspace component
            //====================
            Component {
                id:workspaceItemComponent
                
                Item {
                    id:workspaceItem
                    property int index: 0
                    property bool active: false
                    property var windows: []
                    width: parent.width
                    height: parent.height
                    
                    // Workspace Circle
                    Rectangle {
                        id:workspaceCircle
                        anchors.centerIn: parent
                        width: 25
                        height: 25
                        radius: 12.5
                        color: index + 1 === workshopsCapsule.activeWorkspace ? 
                            Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2): 
                            Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        border.width: 0
                        
                        // Workspace number
                        Text {
                            anchors.centerIn: parent
                            text: (index + 1).toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 12
                            color: index + 1 === workshopsCapsule.activeWorkspace ? 
                                pywalColors.colors[6] : 
                                Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                        }
                    }
                    
                    // Window area
                    Item {
                        id: windowsArea
                        anchors.top: workspaceCircle.bottom
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 40
                        height: 40
                        
                        // Window display
                        Repeater {
                            model: parent.parent.windows || []
                            delegate: WindowItem {
                                index: modelIndex
                                totalWindows: parent.parent.windows.length
                                windowData: modelData
                                width: 30
                                height: 30
                                visible: modelIndex < 4 // Maximum width 4 windows
                                onDragStart: {
                                    workshopsExpanded.startDragging(parent)
                                }
                                onDragEnd: {
                                    workshopsExpanded.stopDragging()
                                }
                                onDrop: {
                                    workspacesExpanded.moveWindowToWorkspace(
                                        windowData.className,
                                        workspaceItem.index + 1
                                    )
                                }
                            }
                        }
                    }
                    
                    // Drag effect
                    Rectangle {
                        id: dragOverlay
                        anchors.fill: parent
                        color: "#000000"
                        opacity: 0.4
                        visible: workshopsExpanded.isDragging && windowUnderDrag === parent
                        radius: 15
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Drop here"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            workshopsExpanded.switchWorkspace(index + 1);
                        }
                        onDoubleClicked: {
                            workshopsExpanded.switchWorkspace(index + 1);
                        }
                        onEntered: {
                            if (index + 1!==workspacesCapsule.activeWorkspace) {
                                workspaceCircle.scale = 1.2;
                            }
                        }
                        onExited: {
                            if (index + 1!==workspacesCapsule.activeWorkspace) {
                                workspaceCircle.scale = 1.0;
                            }
                        }
                    }
                }
            }

            //====================
            //Work window component
            //====================
            Component {
                id: windowItemComponent
                
                Item {
                    id: windowItem
                    property int index: 0
                    property int totalWindows: 0
                    property var windowData: null
                    width: parent.width
                    height: parent.height
                    
                    // Determine the window position
                    property real positionX: {
                        const angle = (index / totalWindows) * 2 * Math.PI - Math.PI / 2;
                        return Math.cos(angle) * 15;
                    }
                    property real positionY: {
                        const angle = (index / totalWindows) * 2 * Math.PI - Math.PI / 2;
                        return Math.sin(angle) * 15;
                    }
                    
                    // Background
                    Rectangle {
                        anchors.fill: parent
                        anchors.horizontalCenter: parent.positionX
                        anchors.verticalCenter: parent.positionY
                        width: 20
                        height: 20
                        radius: 10
                        color: "#000000"
                        border.width: 0
                        
                        // Window icon
                        Text {
                            anchors.centerIn: parent
                            text: "\uf10c" // Default icon
                            font.family: faSolid.name
                            font.pixelSize: 12
                            color: pywalColors.colors[7]
                        }
                    }
                    
                    // Animation of interaction with the mouse
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            // Activate drag mode
                            windowItem.scale = 1.05
                            windowItem.parent.parent.parent.parent.startDragging(windowItem)
                        }
                        onReleased: {
                            windowItem.scale = 1.0
                            windowItem.parent.parent.parent.parent.stopDragging()
                        }
                        onPositionChanged: {
                            if (windowItem.parent.parent.parent.parent.isDragging) {
                                // Pull movement
                                x = mouse.x - width/2
                                y = mouse.y - height/2
                            }
                        }
                    }
                }
            }

            //====================
            // Workspace button component
            //====================
            Component {
                id:workspaceButtonComponent
                
                Item {
                    id:workspaceButton
                    property string icon
                    width: 40
                    height: 40
                    
                    // Background
                    Rectangle {
                        anchors.fill: parent
                        radius: 20
                        color: "#000000"
                        border.width: 0
                        
                        // Icon
                        Text {
                            anchors.centerIn: parent
                            text: workspaceButton.icon
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        // Animation of interaction with the mouse
                        ScaleAnimation on scale {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 1.0
                            to: 1.05
                            running: false
                        }
                        
                        // Interaction area
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onPressed: {
                                parent.scale = 1.05
                            }
                            onReleased: {
                                parent.scale=1.0
                            }
                            onClicked: {
                                if (workspaceButton.onClicked) {
                                    workspaceButton.onClicked()
                                }
                            }
                        }
                    }
                }
            }

            //====================
            // MCX Workspaces Panel
            //====================
            Item {
                id:workspacesOverlay
                anchors.fill: parent
                visible: false
                z: 998
                property bool isDragging: false
                property var draggingWindow: null
                property var currentWorkspace: null
                property var windowUnderDrag: null

                // Transparent background
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                    opacity: 0.7
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            workspacesOverlay.visible = false;
                            //make sure all expanded capsules are closed
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                        }
                    }
                }

                // Workspace panel content
                Rectangle {
                    id:workspacesContent
                    width: parent.width * 0.9
                    height: parent.height * 0.6
                    radius: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    color: "#000000"
                    border.width: 0
                    opacity: 0.92

                    //Mild blur effect
                    FastBlur {
                        anchors.fill: parent
                        source: parent
                        radius: 25
                        opacity: 0.7
                    }

                    // Address bar
                    Rectangle {
                        width: parent.width
                        height: 60
                        color: "#000000"
                        border.width: 0

                        Text {
                            anchors.centerIn: parent
                            text: "Work Spaces"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 20
                            color: pywalColors.colors[6]
                        }

                        // Close button
                        MouseArea {
                            anchors.right: parent.right
                            anchors.rightMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            width: 40
                            height: 40
                            onClicked: {
                                workspacesOverlay.visible = false;
                                //make sure all expanded capsules are closed
                                for (let i = 0; i < capsuleLayout.children.length; i++) {
                                    let child = capsuleLayout.children[i];
                                    if (child.isExpanded) {
                                        child.collapseAnimation.restart();
                                        child.isExpanded = false;
                                    }
                                }
                            }

                            Rectangle {
                                width: 30
                                height: 30
                                radius: 15
                                color: "#000000"
                                border.width: 0
                                anchors.centerIn: parent

                                Text {
                                    anchors.centerIn: parent
                                    text: "\uf00d" // Close icon
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[6]
                                }
                            }
                        }
                    }

                    // Workspace content
                    GridView {
                        id:workspacesGrid
                        anchors.top: titleBar.bottom
                        anchors.topMargin: 15
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        cellWidth: (parent.width * 0.85)/5
                        cellHeight: (parent.height * 0.6 - 85)/2
                        model: 10
                        delegate: WorkspaceItemOverlay {
                            index: modelData
                            width: parent.cellWidth
                            height: parent.cellHeight
                            opacity: isDragging ? (modelData === currentIndex ? 1: 0.5): 1
                        }
                    }
                }

                // Function to load workspace information
                function loadWorkspacesInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["workspaces"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        // Analyze the output to get workspace information
                        const workspaces = [];
                        const lines = output.split('\n');
                        
                        for (let i = 0; i < lines.length; i++) {
                            if (lines[i].includes("workspace ID")) {
                                const workspaceId = parseInt(lines[i].split("workspace ID")[1].trim().split("")[0]);
                                const windows = [];
                                
                                // Add workspace windows
                                for (let j = i + 1; j < lines.length; j++) {
                                    if (lines[j].includes("workspace ID")) break;
                                    if (lines[j].includes("class:")) {
                                        const className = lines[j].split("class:")[1].trim().split(" ")[0];
                                        const title = lines[j].split("title:")[1].trim();
                                        windows.push({ className, title});
                                    }
                                }
                                
                                workspaces.push({
                                    id:workspaceId,
                                    windows: windows,
                                    active: lines[i].includes("active")
                                });
                            }
                        }
                        
                        // Update the user interface
                        workshopspacesGrid.model = workshopspaces;
                        
                    } catch(e) {
                        console.error("Failed to fetch workspace information:", e);
                        // Use default data
                        workshopspacesGrid.model = Array.from({length: 10}, (_, i) => ({
                            id: i + 1,
                            windows: i % 2 === 0 ? [{ className: "Code", title: "main.qml"}] : [],
                            active: i === 0
                        }));
                    }
                }

                // Function to update the workspace window
                function updateWorkspaceWindow(workspaceId, windowClass, windowTitle) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["dispatch", "movetoworkspace", workspaceId.toString(), windowClass]);
                        process.waitForFinished();
                        
                        // Update the display immediately
                        loadWorkspacesInfo();
                    } catch(e) {
                        console.error("Workspace update failed:", e);
                    }
                }

                // Function to activate the workspace
                function activateWorkspace(workspaceId) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
                        process.waitForFinished();
                        
                        // Close the panel
                        workspacesOverlay.visible = false;
                    } catch(e) {
                        console.error("Workspace activation failed:", e);
                    }
                }

                // Function to operate the board
                function showWorkspaces() {
                    // Close all expanded capsules
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded) {
                            child.collapseAnimation.restart();
                            child.isExpanded = false;
                        }
                    }
                    
                    // Download workspace information
                    loadWorkspacesInfo();
                    
                    // Panel width
                    visible = true;
                }

                // Function to handle window dragging
                function startDragging(windowItem) {
                    isDragging = true;
                    draggingWindow = windowItem;
                    windowUnderDrag = windowItem.parent.parent;
                    
                    // Add a drag effect
                    windowItem.parent.scale = 1.1;
                    windowItem.parent.z = 100;
                }

                // Function to terminate the withdrawal
                function stopDragging() {
                    isDragging = false;
                    if (draggingWindow) {
                        draggingWindow.parent.scale = 1;
                        draggingWindow.parent.z = 0;
                        draggingWindow = null;
                        windowUnderDrag = null;
                    }
                }
            }

            //====================
            // Workspace component of the panel
            //====================
            Component {
                id:workspaceItemOverlayComponent
                
                Item {
                    id:workspaceItem
                    property int index: 0
                    property bool active: false
                    property var windows: []
                    width: parent.width
                    height: parent.height
                    
                    // Background
                    Rectangle {
                        anchors.fill: parent
                        radius: 15
                        color: active ? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1): "#000000"
                        border.width: 0
                        
                        // Workspace number
                        Text {
                            anchors.top: parent.top
                            anchors.topMargin: 15
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: (index + 1).toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 24
                            color: active ? pywalColors.colors[6] : pywalColors.colors[7]
                        }
                        
                        // Content of workspace windows
                        ColumnLayout {
                            anchors.top: titleText.bottom
                            anchors.topMargin: 15
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Spacing: 10
                            anchors.margins: 10
                            
                            Repeater {
                                model: parent.parent.windows || []
                                delegate: WindowItemOverlay {
                                    width: parent.width
                                    height: 30
                                    windowData: modelData
                                    onDragStart: {
                                        workspacesOverlay.startDragging(parent)
                                    }
                                    onDragEnd: {
                                        workspacesOverlay.stopDragging()
                                    }
                                    onDrop: {
                                        workspacesOverlay.updateWorkspaceWindow(
                                            workspaceItem.index + 1,
                                            modelData.className,
                                            modelData.title
                                        )
                                    }
                                }
                            }
                        }
                    }
                    
                    // Drag effect
                    Rectangle {
                        id: dragOverlay
                        anchors.fill: parent
                        color: "#000000"
                        opacity: 0.4
                        visible: workshopsOverlay.isDragging && parent.parent.index === workshopsOverlay.currentIndex
                        radius: 15
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Drop here"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            workspacesOverlay.activateWorkspace(index + 1);
                        }
                        onDoubleClicked: {
                            workspacesOverlay.activateWorkspace(index + 1);
                        }
                    }
                }
            }

            //====================
            // Working window component of the panel
            //====================
            Component {
                id: windowItemOverlayComponent
                
                Item {
                    id: windowItem
                    property var windowData: null
                    width: parent.width
                    height: parent.height
                    
                    // Background
                    Rectangle {
                        anchors.fill: parent
                        radius: 10
                        color: "#000000"
                        border.width: 0
                        
                        // Window icon
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: "\uf10c" // Default icon
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        // Window title
                        Text {
                            anchors.left: iconText.right
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text: windowData ? windowData.title: "Window"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[7]
                            width: parent.width * 0.7
                            elide: Text.ElideRight
                        }
                        
                        // Drag icon
                        Text {
                            anchors.right: parent.right
                            anchors.rightMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: "\uf0b6"
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    // Animation of interaction with the mouse
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    // Interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            // Activate drag mode
                            windowItem.scale = 1.05
                            workspacesOverlay.startDragging(windowItem)
                        }
                        onReleased: {
                            windowItem.scale = 1.0
                            workspacesOverlay.stopDragging()
                        }
                        onPositionChanged: {
                            if (workspacesOverlay.isDragging) {
                                // Pull movement
                                x = mouse.x - width/2
                                y = mouse.y - height/2
                            }
                        }
                    }
                }
            }

            //=====================
            // Keyboard capsule
            //=====================
            Capsule {
                id: keyboardCapsule
                icon: "\uf11c" // Keyboard icon from Font Awesome 7
                label: "EN" "AR"
                colorIndex: 5
                capsuleId: "keyboard"
                width: 80
                
                property var layouts: ["EN", "AR"]
                property int currentLayoutIndex: 0
                
                // Function to extract the current keyboard layout
                function getCurrentLayout() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["devices"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        if(output && output.includes("keyboard:")) {
                            const keyboardInfo = output.split("keyboard:")[1].split("=============================")[0];
                            if(keyboardInfo.includes("active keymap:")) {
                                const keymap = keyboardInfo.split("active keymap:")[1].split("\n")[0].trim();
                                currentLayoutIndex = layouts.indexOf(keymap.toUpperCase()) !== -1 ? 
                                                   layouts.indexOf(keymap.toUpperCase()) : 0;
                                label = layouts[currentLayoutIndex];
                            }
                        }
                    } catch(e) {
                        console.error("Failed to fetch keyboard layout:", e);
                    }
                }
                
                // Update keyboard layout every 2 seconds
                Timer {
                    interval: 2000
                    repeat: true
                    running: true
                    onTriggered: {
                        getCurrentLayout();
                        keyboardCapsule.label = layouts[currentLayoutIndex];
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    target: parent
                    from: 1
                    to: 1.02
                    duration: 50
                    easing.type: Easing.OutQuart
                    running: false
                }
            }
            
            // Improve communication with system services
            function changeKeyboardLayout(index) {
                try {
                    // Use an improved C++ interface
                    cppIntegration.asyncCall("keyboard.changeLayout", index, function(success) {
                        if(success) {
                            currentLayout = index === 0 ? "EN" : "AR";
                            label = currentLayout;
                            console.log("Keyboard layout changed successfully");
                        }
                    });
                } catch(e) {
                    console.error("Failed to change keyboard layout:", e);
                }
            }
            
            //==============
            //Clock capsule
            //==============
            Capsule {
                icon: "\uf017"  // Clock icon
                label: Qt.formatTime(new Date(), "hh:mm")
                colorIndex: 4
                capsuleId: "clock"
                width: 180
                height: 50
                property bool isExpanded: false
                property bool isDynamicIslandActive: false
                property string dynamicIslandSource: ""  // "timer" or "stopwatch"
                property var activeTimer: null
                property var activeStopwatch: null
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: clockHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }
                
                // Expansion Animation
                ParallelAnimation {
                    id: clockExpandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 400
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Shrinkage animation
                ParallelAnimation {
                    id: clockCollapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 180
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Timer to switch dynamic island
                Timer {
                    id: dynamicIslandTimer
                    interval: 5000
                    repeat: true
                    running: false
                    onTriggered: {
                        if (isDynamicIslandActive) {
                            activeTab = dynamicIslandSource === "timer" ? "timer": "stopwatch";
                        } else {
                            activeTab = "clock";
                        }
                    }
                }
                
                //Click processing
                onClicked: {
                    if(!isExpanded) {
                        // Close all other capsules quickly
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        // Expand this capsule
                        clockExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        // View the expanded watch capsule
                        clockExpanded.visible = true;
                        clockExpanded.z = 100;
                        
                        // Check for a timer or active stopwatch
                        checkDynamicIsland();
                        
                        // Start updating the time
                        clockExpanded.timeUpdateTimer.running = true;
                    } else {
                        // Close this capsule
                        clockCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        // Hide the expanded watch capsule
                        clockExpanded.visible = false;
                        clockExpanded.timeUpdateTimer.running = false;
                        dynamicIslandTimer.running = false;
                    }
                }
                
                // Function to check if a timer or stopwatch is active
                function checkDynamicIsland() {
                    if (clockExpanded.activeTimer && clockExpanded.activeTimer.isActive) {
                        isDynamicIslandActive = true;
                        dynamicIslandSource = "timer";
                        dynamicIslandTimer.running = true;
                    } else if (clockExpanded.activeStopwatch && clockExpanded.activeStopwatch.isRunning) {
                        isDynamicIslandActive = true;
                        dynamicIslandSource = "stopwatch";
                        dynamicIslandTimer.running = true;
                    } else {
                        isDynamicIslandActive = false;
                        dynamicIslandTimer.running = false;
                    }
                    
                    // Update capsule icon
                    clockCapsule.icon = isDynamicIslandActive ? 
                                        (dynamicIslandSource === "timer" ? "\uf2f2": "\uf2f8"): 
                                        "\uf017";
                }

                // Timer to update the time
                Timer {
                    id: timeUpdateTimer
                    interval: 1000
                    repeat: true
                    running: false
                    onTriggered: {
                        updateTimeDisplay();
                        checkDynamicIsland();
                    }
                    
                    // Timer Activity Timer
                    property var activeTimer: null
                    
                    // Stopwatch Activity Timer
                    property var activeStopwatch: {
                        isRunning: false,
                        startTime: 0,
                        elapsedTime: 0,
                        laps: []
                    }
                    
                    // Function to update the time display
                    function updateTimeDisplay() {
                        // Update the main clock
                        mainClockText.text = Qt.formatTime(new Date(), "hh:mm");
                        dateText.text = Qt.formatDate(new Date(), "dd MMMM yyyy");
                        
                        // Update the counter timer if it is active
                        if (activeTimer && activeTimer.isActive) {
                            const remainingTime = activeTimer.endTime - Date.now();
                            if (remainingTime > 0) {
                                const hours = Math.floor(remainingTime / 3600000);
                                const minutes = Math.floor((remainingTime %3600000) / 60000);
                                const seconds = Math.floor((remainingTime %60000) / 1000);
                                
                                timerDisplayText.text= 
                                    (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                                    (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                    (seconds < 10 ? "0" + seconds : seconds);
                            } else {
                                timerDisplayText.text = "00:00:00";
                                activeTimer.isActive = false;
                                playAlarm();
                            }
                        }
                        
                        // Update the stop clock if it is active
                        if (activeStopwatch.isRunning) {
                            const currentTime = Date.now();
                            activeStopwatch.elapsedTime = currentTime - activeStopwatch.startTime;
                            updateStopwatchDisplay();
                        }
                    }
                    
                    // Function to trigger the alarm
                    function playAlarm() {
                        try {
                            const alarmSound = activeTimer.soundPath || "/usr/share/sounds/classic-alarm.wav";
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("aplay", [alarmSound]);
                        } catch(e) {
                            console.error("Alarm sound failed to play:", e);
                        }
                    }
                    
                    // Function to update the stopwatch display
                    function updateStopwatchDisplay() {
                        const totalMs = activeStopwatch.elapsedTime;
                        const hours = Math.floor(totalMs / 3600000);
                        const minutes = Math.floor((totalMs % 3600000) / 60000);
                        const seconds = Math.floor((totalMs % 60000) / 1000);
                        const milliseconds = Math.floor((totalMs %1000) / 10);
                        
                        stopwatchDisplayText.text= 
                            (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                            (minutes < 10 ? "0" + minutes : minutes) + ":" +
                            (seconds < 10 ? "0" + seconds : seconds) + "." +
                            (milliseconds < 10 ? "0" + milliseconds : milliseconds);
                    }
                    
                    // Function to calculate the Hijri date
                    function getHijriDate(date) {
                        // This is a simplified function to calculate the Hijri date
                        // In the actual version, you can use a custom library for the Hijri date
                        const hijriYear = date.getFullYear() - 584;
                        const hijriMonth = date.getMonth() + 1;
                        const hijriDay = date.getDate();
                        
                        return hijriDay + "" + getHijriMonthName(hijriMonth) + "" + hijriYear;
                    }
                    
                    // Function to retrieve the name of the Hijri month
                    function getHijriMonthName(month) {
                        const months = [
                            "Muharram", "Zero", "Rabi' al-Awwal", "Rabi' al-Thani"
                            "Jumada al-Awwal", "Jumada al-Akhirah", "Rajab", "Shaaban",
                            Ramadan, Shawwal, Dhul-Qi'dah, Dhul-Hijjah
                        ];
                        return months[month - 1] || "";
                    }
                }

                //Main hour content
                ColumnLayout {
                    anchors.centerIn: parent
                    Spacing: 20
                    width: parent.width * 0.8
                            
                    // Hour and date
                    Item {
                        width: parent.width
                        height: 80
                                
                        // The clock
                        Text {
                            id: mainClockText
                            text: Qt.formatTime(new Date(), "hh:mm")
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 40
                            color: pywalColors.colors[4]
                            Layout.alignment: Qt.AlignHCenter
                        }
                                
                        // Gregorian date
                        Text {
                            id: dateText
                            anchors.top: mainClockText.bottom
                            anchors.topMargin: 5
                            text: Qt.formatDate(new Date(), "dd MMMM yyyy")
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    //=======================
                    // Expanded watch capsule
                    //=======================
                    Item {
                        id: clockExpanded
                        anchors.fill: parent
                        visible: false
                        z: 100

                    // Extended Hourly Content
                    Item {
                        id: islandContainer
                        width: parent.width * 0.9
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        //Full oval background
                        Rectangle {
                            id: islandBackground
                            anchors.fill: parent
                            radius: 25
                            color: Qt.rgba(0, 0, 0, 0.85)
                            border.width: 0
                            
                            // Improve blur (without FastBlur)
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: Rectangle {
                                    width: parent.width
                                    height: parent.height
                                    radius: 25
                                }
                                opacity: 0.7
                            }
                        }

                        // Tab bar (at the bottom)
                        RowLayout {
                            id: tabBar
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            Spacing: 20
                            height: 50
                            
                            // Clock tab
                            TabButton {
                                icon: "\uf017"
                                active: activeTab === "clock"
                                onClicked: activeTab = "clock"
                                height: 50
                                width: 50
                            }
                            
                            //Alarm Tab
                            TabButton {
                                icon: "\uf0f3"
                                active: activeTab === "alarms"
                                onClicked: activeTab = "alarms"
                                height: 50
                                width: 50
                            }
                            
                            // Timer tab
                            TabButton {
                                icon: "\uf2f2"
                                active: activeTab === "timer"
                                onClicked: activeTab = "timer"
                                height: 50
                                width: 50
                            }
                            
                            //Stop Hour Tab
                            TabButton {
                                icon: "\uf2f8"
                                active: activeTab === "stopwatch"
                                onClicked: activeTab = "stopwatch"
                                height: 50
                                width: 50
                            }
                            
                            //History tab
                            TabButton {
                                icon: "\uf133"
                                active: activeTab === "calendar"
                                onClicked: activeTab = "calendar"
                                height: 50
                                width: 50
                            }
                        }
                        
                        // Contents of tabs
                        Item {
                            id: tabContent
                            Layout.fillWidth: true
                            height: 200
                            
                            // Clock tab
                            Item {
                                id: clockTab
                                anchors.fill: parent
                                visible: activeTab === "clock"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 15
                                    
                                    // Time zone information
                                    Rectangle {
                                        id: timeZoneInfo
                                        width: parent.width
                                        height: 60
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: "Timezone: " + Intl.DateTimeFormat().resolvedOptions().timeZone
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[4]
                                        }
                                        
                                        // Add time zones
                                        RowLayout {
                                            Spacing: 10
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            TimeZoneButton {
                                                timeZone: "Asia/Riyadh"
                                                label: "Riyadh"
                                            }
                                            
                                            TimeZoneButton {
                                                timeZone: "Europe/London"
                                                label: "London"
                                            }
                                            
                                            TimeZoneButton {
                                                timeZone: "America/New_York"
                                                label: "New York"
                                            }
                                        }
                                        
                                        // List of time zones
                                        ListView {
                                            id: timeZoneList
                                            width: parent.width
                                            height: 120
                                            model: clockExpanded.timeZones
                                            delegate: TimeZoneItem {
                                                timeZone: modelData.timeZone
                                                label: modelData.label
                                            }
                                            clip: true
                                        }
                                    }
                                }
                                
                                //Alarm Tab
                                Item {
                                    id: alarmsTab
                                    anchors.fill: parent
                                    visible: activeTab === "alarms"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        Spacing: 15
                                        
                                        // Alarm list
                                        ListView {
                                            id: alarmsList
                                            width: parent.width
                                            height: 150
                                            model: clockExpanded.alarms
                                            delegate: AlarmItem {
                                                alarm: modelData
                                                onEdit: {
                                                    editAlarm(alarm);
                                                }
                                                onDelete: {
                                                    deleteAlarm(alarm);
                                                }
                                                onToggle: {
                                                    toggleAlarm(alarm);
                                                }
                                            }
                                            clip: true
                                        }
                                        
                                        //Add alarm button
                                        Button {
                                            text: "Add alarm"
                                            width: parent.width * 0.8
                                            height: 40
                                            radius: 20
                                            color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                            border.color: pywalColors.colors[4]
                                            border.width: 1
                                            onClicked: {
                                                addNewAlarm();
                                            }
                                        }
                                    }
                                }
                                
                                // Timer tab
                                Item {
                                    id: timerTab
                                    anchors.fill: parent
                                    visible: activeTab === "timer"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        Spacing: 20
                                        
                                        // Display timer
                                        Text {
                                            id: timerDisplayText
                                            text: "00:00:00"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 40
                                            color: pywalColors.colors[4]
                                            Layout.alignment: Qt.AlignHCenter
                                            Layout.fillWidth: true
                                        }
                                        
                                        // Set timer
                                        RowLayout {
                                            Spacing: 10
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            TimerButton {
                                                text: "clock"
                                                value: 3,600,000
                                            }
                                            
                                            TimerButton {
                                                text: "minute"
                                                value: 60000
                                            }
                                            
                                            TimerButton {
                                                text: "second"
                                                value: 1000
                                            }
                                        }
                                        
                                        // Control buttons
                                        RowLayout {
                                            Spacing: 15
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            ControlButton {
                                                icon: "\uf04b" // stop
                                                enabled: clockExpanded.activeTimer && clockExpanded.activeTimer.isActive
                                                onClicked: {
                                                    stopTimer();
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: activeTimer && activeTimer.isActive ? "\uf04c" : "\uf04b" // on/off
                                                onClicked: {
                                                    if (activeTimer && activeTimer.isActive) {
                                                        pauseTimer();
                                                    } else {
                                                        startTimer();
                                                    }
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: "\uf01e" // Reset
                                                enabled: clockExpanded.activeTimer && (clockExpanded.activeTimer.isActive || clockExpanded.activeTimer.paused)
                                                onClicked: {
                                                    resetTimer();
                                                }
                                            }
                                        }
                                        
                                        // Alarm sound settings
                                        Rectangle {
                                            id: alarmSettings
                                            width: parent.width
                                            height: 60
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                            
                                            Text {
                                                anchors.left: parent.left
                                                anchors.leftMargin: 15
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: "Alarm sound:"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[4]
                                            }
                                            
                                            Text {
                                                id: alarmSoundText
                                                anchors.right: parent.right
                                                anchors.rightMargin: 15
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: activeTimer ? (activeTimer.soundPath || "Classic"): "Classic"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[4]
                                            }
                                            
                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    openSoundSelector();
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                //Stop Hour Tab
                                Item {
                                    id: stopwatchTab
                                    anchors.fill: parent
                                    visible: activeTab === "stopwatch"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        Spacing: 20
                                        
                                        // Display the stop time
                                        Text {
                                            id: stopwatchDisplayText
                                            text: "00:00:00.00"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 40
                                            color: pywalColors.colors[4]
                                            Layout.alignment: Qt.AlignHCenter
                                            Layout.fillWidth: true
                                        }
                                        
                                        // Control buttons
                                        RowLayout {
                                            Spacing: 15
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            ControlButton {
                                                icon: "\uf0e2" // roll
                                                enabled: activeStopwatch.isRunning
                                                onClicked: {
                                                    addLap();
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: activeStopwatch.isRunning ? "\uf04c" : "\uf04b" // on/off
                                                onClicked: {
                                                    if (activeStopwatch.isRunning) {
                                                        stopStopwatch();
                                                    } else {
                                                        startStopwatch();
                                                    }
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: "\uf01e" // Reset
                                                enabled: activeStopwatch.elapsedTime > 0
                                                onClicked: {
                                                    resetStopwatch();
                                                }
                                            }
                                        }
                                        
                                        //Stop hour rolls
                                        ListView {
                                            id:lapsList
                                            width: parent.width
                                            height: 120
                                            model: activeStopwatch.laps
                                            delegate: LapItem {
                                                lapNumber: index+1
                                                lapTime: modelData
                                            }
                                            clip: true
                                            visible: activeStopwatch.laps.length > 0
                                        }
                                    }
                                }
                                
                                //History tab
                                Item {
                                    id: calendarTab
                                    anchors.fill: parent
                                    visible: activeTab === "calendar"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        Spacing: 20
                                        
                                        // Gregorian date
                                        Rectangle {
                                            id: gregorianDate
                                            width: parent.width
                                            height: 60
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "Gregorian date: " + Qt.formatDate(new Date(), "dd MMMM yyyy")
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[4]
                                            }
                                        }
                                        
                                        // Hijri date
                                        Rectangle {
                                            id: hijriDate
                                            width: parent.width
                                            height: 60
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "Hijri Date: " + clockExpanded.getHijriDate(new Date())
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[6]
                                            }
                                        }
                                        
                                        //Holiday information
                                        Rectangle {
                                            id: holidaysInfo
                                            width: parent.width
                                            height: 80
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                            
                                            Column {
                                                anchors.centerIn: parent
                                                Spacing: 5
                                                
                                                Text {
                                                    text: "The near Eid: Eid al-Fitr"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[5]
                                                }
                                                
                                                Text {
                                                    text: "After 25 days"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 14
                                                    color: pywalColors.colors[5]
                                                }
                                            }
                                        }
                                        
                                        // Interactive calendar
                                        GridView {
                                            id: calendarGrid
                                            width: parent.width
                                            height: 150
                                            cellWidth: parent.width/7
                                            cellHeight: 30
                                            model: 35
                                            delegate: CalendarDay {
                                                day: index + 1 - firstDayOffset
                                                isToday: day === new Date().getDate() && index >= firstDayOffset && index < firstDayOffset + daysInMonth
                                                visible: day > 0 && day <= daysInMonth
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    //====================
                    // Data and functions
                    //====================
                    
                    // Data
                    property list<var> timeZones: [
                        {timeZone: "Asia/Riyadh", label: "Riyadh"},
                        {timeZone: "Asia/Dubai", label: "Dubai"},
                        {timeZone: "Asia/Tokyo", label: "Tokyo"},
                        {timeZone: "Australia/Sydney", label: "Sydney"},
                        {timeZone: "Europe/Berlin", label: "Berlin"},
                        {timeZone: "Europe/Paris", label: "Paris"},
                        {timeZone: "Europe/Moscow", label: "Moscow"},
                        {timeZone: "America/Los_Angeles", label: "Los Angeles"},
                        {timeZone: "America/Chicago", label: "Chicago"},
                        {timeZone: "Pacific/Honolulu", label: "Honolulu"}
                    ]
                    
                    property list<var> alarms: []
                    property var selectedAlarm: null
                    property var soundPath: ""
                    
                    // Stimulus functions
                    function addNewAlarm() {
                        selectedAlarm = {
                            id: Date.now(),
                            time: "07:00",
                            label: "Morning Alarm"
                            days: [true, true, true, true, true, false, false],
                            isActive: true,
                            soundPath: "/usr/share/sounds/classic-alarm.wav"
                        };
                        showAlarmEditor();
                    }
                    
                    function editAlarm(alarm) {
                        selectedAlarm = JSON.parse(JSON.stringify(alarm));
                        showAlarmEditor();
                    }
                    
                    function deleteAlarm(alarm) {
                        const index = alarms.indexOf(alarm);
                        if(index!== -1) {
                            alarms.splice(index, 1);
                        }
                    }
                    
                    function toggleAlarm(alarm) {
                        alarm.isActive=!alarm.isActive;
                    }
                    
                    function saveAlarm() {
                        const index = alarms.findIndex(a => a.id === selectedAlarm.id);
                        if(index!== -1) {
                            alarms[index] = selectedAlarm;
                        } else {
                            alarms.push(selectedAlarm);
                        }
                        selectedAlarm = null;
                    }
                    
                    //Timer functions
                    function startTimer() {
                        if(!activeTimer) {
                            activeTimer = {
                                id: Date.now(),
                                endTime: Date.now() + 60000, // 1 minute by default
                                isActive: true,
                                paused: false,
                                soundPath: soundPath || "/usr/share/sounds/classic-alarm.wav"
                            };
                        } else {
                            activeTimer.endTime = Date.now() + (activeTimer.endTime - Date.now());
                            activeTimer.isActive = true;
                            activeTimer.paused = false;
                        }
                        clockExpanded.activeTimer = activeTimer;
                        checkDynamicIsland();
                    }
                    
                    function pauseTimer() {
                        if (activeTimer && activeTimer.isActive) {
                            activeTimer.remainingTime = activeTimer.endTime - Date.now();
                            activeTimer.paused = true;
                            activeTimer.isActive = false;
                        }
                    }
                    
                    function stopTimer() {
                        activeTimer = null;
                        clockExpanded.activeTimer = null;
                        timerDisplayText.text = "00:00:00";
                        checkDynamicIsland();
                    }
                    
                    function resetTimer() {
                        if (activeTimer) {
                            activeTimer.endTime = Date.now() + 60000; // 1 minute
                            activeTimer.isActive = false;
                            activeTimer.paused = false;
                        }
                    }
                    
                    function addTimeToTimer(value) {
                        if(!activeTimer) {
                            activeTimer = {
                                id: Date.now(),
                                endTime: Date.now() + value,
                                isActive: false,
                                paused: false,
                                soundPath: soundPath || "/usr/share/sounds/classic-alarm.wav"
                            };
                        } else if (activeTimer.paused) {
                            activeTimer.endTime = Date.now() + activeTimer.remainingTime + value;
                            activeTimer.paused = false;
                        } else {
                            activeTimer.endTime += value;
                        }
                        clockExpanded.activeTimer = activeTimer;
                    }
                    
                    // Stopwatch functions
                    function startStopwatch() {
                        if(!activeStopwatch.isRunning) {
                            activeStopwatch.startTime = Date.now() - activeStopwatch.elapsedTime;
                            activeStopwatch.isRunning = true;
                        }
                    }
                    
                    function stopStopwatch() {
                        if (activeStopwatch.isRunning) {
                            activeStopwatch.elapsedTime = Date.now() - activeStopwatch.startTime;
                            activeStopwatch.isRunning = false;
                        }
                    }
                    
                    function resetStopwatch() {
                        activeStopwatch.startTime = 0;
                        activeStopwatch.elapsedTime = 0;
                        activeStopwatch.isRunning = false;
                        activeStopwatch.laps = [];
                        updateStopwatchDisplay();
                    }
                    
                    function addLap() {
                        if (activeStopwatch.isRunning) {
                            const lapTime = Date.now() - activeStopwatch.startTime - activeStopwatch.laps.reduce((sum, lap) => sum + lap, 0);
                            activeStopwatch.laps.push(lapTime);
                        }
                    }
                    
                    // Sound settings functions
                    function openSoundSelector() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("zenity", ["--file-selection", "--title=Select audio file", "--file-filter=Audio (*.mp3 *.wav)"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            if(output) {
                                soundPath = output;
                                if (activeTimer) {
                                    activeTimer.soundPath = output;
                                }
                                alarmSoundText.text = output.split('/').pop();
                            }
                        } catch(e) {
                            console.error("Audio file selection failed:", e);
                            showToast("Audio file selection failed", "\uf071");
                        }
                    }
                    
                    // User interface functions
                    function showAlarmEditor() {
                        alarmEditor.visible = true;
                        alarmEditor.z = 200;
                    }
                    
                    function closeAlarmEditor() {
                        alarmEditor.visible = false;
                    }
                    
                    //====================
                    // User interface components
                    //====================
                    // Tab component
                    Component {
                        id: tabButtonComponent
                        
                        Item {
                            id: tabButton
                            property string icon
                            property bool active: false
                            width: 45
                            height: 45
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 22.5
                                color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                                
                                // Icon
                                Text {
                                    anchors.centerIn: parent
                                    text: tabButton.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 18
                                    color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    if(tabButton.onClicked) {
                                        tabButton.onClicked();
                                    }
                                }
                                onEntered: {
                                    if(!active) {
                                        parent.scale = 1.05;
                                    }
                                }
                                onExited: {
                                    if(!active) {
                                        parent.scale = 1.0;
                                    }
                                }
                            }
                        }
                    }
                    
                    //Time zone component
                    Component {
                        id: timeZoneButtonComponent
                        
                        Item {
                            id: timeZoneButton
                            property string timeZone
                            property string label
                            width: 100
                            height: 40
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 20
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                // Text
                                Text {
                                    anchors.centerIn: parent
                                    text: timeZoneButton.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[7]
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onPressed: {
                                    parent.scale = 1.05;
                                }
                                onReleased: {
                                    parent.scale = 1.0;
                                }
                                onClicked: {
                                    // Add the time zone to the list
                                    if(!timeZoneList.model.some(tz => tz.timeZone === timeZone)) {
                                        timeZoneList.model = [...timeZoneList.model, {timeZone, label}];
                                    }
                                }
                            }
                        }
                    }
                    
                    //Time zone element component
                    Component {
                        id: timeZoneItemComponent
                        
                        Item {
                            id: timeZoneItem
                            property string timeZone
                            property string label
                            width: parent.width
                            height: 40
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                // Time zone name
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: timeZoneItem.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                }
                                
                                // Current time
                                Text {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: getCurrentTime(timeZone)
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[4]
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onPressed: {
                                    parent.scale = 1.05;
                                }
                                onReleased: {
                                    parent.scale = 1.0;
                                }
                                onClicked: {
                                    // Remove the time zone from the list
                                    const index = timeZoneList.model.findIndex(tz => tz.timeZone === timeZone);
                                    if(index!== -1) {
                                        const newModel = [...timeZoneList.model];
                                        newModel.splice(index, 1);
                                        timeZoneList.model = newModel;
                                    }
                                }
                            }
                        }
                    }
                    
                    // Timer button component
                    Component {
                        id: timerButtonComponent
                        
                        Item {
                            id: timerButton
                            property string text
                            property int value
                            width: 80
                            height: 40
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 20
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2)
                                border.width: 0
                                
                                // Text
                                Text {
                                    anchors.centerIn: parent
                                    text: timerButton.text
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[4]
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onPressed: {
                                    parent.scale = 1.05;
                                }
                                onReleased: {
                                    parent.scale = 1.0;
                                }
                                onClicked: {
                                    addTimeToTimer(value);
                                }
                            }
                        }
                    }
                    
                    //Control button component
                    Component {
                        id: controlButtonComponent
                        
                        Item {
                            id: controlButton
                            property string icon
                            property bool enabled: true
                            width: 50
                            height: 50
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 25
                                color: enabled ? "#000000": Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.1)
                                border.color: enabled ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2): Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                // Icon
                                Text {
                                    anchors.centerIn: parent
                                    text: controlButton.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 20
                                    color: enabled ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                enabled: controlButton.enabled
                                onPressed: {
                                    if (enabled) {
                                        parent.scale = 1.05;
                                    }
                                }
                                onReleased: {
                                    if (enabled) {
                                        parent.scale = 1.0;
                                    }
                                }
                                onClicked: {
                                    if (enabled && controlButton.onClicked) {
                                        controlButton.onClicked();
                                    }
                                }
                            }
                        }
                    }
                    
                    // Alarm component
                    Component {
                        id: alarmItemComponent
                        
                        Item {
                            id: alarmItem
                            property var alarm
                            width: parent.width
                            height: 60
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                                border.color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2): Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                //Alarm time
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: alarm.time
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 20
                                    color: alarm.isActive ? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                                
                                // Label the alarm
                                Text {
                                    anchors.left: timeText.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: alarm.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: alarm.isActive ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                }
                                
                                // Edit icon
                                Text {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 45
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf044"
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[6]
                                }
                                
                                //Delete icon
                                Text {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf1f8"
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[2]
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            // Interaction area
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    alarmExpanded.visible = true;
                                    alarmExpanded.alarm = alarm;
                                }
                                
                                // Tahrir Area
                                Rectangle {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 40
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 20
                                    height: 20
                                    opacity: 0
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if(alarmItem.onEdit) {
                                                alarmItem.onEdit();
                                            }
                                        }
                                    }
                                }
                                
                                //Deletion area
                                Rectangle {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 20
                                    height: 20
                                    opacity: 0
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            if(alarmItem.onDelete) {
                                                alarmItem.onDelete();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    //Stop watch roll component
                    Component {
                        id: lapItemComponent
                    
                        Item {
                            id: lapItem
                            property int lapNumber
                            property int lapTime
                            width: parent.width
                            height: 30
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                // Lap number
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "roll" + lapNumber
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[7]
                                }
                                
                                // Lap time
                                Text {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: formatTime(lapTime)
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[4]
                                }
                            }
                        }
                    }
                    
                    // Calendar day component
                    Component {
                        id: calendarDayComponent
                        
                        Item {
                            id: calendarDay
                            property int day
                            property bool isToday: false
                            width: parent.cellWidth
                            height: parent.cellHeight
                            
                            // Background
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: isToday? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                                border.color: isToday? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                // Day number
                                Text {
                                    anchors.centerIn: parent
                                    text: day > 0 ? day.toString(): ""
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: isToday? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                            }
                        }
                    }
                    
                    // Alarm Editor Component
                    Item {
                        id: alarmEditor
                        anchors.fill: parent
                        visible: false
                        z: 200
                        
                        // Transparent background
                        Rectangle {
                            anchors.fill: parent
                            color: "#000000"
                            opacity: 0.7
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    closeAlarmEditor();
                                }
                            }
                        }
                        
                        // Alarm Editor Content
                        Rectangle {
                            id: alarmEditorContent
                            width: parent.width * 0.8
                            height: 300
                            radius: 20
                            anchors.centerIn: parent
                            color: "#000000"
                            border.width: 0
                            opacity: 0.92
                            
                            //Mild blur effect
                            FastBlur {
                                anchors.fill: parent
                                source: parent
                                radius: 25
                                opacity: 0.7
                            }
                            
                            // Editor's Address
                            Text {
                                anchors.top: parent.top
                                anchors.topMargin: 20
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: selectedAlarm ? "Edit Alarm": "Add a new alarm"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 20
                                color: pywalColors.colors[4]
                            }
                            
                            // Alarm settings
                            ColumnLayout {
                                anchors.top: titleText.bottom
                                anchors.topMargin: 30
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.margins: 20
                                Spacing: 20
                                
                                //Alarm time
                                RowLayout {
                                    Spacing: 10
                                    Layout.alignment: Qt.AlignHCenter
                                    
                                    TimePicker {
                                        id: hourPicker
                                        min: 0
                                        max: 23
                                        value: selectedAlarm? parseInt(selectedAlarm.time.split(':')[0]) : 7
                                    }
                                    
                                    Text {
                                        text: ":"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 24
                                        color: pywalColors.colors[7]
                                        Layout.alignment: Qt.AlignVCenter
                                    }
                                    
                                    TimePicker {
                                        id: minutePicker
                                        min: 0
                                        max: 59
                                        value: selectedAlarm? parseInt(selectedAlarm.time.split(':')[1]): 0
                                    }
                                }
                                
                                // Label the alarm
                                Rectangle {
                                    height: 40
                                    radius: 20
                                    color: "#000000"
                                    Layout.fillWidth: true
                                    
                                    TextInput {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        text: selectedAlarm ? selectedAlarm.label: "Morning Alarm"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: pywalColors.colors[7]
                                        placeholderText: "Alarm Name"
                                        selectByMouse: true
                                        onAccepted: {
                                            if (selectedAlarm) {
                                                selectedAlarm.label = text;
                                            }
                                        }
                                    }
                                }
                                
                                // Choose days
                                Rectangle {
                                    height: 50
                                    radius: 20
                                    color: "#000000"
                                    Layout.fillWidth: true
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        Spacing: 5
                                        
                                        Repeater {
                                            model: ["h", "n", "th", "r", "kh", "c", "s"]
                                            delegate: DaySelector {
                                                dayIndex: index
                                                label: modelData
                                                active: selectedAlarm? selectedAlarm.days[index] : (index < 5)
                                            }
                                        }
                                    }
                                }
                                
                                // Save and cancel buttons
                                RowLayout {
                                    Spacing: 20
                                    Layout.alignment: Qt.AlignHCenter
                                    
                                    Button {
                                        text: "Cancel"
                                        width: 100
                                        height: 40
                                        radius: 20
                                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.1)
                                        border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                        border.width: 0
                                        onClicked: {
                                            closeAlarmEditor();
                                        }
                                    }
                                    
                                    Button {
                                        text: "Save"
                                        width: 100
                                        height: 40
                                        radius: 20
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        border.color: pywalColors.colors[4]
                                        border.width: 0
                                        onClicked: {
                                            if(!selectedAlarm) {
                                                selectedAlarm = {
                                                    id: Date.now(),
                                                    time: hourPicker.value + ":" + (minutePicker.value < 10 ? "0" : "") + minutePicker.value,
                                                    label: alarmNameInput.text || "New Alarm",
                                                    days: daySelectors.map(d => d.active),
                                                    isActive: true,
                                                    soundPath: soundPath || "/usr/share/sounds/classic-alarm.wav"
                                                };
                                            } else {
                                                selectedAlarm.time = hourPicker.value + ":" + (minutePicker.value < 10 ? "0" : "") + minutePicker.value;
                                                selectedAlarm.label = alarmNameInput.text || "New Alarm";
                                                selectedAlarm.days = daySelectors.map(d => d.active);
                                            }
                                            saveAlarm();
                                            closeAlarmEditor();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            //====================
            // Tab component
            //====================
            Item {
                id: TabButton
                property string icon
                property bool active: false
                width: 45
                height: 45
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 22.5
                    color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: TabButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 18
                        color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if(TabButton.onClicked) {
                            TabButton.onClicked();
                        }
                    }
                    onEntered: {
                        if(!active) {
                            parent.scale = 1.05;
                        }
                    }
                    onExited: {
                        if(!active) {
                            parent.scale = 1.0;
                        }
                    }
                }
            }

            //====================
            //Time zone component
            //====================
            Item {
                id: TimeZoneButton
                property string timeZone
                property string label
                width: 100
                height: 40
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    // Text
                    Text {
                        anchors.centerIn: parent
                        text: TimeZoneButton.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.scale = 1.05;
                    }
                    onReleased: {
                        parent.scale = 1.0;
                    }
                    onClicked: {
                        // Add the time zone to the list
                        if(!clockExpanded.timeZoneList.model.some(tz => tz.timeZone === timeZone)) {
                            clockExpanded.timeZoneList.model = [...clockExpanded.timeZoneList.model, {timeZone, label}];
                        }
                    }
                }
            }

            //====================
            //Time zone element component
            //====================
            Item {
                id: TimeZoneItem
                property string timeZone
                property string label
                width: parent.width
                height: 40
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "#000000"
                    border.width: 0
                    
                    // Time zone name
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: TimeZoneItem.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                    
                    // Current time
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: getCurrentTime(timeZone)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[4]
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.scale = 1.05;
                    }
                    onReleased: {
                        parent.scale = 1.0;
                    }
                    onClicked: {
                        // Remove the time zone from the list
                        const index = clockExpanded.timeZoneList.model.findIndex(tz => tz.timeZone === timeZone);
                        if(index!== -1) {
                            const newModel = [...clockExpanded.timeZoneList.model];
                            newModel.splice(index, 1);
                            clockExpanded.timeZoneList.model = newModel;
                        }
                    }
                }
            }

            //====================
            // Timer button component
            //====================
            Item {
                id: TimerButton
                property string text
                property int value
                width: 80
                height: 40
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    // Text
                    Text {
                        anchors.centerIn: parent
                        text: TimerButton.text
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[4]
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onPressed: {
                        parent.scale = 1.05;
                    }
                    onReleased: {
                        parent.scale = 1.0;
                    }
                    onClicked: {
                        clockExpanded.addTimeToTimer(value);
                    }
                }
            }

            //====================
            //Control button component
            //====================
            Item {
                id: ControlButton
                property string icon
                property bool enabled: true
                width: 50
                height: 50
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 25
                    color: enabled ? "#000000": Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.1)
                    border.width: 0
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: ControlButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: enabled ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    enabled: ControlButton.enabled
                    onPressed: {
                        if (enabled) {
                            parent.scale = 1.05;
                        }
                    }
                    onReleased: {
                        if (enabled) {
                            parent.scale = 1.0;
                        }
                    }
                    onClicked: {
                        if (enabled && ControlButton.onClicked) {
                            ControlButton.onClicked();
                        }
                    }
                }
            }

            //====================
            // Alarm component
            //====================
            Item {
                id: AlarmItem
                property var alarm
                width: parent.width
                height: 60
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                    border.width: 0
                    
                    //Alarm time
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: alarm.time
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 20
                        color: alarm.isActive ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                    
                    // Label the alarm
                    Text {
                        anchors.left: timeText.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: alarm.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: alarm.isActive ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    // Edit icon
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 45
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\uf044"
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: pywalColors.colors[6]
                    }
                    
                    //Delete icon
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\uf1f8"
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: pywalColors.colors[2]
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        clockExpanded.alarmExpanded.visible = true;
                        clockExpanded.alarmExpanded.alarm = alarm;
                    }
                    
                    // Tahrir Area
                    Rectangle {
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        width: 20
                        height: 20
                        opacity: 0
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(AlarmItem.onEdit) {
                                    AlarmItem.onEdit();
                                }
                            }
                        }
                    }
                    
                    //Deletion area
                    Rectangle {
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        width: 20
                        height: 20
                        opacity: 0
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(AlarmItem.onDelete) {
                                    AlarmItem.onDelete();
                                }
                            }
                        }
                    }
                }
            }

            //====================
            //Stop watch roll component
            //====================
            Item {
                id: LapItem
                property int lapNumber
                property int lapTime
                width: parent.width
                height: 30
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "#000000"
                    border.width: 0
                    
                    // Lap number
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "roll" + lapNumber
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                    }
                    
                    // Lap time
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: formatTime(lapTime)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[4]
                    }
                }
            }

            //====================
            // Calendar day component
            //====================
            Item {
                id: CalendarDay
                property int day
                property bool isToday: false
                width: parent.cellWidth
                height: parent.cellHeight
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: isToday? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                    border.width: 0
                    
                    // Day number
                    Text {
                        anchors.centerIn: parent
                        text: day > 0 ? day.toString(): ""
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: isToday? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
            }

            //====================
            //Time-bound component
            //====================
            Item {
                id: TimePicker
                property int min: 0
                property int max: 59
                property int value: 0
                width: 50
                height: 40
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    // Value
                    Text {
                        anchors.centerIn: parent
                        text: value < 10 ? "0" + value : value.toString()
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 18
                        color: pywalColors.colors[4]
                    }
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onWheel: {
                        if (wheel.angleDelta.y > 0) {
                            value = Math.min(max, value + 1);
                        } else {
                            value = Math.max(min, value - 1);
                        }
                    }
                    onClicked: {
                        // A larger time limiter can be opened on click
                    }
                }
            }

            //====================
            //Days-specific component
            //====================
            Item {
                id: DaySelector
                property int dayIndex
                property string label
                property bool active: false
                width: 30
                height: 30
                
                // Background
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                    border.color: active ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                    border.width: 0
                    
                    // Label
                    Text {
                        anchors.centerIn: parent
                        text: DaySelector.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
                
                // Interaction area
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        active = !active;
                    }
                }
            }

            //====================
            // Helper functions
            //====================
            // Function to format time
            function formatTime(ms) {
                const totalSeconds = Math.floor(ms / 1000);
                const hours = Math.floor(totalSeconds / 3600);
                const minutes = Math.floor((totalSeconds % 3600) / 60);
                const seconds = totalSeconds % 60;
                
                return (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                    (minutes < 10 ? "0" + minutes : minutes) + ":" +
                    (seconds < 10 ? "0" + seconds : seconds);
            }

            // Function to get the current time for a time zone
            function getCurrentTime(timeZone) {
                try {
                    const options = { timeZone, hour: '2-digit', minute: '2-digit', hour12: true };
                    return new Date().toLocaleTimeString('ar-EG', options);
                } catch(e) {
                    console.error("Failed to get time for time zone:", timeZone, e);
                    return "--:--";
                }
            }
            
            //================
            // Battery capsule
            //================
            Capsule {
                icon: "\uf240"
                colorIndex: 2
                capsuleId: "battery"
                width: 50
                height: 50
                
                // Battery indicator
                property int batteryLevel: 100
                property bool isCharging: false
                
                // Base capsule (circular)
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width/2
                    color: "#000000"
                    border.width: 0
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: batteryLevel > 20 ? "\uf240" : "\uf244"
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: batteryLevel > 20 ? 
                            pywalColors.colors[colorIndex] : 
                            pywalColors.colors[1] // Red when the battery is low
                    }
                    
                    // Charging indicator (if charging)
                    Rectangle {
                        anchors.fill: parent
                        radius: width/2
                        color: "transparent"
                        border.color: pywalColors.colors[2]
                        border.width: 2
                        visible: isCharging
                        
                        // Shipping Animation
                        ScaleAnimation on scale {
                            duration: 500
                            from: 1.0
                            to: 1.1
                            loops: Animation.Infinite
                            easing.type: Easing.OutInQuad
                        }
                    }
                }
                
                //Timer to update battery
                Timer {
                    id: batteryUpdateTimer
                    interval: 5000 // Update every 5 seconds (reduce updates)
                    repeat: true
                    running: true
                    onTriggered: {
                        updateBatteryLevel();
                    }
                }
                
                // Battery level update function
                function updateBatteryLevel() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("upower", ["-i", "/org/freedesktop/UPower/devices/battery_BAT0"]);
                        process.waitForFinished(500); // 500ms timeout
                        
                        if (process.exitCode() === 0) {
                            const output = process.readAllStandardOutput().trim();
                            const match = output.match(/percentage:\s*(\d+)%/);
                            if(match) {
                                batteryLevel = parseInt(match[1]);
                                
                                // Check shipping status
                                const chargingMatch = output.match(/state:\s*(\w+)/);
                                isCharging = chargingMatch && chargingMatch[1] === "Charging";
                            }
                        }
                    } catch(e) {
                        console.error("Failed to fetch battery level:", e);
                    }
                }
            }
            
            //========================
            //Battery and power modes
            //========================
            Item {
                id: batteryModes
                anchors.fill: parent
                visible: false
                z: 100
                
                // Battery characteristics
                property string powerMode: "balanced" // "performance", "balanced", "power_saver"
                property int batteryLevel: 100
                property bool isCharging: false
                
                // Temporary to keep the battery updated
                Timer {
                    id: batteryTimer
                    interval: 5000
                    repeat: true
                    running: true
                    onTriggered: {
                        updateBatteryStatus()
                    }
                }
                
                // Function to update battery status
                function updateBatteryStatus() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("upower", ["-i", "/org/freedesktop/UPower/devices/battery_BAT0"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        // Analyze the output to get the battery percentage
                        const match = output.match(/percentage:\s+(\d+)%/);
                        if(match) {
                            batteryLevel = parseInt(match[1]);
                            batteryCapsule.label = batteryLevel + "%";
                        }
                        
                        // Shipping status analysis
                        isCharging = output.includes("state:              charging");
                    } catch(e) {
                        console.error("Failed to fetch battery status:", e);
                        batteryLevel = 75; // Default value in case of failure
                    }
                }
                
                // Function to change the power mode
                function setPowerMode(mode) {
                    powerMode = mode;
                    
                    // Apply mode settings
                    switch(mode) {
                        case "performance":
                            applyPerformanceMode();
                            break;
                        case "balanced":
                            applyBalancedMode();
                            break;
                        case "power_saver":
                            applyPowerSaverMode();
                            break;
                    }
                    
                    // Save settings
                    savePowerSettings();
                }
                
                // Function to apply performance mode
                function applyPerformanceMode() {
                    // Activate all animations
                    enableAllAnimations();
                    
                    // Increase fan speed if necessary
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "performance"]);
                    } catch(e) {
                        console.error("Performance Mode Application Failed:", e);
                    }
                }
                
                // Function to apply equilibrium mode
                function applyBalancedMode() {
                    // Activate all animations
                    enableAllAnimations();
                    
                    // Apply balance settings
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "ondemand"]);
                    } catch(e) {
                        console.error("Balance mode application failed:", e);
                    }
                }
                
                // Function to apply battery saving mode
                function applyPowerSaverMode() {
                    // Disable most animations
                    disableNonEssentialAnimations();
                    
                    // Reduce screen brightness
                    if (indicatorPopup.brightnessLevel > 50) {
                        indicatorPopup.setBrightnessLevel(50);
                    }
                    
                    // Apply power saving settings
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "powersave"]);
                    } catch(e) {
                        console.error("Battery Saving Mode Application Failed:", e);
                    }
                }
                
                // Function to activate all animations
                function enableAllAnimations() {
                    //Animation settings
                    animationDuration = 100;
                    animationEasing = Easing.OutQuart;
                    
                    // Reactivate all animations
                    opacityAnimationsEnabled = true;
                    scaleAnimationsEnabled = true;
                    slideAnimationsEnabled = true;
                    rippleAnimationsEnabled = true;
                    
                    // Update the appearance of battery modes
                    updateBatteryModesUI();
                }
                
                // Function to disable unnecessary animations
                function disableNonEssentialAnimations() {
                    // Simplified animation settings
                    animationDuration = 50;
                    animationEasing = Easing.Linear;
                    
                    // Disable unnecessary animations
                    opacityAnimationsEnabled = false;
                    scaleAnimationsEnabled = false;
                    rippleAnimationsEnabled = false;
                    
                    // Allow some basic animations
                    slideAnimationsEnabled = true;
                    
                    // Update the appearance of battery modes
                    updateBatteryModesUI();
                }
                
                // Function to update the battery modes interface
                function updateBatteryModesUI() {
                    // Update mode colors
                    performanceModeItem.active = (powerMode === "performance");
                    balancedModeItem.active = (powerMode === "balanced");
                    powerSaverModeItem.active = (powerMode === "power_saver");
                }
                
                // Function to save power settings
                function savePowerSettings() {
                    try {
                        const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
                        fs.source = "/home/user/.config/quickshell/power-settings.json";
                        fs.write(JSON.stringify({
                            powerMode: powerMode,
                            batteryLevel: batteryLevel,
                            isCharging: isCharging
                        }));
                    } catch(e) {
                        console.error("Failed to save power settings:", e);
                    }
                }
                
                // Function to load power settings
                function loadPowerSettings() {
                    try {
                        const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        fs.source = "/home/user/.config/quickshell/power-settings.json";
                        const data = fs.read();
                        if(data) {
                            const settings = JSON. parse(data);
                            powerMode = settings. powerMode || "balanced";
                            batteryLevel = settings. batteryLevel || 100;
                            isCharging = settings.isCharging || false;
                            
                            // Apply saved mode
                            switch(powerMode) {
                                case "performance":
                                    applyPerformanceMode();
                                    break;
                                case "power_saver":
                                    applyPowerSaverMode();
                                    break;
                                default:
                                    applyBalancedMode();
                            }
                        }
                    } catch(e) {
                        console.error("Failed to load power settings:", e);
                    }
                }
                
                //====================
                // Battery modes interface
                //====================
                Rectangle {
                    id: batteryModesContainer
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    [2]
                    border.width: 0
                    opacity: 0.92
                    
                    //Mild blur effect
                    Rectangle {
                        anchors.fill: parent
                        color: "rgba(0, 0, 0, 0.7)"
                        visible: !powerSaverModeActive
                    }

                    // In battery saving mode:
                    Rectangle {
                        anchors.fill: parent
                        color: "rgba(0, 0, 0, 0.92)"
                        visible: powerSaverModeActive
                    }
                    
                    //Large battery percentage
                    Text {
                        id: largeBatteryPercentage
                        anchors.top: parent.top
                        anchors.topMargin: 25
                        anchors.right: parent.right
                        anchors.rightMargin: 30
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 42
                        color: batteryLevel > 20 ? pywalColors.colors[2] : pywalColors.colors[3]
                        text: batteryLevel + "%"
                        opacity: 0
                        
                        // Appearance animation
                        OpacityAnimation on opacity {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 0
                            to: 1
                            running: false
                        }
                        
                        Component.onCompleted: {
                            opacityAnimation.restart();
                        }
                    }
                    
                    // Shipping status
                    Text {
                        id: chargingStatus
                        anchors.top: largeBatteryPercentage.bottom
                        anchors.topMargin: 5
                        anchors.right: largeBatteryPercentage.right
                        visible: isCharging
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[4]
                        text: "\uf1e6  Charges
                    }
                    
                    // Battery progress bar
                    Rectangle {
                        id: batteryProgressTrack
                        anchors.top: chargingStatus.bottom
                        anchors.topMargin: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 200
                        height: 8
                        radius: 4
                        color: Qt.rgba(
                            pywalColors.colors[2].r,
                            pywalColors.colors[2].g,
                            pywalColors.colors[2].b,
                            0.2
                        )
                        
                        //Progress indicator
                        Rectangle {
                            id: batteryProgressThumb
                            width: batteryProgressTrack.width * batteryLevel / 100
                            height: batteryProgressTrack.height
                            radius: 4
                            color: pywalColors.colors[2]
                            anchors.top: parent.top
                            anchors.left: parent.left
                            
                            // Effect of light around the pointer
                            Rectangle {
                                anchors.fill: parent
                                radius: 3
                                color: "transparent"
                                )
                                border.width: 0
                            }
                        }
                    }
                    
                    // Address of system modes
                    Text {
                        anchors.top: batteryProgressTrack.bottom
                        anchors.topMargin: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 18
                        color: pywalColors.colors[7]
                        text: "System Modes"
                    }
                    
                    // System mode network
                    RowLayout {
                        anchors.top: powerModesTitle.bottom
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        Spacing: 15
                        
                        // Performance Mode
                        PowerModeItem {
                            id: performanceModeItem
                            mode: "performance"
                            icon: "\uf085"
                            label: "Performance"
                            description: "Maximum speed with high power consumption"
                            colorIndex: 4
                            active: powerMode === "performance"
                        }
                        
                        // Balance mode
                        PowerModeItem {
                            id: balancedModeItem
                            mode: "balanced"
                            icon: "\uf1d3"
                            label: "balance"
                            description: "Balance between performance and power consumption"
                            colorIndex: 5
                            active: powerMode === "balanced"
                        }
                        
                        // Battery saving mode
                        PowerModeItem {
                            id: powerSaverModeItem
                            mode: "power_saver"
                            icon: "\uf187"
                            label: "Battery Saving"
                            description: "Lowest power consumption with limited performance"
                            colorIndex: 3
                            active: powerMode === "power_saver"
                        }
                    }
                    
                    //Current status information
                    Rectangle {
                        id: currentModeInfo
                        anchors.top: powerModesGrid.bottom
                        anchors.topMargin: 25
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 250
                        height: 60
                        radius: 15
                        color: Qt.rgba(
                            pywalColors.colors[modeInfoColorIndex].r,
                            pywalColors.colors[modeInfoColorIndex].g,
                            pywalColors.colors[modeInfoColorIndex].b,
                            0.1
                        )
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[modeInfoColorIndex]
                            text: modeInfoText
                            wrapMode: Text.Wrap
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
                
                // Mode information properties
                property int modeInfoColorIndex: {
                    switch(powerMode) {
                        case "performance": return 4
                        case "power_saver": return 3
                        default: return 5
                    }
                }
                
                property string modeInfoText: {
                    switch(powerMode) {
                        case "performance": return "Uses maximum system performance with increased battery consumption"
                        case "power_saver": return "Reduces battery consumption while disabling most animations"
                        default: return "Balances performance and battery consumption for the best experience"
                    }
                }
                
                //====================
                //Power mode component
                //====================
                Component {
                    id: powerModeItemComponent
                    
                    Item {
                        id: powerModeItem
                        property string mode
                        property string icon
                        property string label
                        property string description
                        property int colorIndex
                        property bool active: false
                        width: 100
                        height: 130
                        
                        // Background
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: active ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2): "#000000"
                            border.width: 0
                            
                            // Expansion effect on click
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutBack
                                from: 1
                                to: active ? 1.05: 1
                                running: false
                            }
                            
                            // Mode icon
                            Text {
                                anchors.top: parent.top
                                anchors.topMargin: 15
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: faSolid.name
                                font.pixelSize: 24
                                color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                text: icon
                            }
                            
                            // Mode name
                            Text {
                                anchors.top: iconRect.bottom
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 16
                                color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                text: label
                            }
                            
                            // Describe the situation
                            Text {
                                anchors.top: labelRect.bottom
                                anchors.topMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 12
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                text: description
                                wrapMode: Text.Wrap
                                width: parent.width * 0.9
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                        
                        // Interaction area
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                // Change power mode
                                batteryModes.setPowerMode(mode)
                                
                                // Update interface
                                batteryModes.updateBatteryModesUI()
                                
                                // Send notification
                                notificationSystem.notificationReceived(
                                    "Energy", 
                                    "System mode changed", 
                                    "mode activated" + label, 
                                    "\uf011"
                                )
                            }
                            onEntered: {
                                if(!active) {
                                    parent.scale = 1.05
                                }
                            }
                            onExited: {
                                if(!active) {
                                    parent.scale=1.0
                                }
                            }
                        }
                    }
                }
                
                // Load power settings on startup
                Component.onCompleted: {
                    loadPowerSettings()
                    updateBatteryStatus()
                }
            }

            //====================
            // Modify the battery capsule
            //====================
            Capsule {
                icon: "\uf240"
                label: batteryModes.batteryLevel + "%"
                colorIndex: batteryModes.batteryLevel > 20 ? 2:3
                capsuleId: "battery"
                width: 90
                
                // Animation expand a little faster
                ScaleAnimation on scale {
                    id: batteryHoverAnimation
                    duration: animationDuration * 0.05
                    easing.type: animationEasing
                    from: 1
                    to: 1.2
                    running: false
                }
                
                // Expansion Animation
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 250
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    // Add a "click" effect on click
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        from: 1.1
                        duration: 50
                        easing.type: Easing.OutBack
                        delay: 100
                    }
                }

                // Shrinkage animation
                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 100
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Click animation on click
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
                
                //Click processing
                onClicked: {
                    if(!isExpanded) {
                        // Close all other capsules quickly
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        // Expand this capsule
                        batteryExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        // Display battery modes
                        batteryModes.visible = true;
                    } else {
                        // Close this capsule
                        collapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        // Hide battery modes
                        batteryModes.visible = false;
                    }
                }
            }

            //===============
            // Network capsule
            //==============
            Capsule {
                icon: "\uf1eb"
                colorIndex: 5
                capsuleId: "network"
                width: 50
                height: 50
                
                //Network properties
                property string networkName: "Offline"
                property int signalStrength: 0
                
                // Base capsule (circular)
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width/2
                    color: "#000000"
                    border.width: 0
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: signalStrength > 75 ? "\uf1eb" : 
                            (signalStrength > 50 ? "\uf233" : 
                            (signalStrength > 25 ? "\uf232" : 
                            (signalStrength > 0 ? "\uf231" : "\uf230")));
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: signalStrength > 0 ? pywalColors.colors[colorIndex] : 
                            Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    }
                }
                
                //Timer for network update
                Timer {
                    id: networkUpdateTimer
                    interval: 5000 // Update every 5 seconds (reduce updates)
                    repeat: true
                    running: true
                    onTriggered: {
                        updateNetworkInfo();
                    }
                }
                
                // Network information update function
                function updateNetworkInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("nmcli", ["-t", "-f", "ACTIVE, SSID,SIGNAL", "dev", "wifi"]);
                        process.waitForFinished(500); // 500ms timeout
                        
                        if (process.exitCode() === 0) {
                            const output = process.readAllStandardOutput().trim();
                            const lines = output.split('\n');
                            
                            for (const line of lines) {
                                const parts = line.split(':');
                                if (parts[0] === "yes") {
                                    networkName = parts[1];
                                    signalStrength = parseInt(parts[2]);
                                    return;
                                }
                            }
                            
                            networkName = "offline";
                            signalStrength = 0;
                        }
                    } catch(e) {
                        console.error("Failed to fetch network information:", e);
                        networkName = "offline";
                        signalStrength = 0;
                    }
                }
            }

            //=============
            // Sound capsule
            //=============
            Capsule {
                id: soundCapsule
                icon: "\uf028" // Default audio icon
                label: "Sound Level: " + volumeLevel + "%"
                colorIndex: 3
                capsuleId: "sound"
                width: 150
                height: 50

                property bool isMicrophoneActive: false
                property bool isMicrophoneAndSoundActive: false
                property int volumeLevel: 50
                property var activeMicrophoneApps: []
                property var playlistsModel: []

                //=== Base capsule===
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: 25
                    color: "#000000"
                    border.color: pywalColors.colors[colorIndex]
                    border.width: 2

                    // Icon (changes based on microphone status)
                    Text {
                        id: capsuleIcon
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: {
                            if (isMicrophoneAndSoundActive) return "\uf130"; // Microphone and audio icon
                            if (isMicrophoneActive) return "\uf130"; // Microphone icon
                            return "\uf028"; // Normal audio icon
                        }
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }

                    // Label (sound level)
                    Text {
                        id: capsuleLabel
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Sound Level: " + volumeLevel + "%"
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[colorIndex]
                    }
                }

                // === Expansion and contraction animation ===
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: soundCapsule
                        property: "width"
                        to: 450
                        duration: 200
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        duration: 200
                        easing.type: Easing.OutQuart
                    }
                }

                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: soundCapsule
                        property: "width"
                        to: 150
                        duration: 200
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 200
                        easing.type: Easing.OutQuart
                    }
                }

                // === Mouse interaction area ===
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    // When the mouse moves over the capsule
                    onEntered: {
                        if(!soundCapsule.isExpanded) {
                            capsuleBase.scale = 1.05;
                        }
                    }

                    // When the mouse is removed from the capsule
                    onExited: {
                        if(!soundCapsule.isExpanded) {
                            capsuleBase.scale = 1;
                        }
                    }

                    // When left-clicking
                    onClicked: {
                        if(!soundCapsule.isExpanded) {
                            // Capsule expansion
                            expandAnimation.restart();
                            soundCapsule.isExpanded = true;

                            // Display the audio settings inside the capsule
                            soundSettings.visible = true;
                        } else {
                            // Close the capsule
                            collapseAnimation.restart();
                            soundCapsule.isExpanded = false;
                            soundSettings.visible = false;
                        }
                    }

                    // When right-clicking
                    onPressed: {
                        if (mouse.button === Qt.RightButton && (isMicrophoneActive || isMicrophoneAndSoundActive)) {
                            //expand the capsule to display applications that use the microphone
                            expandAnimation.restart();
                            soundCapsule.isExpanded = true;
                            microphoneUsage.visible = true;
                        }
                    }
                }

                //=== Capsule contents===
                Item {
                    id: soundSettings
                    visible: false
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        Spacing: 10

                        // Volume control bar
                        GroupBox {
                            title: "Sound Levels"
                            Layout.fillWidth: true
                            height: 150
                            background: Rectangle { color: "#1E1E1E"; radius: 10}

                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 10

                                RowLayout {
                                    Label {text: "General"}
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: volumeLevel
                                        onValueChanged: setVolumeLevel(value)
                                    }
                                }

                                RowLayout {
                                    Label {text: "Notifications"}
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: notificationVolume
                                        onValueChanged: setNotificationVolume(value)
                                    }
                                }

                                RowLayout {
                                    Label {text: "Alarms"}
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: alarmVolume
                                        onValueChanged: setAlarmVolume(value)
                                    }
                                }
                            }
                        }

                        //Voice management
                        GroupBox {
                            title: "Voice Management"
                            Layout.fillWidth: true
                            height: 200
                            background: Rectangle { color: "#1E1E1E"; radius: 10}

                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 10

                                Button {
                                    text: "Choose a local file"
                                    onClicked: openFilePicker()
                                }

                                Button {
                                    text: "Download from Zedge"
                                    onClicked: openZedgeSearch()
                                }

                                Button {
                                    text: "Import votes"
                                    onClicked: importSounds()
                                }
                            }
                        }

                        //Vote classification
                        GroupBox {
                            title: "Voice Classification"
                            Layout.fillWidth: true
                            height: 250
                            background: Rectangle { color: "#1E1E1E"; radius: 10}

                            ListView {
                                anchors.fill: parent
                                model: [
                                    { type: "Notifications", sounds: ["sound1.mp3", "sound2.mp3"] },
                                    { type: "alarms", sounds: ["alarm1.mp3", "alarm2.mp3"] },
                                    { type: "messages", sounds: ["message1.mp3", "message2.mp3"] }
                                ]
                                delegate: Item {
                                    width: parent.width
                                    height: 80

                                    ColumnLayout {
                                        anchors.fill: parent
                                        Spacing: 10

                                        Text {
                                            text: modelData.type
                                            font.family: "IBM Plex Sans Bold"
                                            font.pixelSize: 16
                                            color: "#FFFFFF"
                                        }

                                        Repeater {
                                            model: modelData.sounds
                                            delegate: Button {
                                                text: modelData
                                                onClicked: selectSound(modelData)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        // Create playlists
                        GroupBox {
                            title: "Playlists"
                            Layout.fillWidth: true
                            height: 200
                            background: Rectangle { color: "#1E1E1E"; radius: 10}

                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 10

                                TextField {
                                    placeholderText: "New playlist name"
                                    onAccepted: createPlaylist(text)
                                }

                                ListView {
                                    anchors.fill: parent
                                    model: playlistsModel
                                    delegate: Item {
                                        width: parent.width
                                        height: 50

                                        RowLayout {
                                            anchors.fill: parent
                                            Spacing: 10

                                            Text {
                                                text: modelData.name
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: "#FFFFFF"
                                            }

                                            Button {
                                                text: "Delete"
                                                onClicked: deletePlaylist(modelData.id)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                //===View apps that use microphone===
                Item {
                    id: microphoneUsage
                    visible: false
                    anchors.fill: parent

                    ListView {
                        anchors.fill: parent
                        model: getActiveMicrophoneApps() // Call a dynamic function to get the apps
                        delegate: Item {
                            width: parent.width
                            height: 50

                            RowLayout {
                                anchors.fill: parent
                                Spacing: 10

                                Text {
                                    text: modelData.name
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                }

                                Button {
                                    text: "Stop"
                                    onClicked: stopMicrophoneUsage(modelData.id)
                                }
                            }
                        }
                    }
                }
            }

            //====================
            // Auxiliary functions
            //====================
            // Adjust the overall volume
            function setVolumeLevel(level) {
                soundCapsule.volumeLevel = level;
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("wpctl", ["set-volume", "@DEFAULT_AUDIO_SINK@", level + "%"]);
                } catch(e) {
                    console.error("Failed to set volume:", e);
                }
            }

            // Adjust the notification volume
            function setNotificationVolume(level) {
                console.log("Adjust notification volume:", level);
            }

            // Adjust the volume of alarms
            function setAlarmVolume(level) {
                console.log("Adjust alarm volume:", level);
            }

            // Select a local audio file
            function openFilePicker() {
                console.log("Open local file selection");
            }

            // Search Zedge
            function openZedgeSearch() {
                console.log("Open search in Zedge");
            }

            // Import votes
            function importSounds() {
                console.log("Import votes");
            }

            //Choose a specific sound
            function selectSound(soundFile) {
                console.log("Audio Selection:", SoundFile);
            }

            // Create a new playlist
            function createPlaylist(name) {
                if(!name.trim()) return;
                soundCapsule.playlistsModel.push({ id: Date.now(), name: name});
            }

            // Delete playlist
            function deletePlaylist(id) {
                for (let i = 0; i < soundCapsule.playlistsModel.length; i++) {
                    if (soundCapsule.playlistsModel[i].id === id) {
                        soundCapsule.playlistsModel.splice(i, 1);
                        break;
                    }
                }
            }

            // Stop microphone use by a specific application
            function stopMicrophoneUsage(appId) {
                console.log("Stop microphone use by app:", appId);
                // Here you can add logic to stop the application from using the microphone
            }

            // Get apps that use the microphone dynamically
            function getActiveMicrophoneApps() {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("pactl", ["list", "sources"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput();

                    // Analyze the output to get applications that use the microphone
                    const lines = output.split("\n");
                    let activeApps = [];
                    for (let i = 0; i < lines.length; i++) {
                        if (lines[i].includes("application.name")) {
                            const appName = lines[i].split("=")[1].trim().replace(/"/g, "");
                            const appId = lines[i - 1].split("#")[1].trim(); // Get the app ID
                            activeApps.push({ id: appId, name: appName });
                        }
                    }
                    return activeApps;
                } catch(e) {
                    console.error("Failed to fetch applications using microphone:", e);
                    return [];
                }
            }

            //================================
            // Crosire AI Capsule
            //================================
            Capsule {
                icon: "\f70b"
                colorIndex: 6
                capsuleId: "crosire"
                width: 50
                height: 50
                
                property bool isExpanded: false
                property bool isListening: false
                property string currentResponse: ""
                property string currentQuery: ""
                property string token: "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"
                
                // Function to call Crosire AI
                function queryCrosire(query) {
                    currentQuery = query;
                    currentResponse = "Thinking about...";
                    
                    try {
                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "https://openrouter.ai/api/v1/chat/completions");
                        xhr.setRequestHeader("Authorization", "Bearer" + token);
                        xhr.setRequestHeader("Content-Type", "application/json");
                        
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 4) {
                                if (xhr.status === 200) {
                                    const response = JSON.parse(xhr.responseText);
                                    currentResponse = response.choices[0].message.content;
                                } else {
                                    currentResponse = "An error occurred connecting to Crosire";
                                }
                            }
                        };
                        
                        xhr.send(JSON.stringify({
                            "model": "mistralai/mistral-7b-instruct",
                            "messages": [
                                {"role": "user", "content": query}
                            ]
                        }));
                    } catch(e) {
                        console.error("Crosire call failed:", e);
                        currentResponse = "Failed to connect to Crosire";
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    target: parent
                    from: 1
                    to: 1.02
                    duration: 50
                    easing.type: Easing.OutQuart
                    running: false
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.scale = 1.02
                    onExited: parent.scale=1
                    onClicked: {
                        // Expand Crosire Capsule
                        isExpanded = !isExpanded;
                        if (isExpanded) {
                            crosireExpandAnimation.restart();
                            activeCapsule = "crosire";
                        } else {
                            crosireCollapseAnimation.restart();
                            activeCapsule = "";
                        }
                    }
                }
                
                // Expansion Animation
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 250
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    // Add a "click" effect on click
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        from: 1.1
                        duration: 50
                        easing.type: Easing.OutBack
                        delay: 100
                    }
                }

                // Shrinkage animation
                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 100
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Click animation on click
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
            }
        }
    }

    //=====================
    // Extended Crosire AI Zone
    //=====================
    Item {
        id: crosireExpanded
        anchors.fill: parent
        visible: false
        z: 994
        
        // Crosire area background
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        // Crosire area blur effect
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        // In battery saving mode:
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        // Crosire Area Content
        ColumnLayout {
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: parent.height * 0.8
            Spacing: 20
            
            // Address
            Text {
                text: "Crosire AI Assistant"
                font.family: ibmPlex.name
                font.pixelSize: 24
                color: pywalColors.colors[7]
                Layout.alignment: Qt.AlignHCenter
            }
            
            // Conversation area
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                ListView {
                    id: crosireChat
                    anchors.fill: parent
                    model: [
                        {role: "system", content: "Hello! I'm Crosire, the AI assistant built into the system. How can I help you today?"}
                    ]
                    delegate: Item {
                        width: parent.width
                        height: role==="user"? 60:80
                        
                        Rectangle {
                            anchors.left: role === "user" ? undefined: parent.left
                            anchors.right: role === "user" ? parent.right: undefined
                            width: parent.width * 0.8
                            height: implicitHeight
                            radius: 25
                            color: role==="user"? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2): "#000000"
                            border.width: 0
                            
                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 20
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                anchors.verticalCenter: parent.verticalCenter
                                text: content
                                font.family: ibmPlex.name
                                font.pixelSize: 16
                                color: pywalColors.colors[7]
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
            
            // Input area
            RowLayout {
                Spacing: 10
                Layout.fillWidth: true
                
                Rectangle {
                    Layout.fillWidth: true
                    height: 50
                    radius: 25
                    color: "#000000"
                    [6]
                    border.width: 0
                    
                    TextInput {
                        id: crosireInput
                        anchors.fill: parent
                        anchors.margins: 15
                        color: pywalColors.colors[7]
                        font.family: ibmPlex.name
                        horizontalAlignment: Text.AlignRight
                        placeholderText: "Write your question here..."
                        
                        onAccepted: {
                            if (text.trim()!== "") {
                                // Add the message to the conversation
                                crosireChat.model.append({role: "user", content: text});
                                crosireInput.text = "";
                                
                                // Display the message "Thinking about..."
                                crosireChat.model.append({role: "assistant", content: "Considering..."});
                                
                                // Call Crosire AI
                                crosireCapsule.queryCrosire(text);
                                
                                // Update the response after a while
                                Timer {
                                    interval: 1500
                                    onTriggered: {
                                        crosireChat.model.set(crosireChat.model.count - 1, {role: "assistant", content: crosireCapsule.currentResponse});
                                    }
                                }.start();
                            }
                        }
                    }
                }
                
                Button {
                    width: 60
                    height: 50
                    radius: 25
                    color: "#000000"
                    [6]
                    border.width: 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: "\uf1d8" // Send icon from Font Awesome 7
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[6]
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (crosireInput.text.trim()!== "") {
                                // Add the message to the conversation
                                crosireChat.model.append({role: "user", content: crosireInput.text});
                                crosireInput.text = "";
                                
                                // Display the message "Thinking about..."
                                crosireChat.model.append({role: "assistant", content: "Considering..."});
                                
                                // Call Crosire AI
                                crosireCapsule.queryCrosire(crosireInput.text);
                                
                                // Update the response after a while
                                Timer {
                                    interval: 1500
                                    onTriggered: {
                                        crosireChat.model.set(crosireChat.model.count - 1, {role: "assistant", content: crosireCapsule.currentResponse});
                                    }
                                }.start();
                            }
                        }
                    }
                }
            }
        }
        
        //handle clicking on the blank to close the Crosire area
        MouseArea {
            anchors.fill: parent
            visible: crosireExpanded.visible
            onClicked: {
                if (mouseY < crosireChat.y || mouseY > crosireChat.y + crosireChat.height) {
                    crosireExpanded.visible = false;
                    crosireCapsule.crosireCollapseAnimation.restart();
                    crosireCapsule.isExpanded = false;
                    activeCapsule = "";
                }
            }
        }
    }
    
    // Extended AI Content
    Item {
        id: crosireContent
        anchors.fill: parent
        visible: false
        z: 1000
        
        // Crosire wallpaper
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        // Crosire blur effect
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        // In battery saving mode:
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        // Crosire Head
        Rectangle {
            width: parent.width
            height: 70
            color: "#000000"
            [6]
            border.width: 0
            border.bottomWidth: 0
            
            // Address
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 25
                anchors.verticalCenter: parent.verticalCenter
                text: "Crosire AI Assistant"
                font.family: ibmPlex.name
                font.pixelSize: 20
                color: pywalColors.colors[7]
            }
            
            // AI icon
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.verticalCenter: parent.verticalCenter
                text: "\ue63d" // AI code from Font Awesome 7
                font.family: faSolid.name
                font.pixelSize: 22
                color: pywalColors.colors[6]
            }
        }
        
        //Main planning
        RowLayout {
            anchors.top: crosireContent.children[0].bottom
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            spacing: 0
            
            // Left panel - Calculations and models
            Rectangle {
                id: leftPanel
                width: 280
                height: parent.height
                color: "#000000"
                border.width: 0
                
                // Panel head
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Accounts and Forms"
                        font.family: ibmPlex.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                }
                
                // Main section
                ColumnLayout {
                    anchors.top: parent.children[0].bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    Spacing: 10
                    anchors.margins: 10
                    
                    // Current account
                    Rectangle {
                        id: currentAccount
                        width: parent.width
                        height: 50
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                        [6]
                        border.width: 0
                        
                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 10
                            Spacing: 10
                            
                            Rectangle {
                                width: 30
                                height: 30
                                radius: 15
                                color: pywalColors.colors[6]
                                border.width: 0
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: "\uf007" // User icon from Font Awesome 7
                                    font.family: faSolid.name
                                    font.pixelSize: 14
                                    color: "#000000"
                                }
                            }
                            
                            Text {
                                text: "Default account"
                                font.family: ibmPlex.name
                                font.pixelSize: 14
                                color: pywalColors.colors[7]
                                Layout.fillWidth: true
                            }
                            
                            Rectangle {
                                width: 20
                                height: 20
                                radius: 10
                                color: "#4CAF50"
                            }
                        }
                    }
                    
                    // Add Account button
                    Button {
                        id: addAccountButton
                        width: parent.width
                        height: 40
                        radius: 15
                        color: "#000000"
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "\uf067 Add Account" // Add icon from Font Awesome 7
                            font.family: faSolid.name
                            font.pixelSize: 14
                            color: pywalColors.colors[6]
                        }
                        
                        // Animation of interaction with the mouse
                        ScaleAnimation on scale {
                            target: parent
                            from: 1
                            to: 1.03
                            duration: 50
                            easing.type: Easing.OutQuart
                            running: false
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: parent.scale = 1.03
                            onExited: parent.scale = 1.0
                            onClicked: {
                                addAccountPopup.visible = true
                                addAccountPopup.opacity = 0
                                accountFade.to=1
                            }
                        }
                    }
                    
                    // Forms section
                    Rectangle {
                        width: parent.width
                        height: 50
                        radius: 15
                        color: "#000000"
                        border.width: 0
                        
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                            text: "Current model:"
                            font.family: ibmPlex.name
                            font.pixelSize: 14
                            color: pywalColors.colors[6]
                        }
                        
                        Text {
                            anchors.right: parent.right
                            anchors.rightMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                            text: "Qwen3-Max"
                            font.family: ibmPlex.name
                            font.pixelSize: 14
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    // List of models
                    ListView {
                        id: modelsList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: [
                            {text: "Default model", active: true, colorIndex: 6},
                            {text: "Qwen3-Max", active: false, colorIndex: 4},
                            {text: "Qwen3-Coder", active: false, colorIndex: 5},
                            {text: "Qwen3-Omni-Flash", active: false, colorIndex: 3}
                        ]
                        
                        delegate: Item {
                            width: parent.width
                            height: 40
                            
                            //Form button
                            Rectangle {
                                id: modelButton
                                anchors.fill: parent
                                radius: 15
                                color: active ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2): "#000000"
                                border.width: 0
                                
                                // Text
                                Text {
                                    anchors.left: icon.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelButton.text
                                    font.family: ibmPlex.name
                                    font.pixelSize: 16
                                    color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                }
                                
                                // Animation of interaction with the mouse
                                ScaleAnimation on scale {
                                    target: parent
                                    from: 1
                                    to: 1.03
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    running: false
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        if(!active) {
                                            parent.scale = 1.03;
                                        }
                                    }
                                    onExited: {
                                        if(!active) {
                                            parent.scale = 1.0;
                                        }
                                    }
                                    onClicked: {
                                        if(!active) {
                                            // Update the specified form
                                            modelsList.currentIndex = index;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // Middle panel - Chat area
            Rectangle {
                id: chatPanel
                width: 520
                height: parent.height
                color: "#000000"
                border.width: 0
                border.leftWidth: 0
                
                // Chat header
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: "New conversation"
                        font.family: ibmPlex.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                }
                
                // Message list
                property list<var> crosireChatMessages: [
                    {message: "Hello! How can I help you today?, isUser:false}
                ]
                
                // Chat message component
                Component {
                    id: chatMessageComponent

                Item {
                     id: typingIndicator
                    visible: !isUser && messageIndex === crosireChatMessages.length - 1 && crosireChatMessages[messageIndex].message === "..."
                    anchors.right: parent.right
                    anchors.rightMargin: 10

                      RowLayout {
                           Spacing: 5
                           Repeater {
                               model: 3
                               delegate: Rectangle {
                                   width: 8
                                   height: 8
                                   radius: 4
                                   color: pywalColors.colors[7]
                                   opacity: (index + 1)/4

                                   OpacityAnimation on opacity {
                                       from: 0
                                       to: 1
                                       duration: 50
                                       loops: Animation.Infinite
                                       delay: index * 200
                                   }
                               }
                           }
                       }
                   }
         
                    Item {
                        id: chatMessage
                        property string message
                        property bool isUser
                        property int colorIndex
                        property int messageIndex
                        width: parent.width
                        height: 80
                        
                        // Message bubble
                        Rectangle {
                            id: messageBubble
                            anchors.left: isUser? undefined: parent.left
                            anchors.right: isUser ? parent.right: undefined
                            width: parent.width
                            height: implicitHeight
                            radius: 20
                            color: isUser ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2): "#000000"
                            border.width: 0
                            
                            // Message text
                            Text {
                                id: messageText
                                anchors.left: parent.left
                                anchors.leftMargin: 15
                                anchors.right: parent.right
                                anchors.rightMargin: 15
                                anchors.verticalCenter: parent.verticalCenter
                                text: chatMessage.message
                                font.family: ibmPlex.name
                                font.pixelSize: 14
                                color: pywalColors.colors[7]
                                wrapMode: Text.Wrap
                            }
                            
                            // Time stamp
                            Text {
                                anchors.left: isUser? parent.left : undefined
                                anchors.right: isUser ? undefined: parent.right
                                anchors.leftMargin: 15
                                anchors.rightMargin: 15
                                anchors.top: messageText.bottom
                                anchors.topMargin: 5
                                text: isUser ? "now": "a second ago"
                                font.family: ibmPlex.name
                                font.pixelSize: 12
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                            }
                            
                            // Message options (for sent messages only)
                            Item {
                                id: messageOptions
                                visible: isUser
                                anchors.right: parent.right
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                width: 30
                                height: 20
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: "\uf142" // Options icon from Font Awesome 7
                                    font.family: faSolid.name
                                    font.pixelSize: 14
                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                }
                            }
                        }
                    }
                }
                
                // Chat messages
                ListView {
                    id: chatMessages
                    anchors.top: parent.children[0].bottom
                    anchors.bottom: inputArea.top
                    anchors.bottomMargin: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    Spacing: 15
                    model: crosireChatMessages
                    
                    delegate: chatMessageComponent
                }
                
                // Input area
                Rectangle {
                    id: inputArea
                    width: parent.width
                    height: 80
                    anchors.bottom: parent.bottom
                    color: "#000000"
                    border.width: 0
                    border.topWidth: 0
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        Spacing: 10
                        
                        Rectangle {
                            Layout.fillWidth: true
                            height: 50
                            radius: 20
                            color: "#000000"
                            [6]
                            border.width: 0
                            
                            TextInput {
                                id: chatInput
                                anchors.fill: parent
                                anchors.margins: 10
                                color: pywalColors.colors[7]
                                font.family: ibmPlex.name
                                horizontalAlignment: Text.AlignRight
                                
                                onAccepted: {
                                    if (text.trim()!== "") {
                                        crosireChatMessages.push({message: text, isUser: true});
                                        chatMessages.positionViewAtEnd();
                                        chatInput.text = "";
                                        
                                        // Simulate AI response
                                        const userMessage = text;
                                        Timer {
                                            interval: 500
                                            onTriggered: {
                                                const aiResponse = "I understand you said: " + userMessage + ". Is there anything else I can help you with?";
                                                crosireChatMessages.push({message: aiResponse, isUser: false});
                                                chatMessages.positionViewAtEnd();
                                            }
                                        }.start()
                                    }
                                }
                            }
                        }
                        
                        //Submit button
                        Rectangle {
                            width: 50
                            height: 50
                            radius: 25
                            color: "#000000"
                            [6]
                            border.width: 0
                            
                            Text {
                                anchors.centerIn: parent
                                text: "\uf1d8" // Send icon from Font Awesome 7
                                font.family: faSolid.name
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                target: parent
                                from: 1
                                to: 1.1
                                duration: 50
                                easing.type: Easing.OutQuart
                                running: false
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.scale = 1.1
                                onExited: parent.scale = 1.0
                                onClicked: {
                                    if (chatInput.text.trim()!== "") {
                                        crosireChatMessages.push({message: chatInput.text, isUser: true});
                                        chatMessages.positionViewAtEnd();
                                        chatInput.text = "";
                                        
                                        // Simulate AI response
                                        const userMessage = chatInput.text;
                                        Timer {
                                            interval: 500
                                            onTriggered: {
                                                const aiResponse = "I understand you said: " + userMessage + ". Is there anything else I can help you with?";
                                                crosireChatMessages.push({message: aiResponse, isUser: false});
                                                chatMessages.positionViewAtEnd();
                                            }
                                        }.start()
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // Right panel - Conversations
            Rectangle {
                id: rightPanel
                width: 200
                height: parent.height
                color: "#000000"
                border.width: 0
                border.leftWidth: 0
                
                // Panel head
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        Spacing: 10
                        
                        Text {
                            text: "Conversations"
                            font.family: ibmPlex.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        Text {
                            text: "\uf067" // Add icon from Font Awesome 7
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                target: parent
                                from: 1
                                to: 1.2
                                duration: 50
                                easing.type: Easing.OutQuart
                                running: false
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.scale = 1.2
                                onExited: parent.scale = 1.0
                                onClicked: {
                                    // Create a new conversation
                                    crosireChatMessages = [{message: "Hello! How can I help you today?, isUser:false}];
                                }
                            }
                        }
                    }
                }
                
                // Chat list
                ListView {
                    id: conversationsList
                    anchors.top: parent.children[0].bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: 10
                    Spacing: 10
                    model: [
                        {title: "New Conversation", lastMessage: "Hello", active: true},
                        {title: "Settings", lastMessage: "How do I adjust the sound?", active: false},
                        {title: "Technical Support", lastMessage: "Need Help?", active: false}
                    ]
                    
                    delegate: Item {
                        width: parent.width
                        height: 60
                        
                        //Conversation element
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: active ? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2): "#000000"
                            border.width: 0
                            
                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                Spacing: 5
                                
                                Text {
                                    text: modelData.title
                                    font.family: ibmPlex.name
                                    font.pixelSize: 14
                                    color: pywalColors.colors[7]
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                }
                                
                                Text {
                                    text: modelData.lastMessage
                                    font.family: ibmPlex.name
                                    font.pixelSize: 12
                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                    Layout.fillWidth: true
                                    elide: Text.ElideRight
                                }
                            }
                            
                            // Animation of interaction with the mouse
                            ScaleAnimation on scale {
                                target: parent
                                from: 1
                                to: 1.03
                                duration: 50
                                easing.type: Easing.OutQuart
                                running: false
                            }
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    if(!active) {
                                        parent.scale = 1.03;
                                    }
                                }
                                onExited: {
                                    if(!active) {
                                        parent.scale = 1.0;
                                    }
                                }
                                onClicked: {
                                    if(!active) {
                                        // Switch to the selected conversation
                                        conversationsList.currentIndex = index;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //Close button
        Rectangle {
            id: closeButton
            width: 30
            height: 30
            radius: 15
            color: "#000000"
            [7]
            border.width: 0
            anchors.top: crosireContent.top
            anchors.right: crosireContent.right
            anchors.margins: 15
            
            Text {
                anchors.centerIn: parent
                text: "\uf00d" // Close icon from Font Awesome 7
                font.family: faSolid.name
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                target: parent
                from: 1
                to: 1.1
                duration: 50
                easing.type: Easing.OutQuart
                running: false
            }
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.scale = 1.1
                onExited: parent.scale = 1.0
                onClicked: {
                    crosireContent.visible = false;
                    
                    // Close the capsule
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i]
                        if (child.capsuleId === "crosire" && child.isExpanded) {
                            child.collapseAnimation.restart()
                            child.isExpanded = false
                            activeCapsule = ""
                            break
                        }
                    }
                }
            }

            //=====================
            // Case capsule
            //=====================
            Capsule {
                id: clipboardCapsule
                icon: "\uf0ea" // Clipboard icon from Font Awesome 7
                colorIndex: 2
                capsuleId: "clipboard"
                width: 50
                height: 50
                
                property bool isExpanded: false
                property list<string> clipboardItems: []
                property int maxItems: 50
                
                // Function to fetch the contents of the clipboard
                function getClipboardContent() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("wl-paste");
                        process.waitForFinished();
                        const content = process.readAllStandardOutput().trim();
                        
                        if (content && content.length > 0) {
                            clipboardItems.unshift(content);
                            if (clipboardItems.length > maxItems) {
                                clipboardItems.pop();
                            }
                        }
                    } catch(e) {
                        console.error("Failed to fetch clipboard contents:", e);
                    }
                }
                
                // Function to put content into the clipboard
                function setClipboardContent(content) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("wl-copy", [content]);
                    } catch(e) {
                        console.error("Failed to put content into clipboard:", e);
                    }
                }
                
                // Temporary to update clipboard contents
                Timer {
                    interval: 500
                    repeat: true
                    running: true
                    onTriggered: getClipboardContent()
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    target: parent
                    from: 1
                    to: 1.02
                    duration: 50
                    easing.type: Easing.OutQuart
                    running: false
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.scale = 1.02
                    onExited: parent.scale=1
                    onClicked: {
                        // Expand the clipboard capsule
                        isExpanded = !isExpanded;
                        if (isExpanded) {
                            clipboardExpandAnimation.restart();
                            activeCapsule = "clipboard";
                        } else {
                            clipboardCollapseAnimation.restart();
                            activeCapsule = "";
                        }
                    }
                }
                
                // Expansion Animation
                ParallelAnimation {
                    id: expandAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 250
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    // Add a "click" effect on click
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        from: 1.1
                        duration: 50
                        easing.type: Easing.OutBack
                        delay: 100
                    }
                }

                // Shrinkage animation
                ParallelAnimation {
                    id: collapseAnimation
                    NumberAnimation {
                        target: capsule
                        property: "width"
                        to: 100
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }

                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                // Click animation on click
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
            }

            //=====================
            // Expanded clipboard area
            //=====================
            Item {
                id: clipboardExpanded
                anchors.fill: parent
                visible: false
                z: 995
                
                // Background of the clipboard area
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                }
                
                // Blur effect for the clipboard area
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.7)"
                    visible: !powerSaverModeActive
                }

                // In battery saving mode:
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.92)"
                    visible: powerSaverModeActive
                }
                
                // Clipboard area content
                ColumnLayout {
                    anchors.centerIn: parent
                    width: parent.width * 0.8
                    Spacing: 20
                    
                    // Address
                    Text {
                        text: "clipboard"
                        font.family: ibmPlex.name
                        font.pixelSize: 24
                        color: pywalColors.colors[7]
                        Layout.alignment: Qt.AlignHCenter
                    }
                    
                    // List of items
                    ListView {
                        id: clipboardList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: clipboardCapsule.clipboardItems.length
                        delegate: Item {
                            width: parent.width
                            height: 50
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 25
                                color: "#000000"
                                [2]
                                border.width: 0
                                
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 20
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: clipboardCapsule.clipboardItems[index]
                                    font.family: ibmPlex.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                    elide: Text.ElideRight
                                }
                                
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        clipboardCapsule.setClipboardContent(clipboardCapsule.clipboardItems[index]);
                                        showToast("Content copied to clipboard", "\uf0ea");
                                    }
                                }
                            }
                        }
                    }
                    
                    // Control buttons
                    RowLayout {
                        Spacing: 20
                        Layout.alignment: Qt.AlignHCenter
                        
                        Button {
                            text: "Clear all"
                            width: 120
                            height: 40
                            radius: 20
                            color: "#000000"
                            [2]
                            border.width: 0
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    clipboardCapsule.clipboardItems = [];
                                }
                            }
                        }
                        
                        Button {
                            text: "Close"
                            width: 120
                            height: 40
                            radius: 20
                            color: "#000000"
                            [7]
                            border.width: 0
                            
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    clipboardExpanded.visible = false;
                                    clipboardCapsule.collapseAnimation.restart();
                                    clipboardCapsule.isExpanded = false;
                                    activeCapsule = "";
                                }
                            }
                        }
                    }
                }
                
                //process clicking on the space to close the clipboard area
                MouseArea {
                    anchors.fill: parent
                    visible: clipboardExpanded.visible
                    onClicked: {
                        if (mouseY < clipboardList.y || mouseY > clipboardList.y + clipboardList.height) {
                            clipboardExpanded.visible = false;
                            clipboardCapsule.collapseAnimation.restart();
                            clipboardCapsule.isExpanded = false;
                            activeCapsule = "";
                        }
                    }
                }
            }

            //================
            //Notifire Capsule
            //================
            Capsule {
                id: notifireCapsule
                icon: "\f042"
                colorIndex: 4
                capsuleId: "notifire"
                width: 50
                height: 50
                property bool isExpanded: false
                property bool isNotificationCenterOpen: false
                property int notificationCount: 0
                property bool showDeveloperOptions: false
                property var activeNotifications: []
                
                // Performance characteristics
                property int maxVisibleNotifications: 5
                property int notificationHeight: 80
                property int notificationSpacing: 10
                property int debounceTime: 20

                // Expansion Animation 
                ParallelAnimation {
                    id: notifireExpandAnimation
                    NumberAnimation {
                        target: notifireCapsule
                        property: "width"
                        to: 600
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Shrinkage animation 
                ParallelAnimation {
                    id: notifireCollapseAnimation
                    NumberAnimation {
                        target: notifireCapsule
                        property: "width"
                        to: 50
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: 50
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Base capsule (circular)
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width/2
                    color: "#000000"
                    border.width: 0
                    
                    // Number (if notifications are found)
                    Rectangle {
                        id: notificationBadge
                        visible: notificationCount > 0
                        anchors.right: parent.right
                        anchors.rightMargin: -5
                        anchors.top: parent.top
                        anchors.topMargin: -5
                        width: 20
                        height: 20
                        radius: 10
                        color: pywalColors.colors[2]
                        
                        Text {
                            anchors.centerIn: parent
                            text: notificationCount > 9 ? "9+": notificationCount.toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 12
                            color: "#000000"
                        }
                    }
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: notifireCapsule.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }
                }
                
                // Hover animation 
                ScaleAnimation {
                    id: hoverAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Mouse interaction
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    
                    onEntered: {
                        if(!isExpanded) {
                            hoverAnimation.running = true;
                        }
                    }
                    
                    onExited: {
                        hoverAnimation.to = 1.0;
                        hoverAnimation.running = true;
                        if(!isExpanded) capsuleBase.scale = 1.0;
                    }
                    
                    onClicked: {
                        if(!isExpanded) {
                            // Close all other capsules quickly
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId!== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            // Expand this capsule
                            notifireExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            // View Notifire Capsule
                            notifireContent.visible = true;
                            notifireContent.opacity = 0;
                            fadeInAnimation.target = notifireContent;
                            fadeInAnimation.restart();
                        } else {
                            // Close this capsule
                            notifireCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                            
                            // Hide Notifire Capsule
                            fadeOutAnimation.target = notifireContent;
                            fadeOutAnimation.onCompleted = function() {
                                notifireContent.visible = false;
                            };
                            fadeOutAnimation.restart();
                        }
                    }
                }
                
                //===============
                //Notifire interface
                //================
                Item {
                    id: notifireContent
                    anchors.fill: parent
                    visible: false
                    opacity: 0
                    
                    //Notification Island 
                    Item {
                        id: islandContainer
                        width: parent.width * 0.9
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        //Full oval background (without FastBlur)
                        Rectangle {
                            id: islandBackground
                            anchors.fill: parent
                            radius: 25
                            color: Qt.rgba(0, 0, 0, 0.85)
                            border.width: 0
                            
                            // Improve blur (without FastBlur)
                            layer.enabled: true
                            layer.effect: OpacityMask {
                                maskSource: Rectangle {
                                    width: parent.width
                                    height: parent.height
                                    radius: 25
                                }
                                opacity: 0.7
                            }
                        }
                        
                        // Tab bar
                        RowLayout {
                            id: tabBar
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            Spacing: 10
                            height: 50
                            
                            //Notifications tab
                            TabButton {
                                icon: "\uf0f3"
                                active: activeTab === "notifications"
                                onClicked: {
                                    activeTab = "notifications";
                                    showDeveloperOptions = false;
                                }
                                height: 50
                                width: 50
                            }
                            
                            //Control tab
                            TabButton {
                                icon: "\uf013"
                                active: activeTab === "control"
                                onClicked: activeTab = "control"
                                height: 50
                                width: 50
                            }
                            
                            //Developers tab
                            TabButton {
                                icon: "\uf121"
                                active: activeTab === "developer"
                                visible: showDeveloperOptions
                                onClicked: activeTab = "developer"
                                height: 50
                                width: 50
                            }
                            
                            // Show developer options button
                            TabButton {
                                icon: "\uf067" // plus
                                active: false
                                visible: !showDeveloperOptions
                                onClicked: {
                                    showDeveloperOptions = true;
                                    activeTab = "developer";
                                }
                                height: 50
                                width: 50
                            }
                        }
                    }
                    
                    // Contents of tabs
                    Item {
                        id: tabContent
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        width: parent.width
                        height: parent.height - 70
                        
                        //Notifications tab
                        Item {
                            id: notificationsTab
                            anchors.fill: parent
                            visible: activeTab === "notifications"
                            
                            // Notification list
                            ListView {
                                id: notificationsList
                                anchors.fill: parent
                                clip: true
                                interactive: false
                                model: activeNotifications.length > 0 ? activeNotifications: null
                                delegate: NotificationItem {
                                    width: parent.width * 0.95
                                    height: notificationHeight
                                    notification: modelData
                                    onDismiss: {
                                        notifyManager.removeNotification(modelData.id);
                                    }
                                    onAction: {
                                        notifyManager.executeNotificationAction(modelData, actionIndex);
                                    }
                                }
                                
                                // Appearance animation
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                                
                                // Animation of interaction with the mouse
                                ScaleAnimation on scale {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 1.0
                                    to: 1.02
                                    running: false
                                }
                            }
                            
                            // Clear All button
                            Button {
                                id: clearAllButton
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                width: 100
                                height: 40
                                radius: 20
                                color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                border.color: pywalColors.colors[2]
                                border.width: 1
                                visible: activeNotifications.length > 0
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: "Clear all"
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[2]
                                }
                                
                                onClicked: {
                                    notifyManager.clearAllNotifications();
                                }
                            }
                            
                            // "No notifications" message
                            Text {
                                anchors.centerIn: parent
                                text: "No notifications"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                visible: activeNotifications.length === 0
                            }
                        }
                        
                        //Control tab
                        Item {
                            id: controlTab
                            anchors.fill: parent
                            visible: activeTab === "control"
                            
                            // List of controls
                            GridView {
                                id: controlGrid
                                anchors.fill: parent
                                cellWidth: 80
                                cellHeight: 80
                                model: controlItems
                                delegate: ControlItem {
                                    width: parent.cellWidth
                                    height: parent.cellHeight
                                    item: modelData
                                    onClicked: {
                                        if (modelData.onClicked) {
                                            modelData.onClicked();
                                        }
                                    }
                                }
                            }
                        }
                        
                        //Developers tab
                        Item {
                            id: developerTab
                            anchors.fill: parent
                            visible: activeTab === "developer"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                anchors.margins: 15
                                
                                // Create a test notification
                                Rectangle {
                                    id: createNotificationSection
                                    width: parent.width
                                    height: 120
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "Create a test notification"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[6]
                                        }
                                        
                                        RowLayout {
                                            Spacing: 10
                                            
                                            TextInput {
                                                id: appNameInput
                                                width: 100
                                                height: 40
                                                placeholderText: "Application"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[7]
                                                background: Rectangle {
                                                    radius: 20
                                                    color: "#000000"
                                                    border.color: pywalColors.colors[6]
                                                    border.width: 1
                                                }
                                            }
                                            
                                            TextInput {
                                                id: titleInput
                                                width: 150
                                                height: 40
                                                placeholderText: "Title"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[7]
                                                background: Rectangle {
                                                    radius: 20
                                                    color: "#000000"
                                                    border.color: pywalColors.colors[6]
                                                    border.width: 1
                                                }
                                            }
                                            
                                            TextInput {
                                                id: messageInput
                                                Layout.fillWidth: true
                                                height: 40
                                                placeholderText: "Message"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[7]
                                                background: Rectangle {
                                                    radius: 20
                                                    color: "#000000"
                                                    border.color: pywalColors.colors[6]
                                                    border.width: 1
                                                }
                                            }
                                        }
                                        
                                        Button {
                                            width: 100
                                            height: 40
                                            radius: 20
                                            color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                            border.color: pywalColors.colors[6]
                                            border.width: 1
                                            text: "Create"
                                            
                                            onClicked: {
                                                notifireManager.createTestNotification(
                                                    appNameInput.text || "TestApp",
                                                    titleInput.text || "Test Title",
                                                    messageInput.text || "This is a test notification",
                                                    5000
                                                );
                                            }
                                        }
                                    }
                                }
                                
                                // DBus case
                                Rectangle {
                                    id: dbusStatusSection
                                    width: parent.width
                                    height: 80
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 5
                                        
                                        Text {
                                            text: "DBus case"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[5]
                                        }
                                        
                                        Text {
                                            id: dbusStatusText
                                            text: checkDBusStatus() ? "Connected": "Offline"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: checkDBusStatus()? pywalColors.colors[2] : pywalColors.colors[1]
                                        }
                                    }
                                }
                                
                                // System information
                                Rectangle {
                                    id: systemInfoSection
                                    width: parent.width
                                    height: 100
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 5
                                        
                                        Text {
                                            text: "System Information"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[4]
                                        }
                                        
                                        Text {
                                            id: systemInfoText
                                            text: getSystemInfo()
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 12
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            wrapMode: Text.Wrap
                                        }
                                    }
                                }
                                
                                // Notification history
                                Rectangle {
                                    id: logSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 5
                                        
                                        Text {
                                            text: "Notification History"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[3]
                                        }
                                        
                                        Text {
                                            id: logText
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            text: notificationLog
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 12
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            wrapMode: Text.Wrap
                                            verticalAlignment: Text.AlignTop
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                // Appearance animation
                OpacityAnimation {
                    id: fadeInAnimation
                    from: 0
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                //Disappearance Animation
                OpacityAnimation {
                    id: fadeOutAnimation
                    from: 1
                    to: 0
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                //=====================
                // Notification management functions
                //=====================
                // Notification creation function
                function createNotification(title, message, icon, colorIndex, timeout) {
                    if (timeout === undefined) timeout = 5000; // 5 seconds by default
                    
                    // Create the notification object
                    let notification = {
                        id: Date.now(),
                        title: title,
                        message: message,
                        icon: icon,
                        colorIndex: colorIndex,
                        timeout: timeout,
                        opacity: 1.0,
                        timestamp: new Date()
                    };
                    
                    // Add the notification to the list
                    activeNotifications.unshift(notification);
                    notificationCount = activeNotifications.length;
                    
                    // Update display
                    updateNotifications();
                    
                    //set a timeout to remove the notification
                    if (timeout > 0) {
                        setTimeout(function() {
                            removeNotification(notification.id);
                        }, timeout);
                    }
                    
                    // Notification history
                    addToLog(`Notice created: ${title}`);
                    
                    return notification.id;
                }
                
                // Function to create a test notification
                function createTestNotification(appName, title, message, timeout) {
                    let colorIndex = Math.floor(Math.random() * 6) + 1;
                    let icon = Math.random() > 0.5 ? "\uf0f3" : "\uf0a2";
                    
                    createNotification(title, message, icon, colorIndex, timeout);
                    addToLog(`A test notification was created from ${appName}`);
                }
                
                // Remove notification function
                function removeNotification(id) {
                    for (let i = 0; i < activeNotifications.length; i++) {
                        if (activeNotifications[i].id === id) {
                            // Setting up the disappearance animation
                            activeNotifications[i].opacity = 0.0;
                            updateNotifications();
                            
                            // Remove notification after disappearing animation
                            setTimeout(function() {
                                activeNotifications.splice(i, 1);
                                notificationCount = activeNotifications.length;
                                updateNotifications();
                                addToLog(`Notification removed (ID: ${id})`);
                            }, 300); // Duration of the disappearance animation
                            
                            break;
                        }
                    }
                }
                
                // Function to clear all notifications
                function clearAllNotifications() {
                    if (activeNotifications.length === 0) return;
                    
                    addToLog("All notifications have been cleared");
                    
                    // Set up invisibility animation for all notifications
                    for (let i = 0; i < activeNotifications.length; i++) {
                        activeNotifications[i].opacity = 0.0;
                    }
                    
                    updateNotifications();
                    
                    // Remove all notifications after disappearing animation
                    setTimeout(function() {
                        activeNotifications = [];
                        notificationCount = 0;
                        updateNotifications();
                    }, 300);
                }
                
                // Function to execute notification actions
                function executeNotificationAction(notification, actionIndex) {
                    addToLog(`Action ${actionIndex} was executed for notification: ${notification.title}`);
                    // Here you can add the logic for executing actions
                }
                
                // Update notification display function
                function updateNotifications() {
                    // Maintain maximum visual notifications
                    let visibleNotifications = activeNotifications.slice(0, maxVisibleNotifications);
                    
                    // Update the position of each notification
                    for (let i = 0; i < visibleNotifications.length; i++) {
                        let notification = visibleNotifications[i];
                        let yPosition = (notificationSpacing + notificationHeight) * i + notificationSpacing;
                        
                        // Create or update the element
                        if(!notification.element) {
                            notification.element = notificationItemComponent.createObject(notificationsList, {
                                "x": (notificationsList.width - notification.width) / 2,
                                "y": yPosition,
                                "width": notification.width,
                                "height": notificationHeight,
                                "notification": notification,
                                "opacity": 0.0
                            });
                            
                            // Instant animation (no delay)
                            let fadeIn = notification.element.opacityAnimation;
                            fadeIn.to = notification.opacity;
                            fadeIn.restart();
                            
                            // Set the disappearance animation
                            notification.element.opacityAnimation.onRunningChanged = function() {
                                if(!fadeIn.running && notification.opacity === 0.0) {
                                    notification.element.destroy();
                                    notification.element = null;
                                }
                            };
                        } else {
                            // Update element position
                            notification.element.y = yPosition;
                            notification.element.opacity = notification.opacity;
                        }
                    }
                    
                    // Clean up removed items
                    for (let i = activeNotifications.length - 1; i >= maxVisibleNotifications; i--) {
                        if (activeNotifications[i].element) {
                            activeNotifications[i].element.destroy();
                            activeNotifications[i].element = null;
                        }
                    }
                }
                
                // DBus status check function
                function checkDBusStatus() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("dbus-send", ["--session", "--dest=org.freedesktop.DBus", "--type=method_call", "--print-reply", "/org/freedesktop/DBus", "org.freedesktop.DBus.ListNames"]);
                        process.waitForFinished(500); // 500ms timeout
                        
                        return process.exitCode() === 0;
                    } catch(e) {
                        console.error("DBus status verification failed:", e);
                        return false;
                    }
                }
                
                // Function to obtain system information
                function getSystemInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("uname", ["-a"]);
                        process.waitForFinished(500);
                        
                        return process.readAllStandardOutput().trim() || "Unavailable";
                    } catch(e) {
                        console.error("Failed to fetch system information:", e);
                        return "unavailable";
                    }
                }
                
                // Notification history
                property string notificationLog: ""
                
                // Function to add to the record
                function addToLog(message) {
                    const timestamp = new Date().toLocaleTimeString();
                    notificationLog = `[${timestamp}] ${message}\n${notificationLog}`;
                    
                    // Maintain maximum log
                    const lines = notificationLog.split('\n');
                    if(lines.length > 20) {
                        notificationLog = lines.slice(0, 20).join('\n');
                    }
                    
                    if(logText) {
                        logText.text = notificationLog;
                    }
                }
                
                //=======================
                // User interface components
                //=======================
                // Notification component
                Component {
                    id: notificationItemComponent
                    
                    Item {
                        id: notificationItem
                        property var notification
                        property real opacity: 1.0
                        
                        // Appearance and disappearance animation
                        OpacityAnimation on opacity {
                            id: opacityAnimation
                            duration: 50
                            easing.type: Easing.OutQuart
                        }
                        
                        // Background with rounded edges
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: "#000000"
                            border.width: 0
                            opacity: notificationItem.opacity
                            
                            // Mouse interaction effect
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.02
                                running: false
                            }
                            
                            // Boundaries (appear when interacting)
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: "transparent"
                                border.color: Qt.rgba(pywalColors.colors[notification.colorIndex].r, 
                                                    pywalColors.colors[notification.colorIndex].g, 
                                                    pywalColors.colors[notification.colorIndex].b, 0.5)
                                border.width: 1.5
                                visible: false
                            }
                            
                            // Content
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 15
                                Spacing: 15
                                
                                // Icon
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: notificationItem.notification.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 20
                                    color: pywalColors.colors[notification.colorIndex]
                                }
                                
                                // Title and message
                                ColumnLayout {
                                    Spacing: 5
                                    
                                    Text {
                                        text: notificationItem.notification.title
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: pywalColors.colors[7]
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }
                                    
                                    Text {
                                        text: notificationItem.notification.message
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 14
                                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                        wrapMode: Text.Wrap
                                    }
                                }
                                
                                //Close button
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf00d" // Close icon
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                    visible: !notificationItem.isTouching
                                    
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onClicked: {
                                            if (notificationItem.onDismiss) {
                                                notificationItem.onDismiss();
                                            }
                                        }
                                        onEntered: {
                                            parent.color = pywalColors.colors[2];
                                        }
                                        onExited: {
                                            parent.color = Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5);
                                        }
                                    }
                                }
                            }
                            
                            // Interaction area
                            MouseArea {
                                id: notificationMouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                property bool isTouching: false
                                
                                onEntered: {
                                    parent.scale = 1.02;
                                    parent.children[0].children[0].visible = true; // Show borders
                                }
                                
                                onExited: {
                                    parent.scale = 1.0;
                                    parent.children[0].children[0].visible = false; // Hide borders
                                }
                                
                                onClicked: {
                                    if (notificationItem.onAction) {
                                        notificationItem.onAction();
                                    }
                                }
                            }
                        }
                    }
                }
                
                //Control component
                Component {
                    id: controlItemComponent
                    
                    Item {
                        id: controlItem
                        property var item
                        width: parent.width
                        height: parent.height
                        
                        // Background
                        Rectangle {
                            anchors.fill: parent
                            radius: 20
                            color: "#000000"
                            border.width: 0
                            
                            // Icon
                            Text {
                                anchors.centerIn: parent
                                text: controlItem.item.icon
                                font.family: controlItem.item.icon.startsWith("\\uf") ? faSolid.name : faBrands.name
                                font.pixelSize: 24
                                color: controlItem.item.active ? 
                                    pywalColors.colors[controlItem.item.colorIndex] : 
                                    Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                            }
                            
                            // Activity indicator
                            Rectangle {
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 8
                                height: 8
                                radius: 4
                                color: pywalColors.colors[controlItem.item.colorIndex]
                                visible: controlItem.item.active
                            }
                        }
                        
                        // Animation of interaction with the mouse
                        ScaleAnimation on scale {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 1.0
                            to: 1.05
                            running: false
                        }
                        
                        // Interaction area
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                if (controlItem.onClicked) {
                                    controlItem.onClicked();
                                }
                            }
                            onEntered: {
                                parent.scale = 1.05;
                            }
                            onExited: {
                                parent.scale = 1.0;
                            }
                        }
                    }
                }
                
                // Tab component
                Component {
                    id: tabButtonComponent
                    
                    Item {
                        id: tabButton
                        property string icon
                        property bool active: false
                        width: 50
                        height: 50
                        
                        // Background
                        Rectangle {
                            anchors.fill: parent
                            radius: 25
                            color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                            
                            // Icon
                            Text {
                                anchors.centerIn: parent
                                text: tabButton.icon
                                font.family: faSolid.name
                                font.pixelSize: 18
                                color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                            }
                        }
                        
                        // Interaction area
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                if(tabButton.onClicked) {
                                    tabButton.onClicked();
                                }
                            }
                            onEntered: {
                                if(!active) {
                                    parent.scale = 1.05;
                                }
                            }
                            onExited: {
                                if(!active) {
                                    parent.scale = 1.0;
                                }
                            }
                        }
                    }
                }
            }

            //===============
            // Notification Manager
            //===============
            QtObject {
                id: notifireManager
                
                // Create a notification
                function createNotification(title, message, icon, colorIndex, timeout) {
                    notifyCapsule.createNotification(title, message, icon, colorIndex, timeout);
                }
                
                // Create a test notification
                function createTestNotification(appName, title, message, timeout) {
                    notifyCapsule.createTestNotification(appName, title, message, timeout);
                }
                
                // Remove notification
                function removeNotification(id) {
                    notifyCapsule.removeNotification(id);
                }
                
                // Clear all notifications
                function clearAllNotifications() {
                    notifyCapsule.clearAllNotifications();
                }
                
                // Receive notifications from the system via DBus
                Connections {
                    target: notificationSystem
                    onNotificationReceived: {
                        // Specify the notification color based on the type
                        let colorIndex = 4; // Default (blue)
                        if (appName === "Mail") colorIndex = 3; //Green for mail
                        else if (appName === "Calendar") colorIndex = 5; //Violet for calendar
                        else if (appName === "System") colorIndex = 1; //red for system
                        
                        // Create notification
                        notifyCapsule.createNotification(
                            summary,
                            body,
                            iconPath ? iconPath: "\uf0f3", // Default bell icon
                            colorIndex,
                            5000 // 5 seconds
                        );
                    }
                }
            }

            //================================
            // DBus Notification Receiving System
            //================================
            QtObject {
                id: notificationSystem
                signal notificationReceived(string appName, string summary, string body, string iconPath)
                
                Component.onCompleted: {
                    // Create a DBus connection to receive notifications
                    try {
                        const dbus = Qt.createQmlObject('import Qt.labs.dbus 6.8; DBus', root, "DBus");
                        const connection = dbus. sessionBus();
                        
                        if(connection) {
                            //Subscribe to system notifications
                            connection.connect("org.freedesktop.Notifications", "/org/freedesktop/Notifications", 
                                "org.freedesktop.Notifications", "Notification", function(appName, replacementsId, appIcon, summary, body, actions, hints, expireTimeout) {
                                notificationReceived(appName, summary, body, appIcon);
                            });
                        }
                    } catch(e) {
                        console.error("Failed to establish DBus connection:", e);
                    }
                }
            }

            //===============================
            // Process keyboard shortcuts
            //===============================
            Keys.onPressed: {
                //Meta+N shortcut to open Notifire capsule
                if (event.key === Qt.Key_N && event.modifiers & Qt.MetaModifier) {
                    notifireCapsule.onClicked();
                    event.accepted = true;
                }
                
                //Esc shortcut to close the Notifire capsule
                if (event.key === Qt.Key_Escape && notifireCapsule.isExpanded) {
                    notifireCollapseAnimation.restart();
                    notifireCapsule.isExpanded = false;
                    activeCapsule = "";
                    event.accepted = true;
                }
                
                // Shortcut to clear all notifications (Meta+Shift+C)
                if (event.key === Qt.Key_C && event.modifiers & Qt.MetaModifier && event.modifiers & Qt.ShiftModifier) {
                    notifyCapsule.clearAllNotifications();
                    event.accepted = true;
                }
            }

            //=================
            // Settings capsule
            //=================
            Capsule {
                id: settingsCapsule
                icon: "\uf013" // Settings icon
                colorIndex: 4
                capsuleId: "settings"
                width: 50
                height: 50
                property bool isExpanded: false
                property bool isRightClicked: false
                property int animationduration: 50
                
                // Right-button expansion animation 
                ParallelAnimation {
                    id: rightClickExpandAnimation
                    NumberAnimation {
                        target: settingsCapsule
                        property: "width"
                        to: 200
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Right button shrink animation 
                ParallelAnimation {
                    id: rightClickCollapseAnimation
                    NumberAnimation {
                        target: settingsCapsule
                        property: "width"
                        to: 50
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                }
                
                //Left button expansion animation 
                ParallelAnimation {
                    id: settingsExpandAnimation
                    NumberAnimation {
                        target: settingsCapsule
                        property: "width"
                        to: 100
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1.05
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Shrink animation for left button 
                ParallelAnimation {
                    id: settingsCollapseAnimation
                    NumberAnimation {
                        target: settingsCapsule
                        property: "width"
                        to: 50
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                    ScaleAnimation {
                        target: capsuleBase
                        property: "scale"
                        to: 1
                        duration: animationDuration
                        easing.type: Easing.OutQuart
                    }
                }
                
                // Base capsule (circular)
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width/2
                    color: "#000000"
                    border.width: 0
                    
                    // Icon
                    Text {
                        anchors.centerIn: parent
                        text: settingsCapsule.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }
                }
                
                // Hover animation 
                ScaleAnimation {
                    id: hoverAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: animationDuration
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                // Mouse interaction
                MouseArea {
                    id: settingsMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    
                    onEntered: {
                        if(!isExpanded) {
                            hoverAnimation.running = true;
                        }
                    }
                    
                    onExited: {
                        hoverAnimation.to = 1.0;
                        hoverAnimation.running = true;
                        if(!isExpanded) capsuleBase.scale = 1.0;
                    }
                    
                    // Left-click processing
                    onClicked: {
                        if (mouse.button === Qt.LeftButton) {
                            // Close all other capsules
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId!== "settings") {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            // Temporarily expand this capsule
                            settingsExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            // Open the Settings app as a separate app
                            openSettingsApp();
                            
                            // Close the capsule after opening the settings
                            setTimeout(function() {
                                settingsCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }, 200);
                        }
                    }
                    
                    // Right click processing
                    onPressAndHold: {
                        if(!isExpanded) {
                            // Close all other capsules
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId!== "settings") {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            // Expand this capsule
                            rightClickExpandAnimation.restart();
                            isExpanded = true;
                            isRightClicked = true;
                            activeCapsule = capsuleId;
                            
                            // Show editing options
                            editOptions.visible = true;
                            editOptions.opacity = 0;
                            fadeInAnimation.target = editOptions;
                            fadeInAnimation.restart();
                        } else if (isRightClicked) {
                            // Close the capsule
                            rightClickCollapseAnimation.restart();
                            isExpanded = false;
                            isRightClicked = false;
                            activeCapsule = "";
                            
                            // Hide editing options
                            fadeOutAnimation.target = editOptions;
                            fadeOutAnimation.onCompleted = function() {
                                editOptions.visible = false;
                            };
                            fadeOutAnimation.restart();
                        }
                    }
                }
                
                // Modification options (shown when right-clicked)
                Item {
                    id: editOptions
                    anchors.fill: parent
                    visible: false
                    opacity: 0
                    
                    // Option to modify Hyprland file
                    Rectangle {
                        id: hyprlandOption
                        anchors.left: parent.left
                        anchors.leftMargin: 60
                        anchors.verticalCenter: parent.verticalCenter
                        width: 120
                        height: 40
                        radius: 20
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        border.color: pywalColors.colors[2]
                        border.width: 1
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Hyprland File"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[2]
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                openHyprlandConfig();
                            }
                            onEntered: {
                                parent.scale = 1.05;
                            }
                            onExited: {
                                parent.scale = 1.0;
                            }
                        }
                    }
                    
                    // Option to modify QuickShell file
                    Rectangle {
                        id: quickshellOption
                        anchors.left: hyprlandOption.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        width: 120
                        height: 40
                        radius: 20
                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                        border.color: pywalColors.colors[5]
                        border.width: 1
                        
                        Text {
                            anchors.centerIn: parent
                            text: "QuickShell file"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[5]
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                openQuickShellConfig();
                            }
                            onEntered: {
                                parent.scale = 1.05;
                            }
                            onExited: {
                                parent.scale = 1.0;
                            }
                        }
                    }
                }
                
                // Appearance animation
                OpacityAnimation {
                    id: fadeInAnimation
                    from: 0
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                //Disappearance Animation
                OpacityAnimation {
                    id: fadeOutAnimation
                    from: 1
                    to: 0
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                //====================
                // System functions
                //====================
                // Open the Settings app as a separate app
                function openSettingsApp() {
                    try {
                        // Create a new window for the Settings app
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        
                        // Use the appropriate command to open the Settings app
                        process.start("qrc:/SettingsApp/SettingsApp.qml", ["--new-window"]);
                        
                        console.log("The Settings app has been opened as a separate app");
                    } catch(e) {
                        console.error("Failed to open Settings app:", e);
                        //Alternative attempt
                        try {
                            const alternativeProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            alternativeProcess.start("qmlscene", ["qrc:/SettingsApp/SettingsApp.qml"]);
                        } catch (e2) {
                            console.error("All attempts to open the Settings app failed:", e2);
                        }
                    }
                }
                
                //Open Hyprland file for editing
                function openHyprlandConfig() {
                    try {
                        // Specify the configuration file path
                        const homeDir = "/home/" + Qt.application.arguments[2];
                        const configPath = homeDir + "/.config/hypr/hyprland.conf";
                        
                        //Open file in Neovim
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("alacritty", ["-e", "nvim", configPath]);
                        
                        console.log("Hyprland file opened in Neovim");
                        
                        // Close the capsule after opening the file
                        rightClickCollapseAnimation.restart();
                        isExpanded = false;
                        isRightClicked = false;
                        activeCapsule = "";
                        
                        // Hide editing options
                        fadeOutAnimation.target = editOptions;
                        fadeOutAnimation.onCompleted = function() {
                            editOptions.visible = false;
                        };
                        fadeOutAnimation.restart();
                    } catch(e) {
                        console.error("Failed to open Hyprland file:", e);
                        
                        //Alternative attempt
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xterm", ["-e", "nvim", configPath]);
                        } catch (e2) {
                            console.error("All attempts to open the Hyprland file failed:", e2);
                        }
                    }
                }
                
                //Open QuickShell file for editing
                function openQuickShellConfig() {
                    try {
                        // Specify the configuration file path
                        const homeDir = "/home/" + Qt.application.arguments[2];
                        const configPath = homeDir + "/.config/quickshell/config.json";
                        
                        //Open file in Neovim
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("alacritty", ["-e", "nvim", configPath]);
                        
                        console.log("QuickShell file opened in Neovim");
                        
                        // Close the capsule after opening the file
                        rightClickCollapseAnimation.restart();
                        isExpanded = false;
                        isRightClicked = false;
                        activeCapsule = "";
                        
                        // Hide editing options
                        fadeOutAnimation.target = editOptions;
                        fadeOutAnimation.onCompleted = function() {
                            editOptions.visible = false;
                        };
                        fadeOutAnimation.restart();
                    } catch(e) {
                        console.error("Failed to open QuickShell file:", e);
                        
                        //Alternative attempt
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xterm", ["-e", "nvim", configPath]);
                        } catch (e2) {
                            console.error("All attempts to open the QuickShell file failed:", e2);
                        }
                    }
                }
            }

            //=====================
            // Energy capsule
            //=====================
            Capsule {
                icon: "\uf011" // Power icon from Font Awesome 7
                colorIndex: 1
                capsuleId: "power"
                width: 50
                height: 50
                onClicked: root.isPowerMenuOpen = true
            }
        }
    }
    
    //=====================
    // Energy List
    //=====================
    //Power menu area
    Item {
        id: powerMenu
        anchors.fill: parent
        visible: isPowerMenuOpen
        z: 996
        
        //Power menu background
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        // Blur effect for power menu
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        // In battery saving mode:
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        // Energy list content
        Item {
            id: powerContent
            anchors.centerIn: parent
            width: 300
            height: 400
            
            // Background with rounded edges
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                [1]
                border.width: 0
            }
            
            // List title
            Text {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Energy"
                font.family: ibmPlex.name
                font.pixelSize: 24
                color: pywalColors.colors[7]
            }
            
            //Option buttons
            Repeater {
                model: [
                    {icon: "\uf011", text: "Shutdown", color: 1},
                    {icon: "\uf021", text: "Restart", color: 4},
                    {icon: "\uf090", text: "sleep mode", color: 5},
                    {icon: "\uf08b", text: "Log Out", color: 3},
                    {icon: "\uf00d", text: "Cancel", color: 7}
                ]
                
                delegate: PowerMenuItem {
                    y: index * 80 + 40
                    width: parent.width
                    icon: modelData.icon
                    text: modelData.text
                    colorIndex: modelData.color
                    onClicked: {
                        if (index === 4) {
                            isPowerMenuOpen = false
                        } else {
                            //Energy procedure logic
                            console.log("Execution: " + modelData.text)
                        }
                    }
                }
            }
        }
        
        // Appearance animation
        OpacityAnimation on opacity {
            from: 0
            to: 1
            duration: 75
            easing.type: Easing.OutQuart
        }
        
        //handle clicking on the blank to close the power menu
        MouseArea {
            anchors.fill: parent
            onClicked: isPowerMenuOpen = false
        }
    }
    
    //====================
    // MCX System Indicators
    //====================
    // The main component of system indicators
    Item {
        id: systemIndicators
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height
        width: 320
        height: 85
        visible: false
        z: 100

        // Pointer properties
        property string currentIndicator: "volume"  // "volume", "brightness", "microphone"
        property int volumeLevel: 75
        property int brightnessLevel: 75
        property bool microphoneMuted: false
        property bool isAnimating: false

        // Temporary to automatically hide the cursor
        Timer {
            id: autoHideTimer
            interval: 2000
            onTriggered: {
                if(!isAnimating) {
                    systemIndicators.visible = false
                }
            }
        }

        //====================
        // Main indicator design
        //====================
        Rectangle {
            id: indicatorContainer
            anchors.fill: parent
            radius: 20
            color: "#000000"
            border.color: indicatorColor
            border.width: 1
            opacity: 0.92

            //Mild blur effect
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.7)"
                visible: !powerSaverModeActive
            }

            // In battery saving mode:
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.92)"
                visible: powerSaverModeActive
            }

            // In battery saving mode:
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.92)"
                visible: powerSaverModeActive
            }

            // The effect of transparency when interacting
            OpacityAnimation on opacity {
                duration: 75
                easing.type: Easing.OutQuart
            }

            // Expansion effect upon appearance
            ScaleAnimation on scale {
                id: indicatorExpandAnimation
                duration: 50
                easing.type: Easing.OutBack
                from: 0.9
                to: 1.0
            }

            //====================
            // Pointer content
            //====================
            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                Spacing: 15

                // Pointer icon
                Text {
                    id: indicatorIcon
                    layout.alignment: Qt.AlignVCenter
                    font.family: faSolid.name
                    font.pixelSize: 24
                    color: indicatorColor
                    text: indicatorIconText
                }

                // Progress bar
                Rectangle {
                    id: progressTrack
                    Layout.fillWidth: true
                    height: 8
                    radius: 4
                    color: Qt.rgba(
                        pywalColors.colors[6].r,
                        pywalColors.colors[6].g,
                        pywalColors.colors[6].b,
                        0.2
                    )

                    //Progress indicator
                    Rectangle {
                        id: progressThumb
                        width: 22
                        height: 22
                        radius: 11
                        color: "#000000"
                        border.color: indicatorColor
                        border.width: 1
                        x: (parent.width * currentLevel/100) - width/2

                        // Effect of light around the pointer
                        Rectangle {
                            anchors.fill: parent
                            radius: 10
                            color: "transparent"
                            border.color: Qt.rgba(
                                indicatorColor.r,
                                indicatorColor.g,
                                indicatorColor.b,
                                0.5
                            )
                            border.width: 0
                        }

                        // Effect of interacting with the mouse
                        ScaleAnimation on scale {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 1.0
                            to: 1.2
                            running: false
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onPressed: {
                                progressThumb.scale = 1.2
                            }
                            onReleased: {
                                progressThumb.scale = 1.0
                            }
                            onPositionChanged: {
                                let newLevel = Math.max(0, Math.min(100, (mouseX / parent.width) * 100))
                                if (systemIndicators.currentIndicator === "volume") {
                                    setVolumeLevel(newLevel)
                                } else if (systemIndicators.currentIndicator === "brightness") {
                                    setBrightnessLevel(newLevel)
                                }
                            }
                        }
                    }

                    // Larger interaction area
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            let newLevel = Math.max(0, Math.min(100, (mouseX / parent.width) * 100))
                            if (systemIndicators.currentIndicator === "volume") {
                                setVolumeLevel(newLevel)
                            } else if (systemIndicators.currentIndicator === "brightness") {
                                setBrightnessLevel(newLevel)
                            }
                        }
                    }
                }

                // Percentage
                Text {
                    id: percentageText
                    layout.alignment: Qt.AlignVCenter
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: indicatorColor
                    text: currentLevel + "%"
                }
            }
        }

        //====================
        // Functions and properties
        //====================
        
        // Specify the cursor color based on the type
        property color indicatorColor: {
            switch(currentIndicator) {
                case "volume": return pywalColors.colors[3]
                case "brightness": return pywalColors.colors[1]
                case "microphone": return microphoneMuted ? pywalColors.colors[2] : pywalColors.colors[4]
                default: return pywalColors.colors[6]
            }
        }

        // Select the cursor icon based on the type
        property string indicatorIconText: {
            switch(currentIndicator) {
                case "volume":
                    if (volumeLevel === 0) return "\uf026"  // mute
                    if (volumeLevel < 30) return "\uf027"    // low volume
                    return "\uf028"                         // high volume
                case "brightness":
                    return "\uf185"  //brightness icon
                case "microphone":
                    return microphoneMuted? "\uf131" : "\uf130"  // microphone mute/unmute
                default: return "\uf013"  // settings icon
            }
        }

        // Specify the current level based on the type
        property int currentLevel: {
            switch(currentIndicator) {
                case "volume": return volumeLevel
                case "brightness": return brightnessLevel
                case "microphone": return microphoneMuted ? 0:100
                default: return 100
            }
        }

        // Function to display the cursor
        function showIndicator(type) {
            currentIndicator = type
            visible = true
            isAnimating = true
            indicatorExpandAnimation.restart()
            
            // Restart the auto-disappearance timer
            autoHideTimer.restart()
            
            // Hide the cursor after a while
            setTimeout(() => {
                isAnimating = false
                autoHideTimer.start()
            }, 500)
        }

        // Sound control functions
        function setVolumeLevel(level) {
            volumeLevel = Math.round(level / 5) * 5  // Round to nearest 5
            autoHideTimer.restart()
            
            // Update the system volume
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("wpctl", ["set-volume", "@DEFAULT_AUDIO_SINK@", volumeLevel + "%"])
            } catch(e) {
                console.error("Failed to set volume:", e)
            }
        }

        function toggleMute() {
            if (volumeLevel === 0) {
                setVolumeLevel(50)
            } else {
                volumeLevel = 0
            }
        }

        // Brightness control functions
        function setBrightnessLevel(level) {
            brightnessLevel = Math.round(level / 5) * 5  // Round to nearest 5
            autoHideTimer.restart()
            
            // Update the brightness level in the system
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("brightnessctl", ["set", brightnessLevel + "%"])
            } catch(e) {
                console.error("Failed to set brightness level:", e)
            }
        }

        function incrementBrightness() {
            setBrightnessLevel(Math.min(100, brightnessLevel + 5))
        }

        function decideBrightness() {
            setBrightnessLevel(Math.max(0, brightnessLevel - 5))
        }

        //Microphone control functions
        function toggleMicrophoneMute() {
            microphoneMuted=!microphoneMuted
            autoHideTimer.restart()
            
            // Update the microphone status in the system
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("wpctl", ["set-mute", "@DEFAULT_AUDIO_SOURCE@", microphoneMuted ? "1" : "0"])
            } catch(e) {
                console.error("Failed to change microphone status:", e)
            }
        }

        //====================
        // Automatically update data
        //====================
        
        // Automatically update volume
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                    process.start("wpctl", ["get-volume", "@DEFAULT_AUDIO_SINK@"])
                    process.waitForFinished()
                    const output = process.readAllStandardOutput().trim()
                    
                    // Analyze the output to get the percentage
                    const match = output.match(/(\d+)%/)
                    if(match) {
                        volumeLevel = parseInt(match[1])
                    }
                } catch(e) {
                    console.error("Failed to fetch volume:", e)
                }
            }
        }

        // Automatically update brightness level
        Timer {
            interval: 2000
            repeat: true
            running: true
            onTriggered: {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                    process.start("brightnessctl", ["info"])
                    process.waitForFinished()
                    const output = process.readAllStandardOutput().trim()
                    
                    // Analyze the output to get the percentage
                    const match = output.match(/Current brightness: (\d+)%/)
                    if(match) {
                        brightnessLevel = parseInt(match[1])
                    }
                } catch(e) {
                    console.error("Failed to fetch brightness level:", e)
                }
            }
        }

        //====================
        // Handling system events
        //====================
        
        // Handling keyboard events
        Keys.onPressed: {
            // Mute (XF86AudioMute)
            if (event.key === Qt.Key_MediaToggle) {
                systemIndicators.showIndicator("volume")
                systemIndicators.toggleMute()
                event.accepted = true
            }
            
            // Volume Up (XF86AudioRaiseVolume)
            if (event.key === Qt.Key_VolumeUp) {
                systemIndicators.showIndicator("volume")
                systemIndicators.setVolumeLevel(Math.min(100, systemIndicators.volumeLevel + 5))
                event.accepted = true
            }
            
            // Lower the volume (XF86AudioLowerVolume)
            if (event.key === Qt.Key_VolumeDown) {
                systemIndicators.showIndicator("volume")
                systemIndicators.setVolumeLevel(Math.max(0, systemIndicators.volumeLevel - 5))
                event.accepted = true
            }
            
            // Change brightness (XF86MonBrightnessUp)
            if (event.key === Qt.Key_BrightnessUp) {
                systemIndicators.showIndicator("brightness")
                systemIndicators.increaseBrightness()
                event.accepted = true
            }
            
            // Change brightness (XF86MonBrightnessDown)
            if (event.key === Qt.Key_BrightnessDown) {
                systemIndicators.showIndicator("brightness")
                systemIndicators.decreaseBrightness()
                event.accepted = true
            }
            
            //Mute/Unmute Microphone (XF86AudioMicMute)
            if (event.key === Qt.Key_MicMuteToggle) {
                systemIndicators.showIndicator("microphone")
                systemIndicators.toggleMicrophoneMute()
                event.accepted = true
            }
        }
    }
    
    //=====================
    // Integration with C++ to improve performance
    //=====================
    
    // Image processing using ImageProcessor
    Image {
        id: backgroundImage
        source: "qrc:/resources/images/wallpaper1.jpg"
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
    }
    
    ShaderEffectSource {
        id: blurredBackground
        sourceItem: backgroundImage
        width: parent.width
        height: parent.height
        hideSource: true
        
        // Use C++ image processor to apply glass effect
        onSourceChanged: {
            const processor = ImageProcessor
            const blurred = processor.applyGlassMorphism(
                sourceItem.grabToImageSync(), 15, 0.2
            )
            source = blurred
        }
    }
    
    // Interact with sound to create visual effects
    Item {
        id: soundVisualizer
        anchors.fill: parent
        visible: false
        
        Repeater {
            model: 64
            Rectangle {
                id: bar
                width: parent.width / 64
                height: AudioVisualizer.frequencyData[index] * parent.height
                x: index * width
                y: parent.height - height
                color: Qt.hsla(index / 64, 0.8, 0.6, 0.8)
                
                // Sound level dependent motion effects
                NumberAnimation on height {
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }
        }
        
        // Interact with the microphone button
        Button {
            id: audioButton
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            width: 120
            height: 50
            radius: 20
            color: pywalColors.colors[4]
            [4]
            border.width: 0
            
            Text {
                anchors.centerIn: parent
                text: "\uf130" // Microphone icon from Font Awesome 7
                font.family: faSolid.name
                font.pixelSize: 18
                color: "#000000"
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AudioVisualizer.isListening=!AudioVisualizer.isListening
                }
            }
        }
    }
    
    // Predict user actions
    Rectangle {
        id: predictionIndicator
        width: parent.width * 0.8
        height: 60
        anchors {
            bottom: parent.bottom
            bottomMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        color: "#000000"
        border.width: 0
        radius: 30
        
        Text {
            id: predictionText
            text: "Prediction:" + 
                  (UserBehaviorAnalyzer.predictedNextAction!== -1 ? 
                   ["Lock Screen", "Open App List", "Show Notification Center", "Open Settings"][UserBehaviorAnalyzer.predictedNextAction] : 
                   "No predictions currently")
            anchors.centerIn: parent
            color: UserBehaviorAnalyzer.predictionConfidence > 0.7 ? pywalColors.colors[4] : 
                   UserBehaviorAnalyzer.predictionConfidence > 0.4 ? pywalColors.colors[5] : pywalColors.colors[7]
            font.pixelSize: 16
            opacity: 0
            
            //Soft entry effect
            OpacityAnimation on opacity {
                duration: 50
                from: 0
                to: 1
            }
        }
        
        // Trust Index
        Rectangle {
            width: predictionIndicator.width * UserBehaviorAnalyzer.predictionConfidence
            height: 5
            anchors {
                bottom: predictionText.top
                bottomMargin: 10
                horizontalCenter: predictionIndicator.horizontalCenter
            }
            color: UserBehaviorAnalyzer.predictionConfidence > 0.7 ? pywalColors.colors[4] :
                    UserBehaviorAnalyzer.predictionConfidence > 0.4 ? pywalColors.colors[5] : pywalColors.colors[7]
            radius: 2.5
        }
    }
    
    // Record user actions
    Connections {
        target: statusBar
        function onActiveCapsuleChanged() {
            if(statusBar.activeCapsule === "power") {
                UserBehaviorAnalyzer.recordUserAction(0, "opened_power_menu")
            } else if (statusBar.activeCapsule === "clock") {
                UserBehaviorAnalyzer.recordUserAction(1, "checked_time")
            } else if (statusBar.activeCapsule === "battery") {
                UserBehaviorAnalyzer.recordUserAction(2, "checked_battery")
            } else if (statusBar.activeCapsule === "volume") {
                UserBehaviorAnalyzer.recordUserAction(3, "adjusted_volume")
            } else if (statusBar.activeCapsule === "crosire") {
                UserBehaviorAnalyzer.recordUserAction(6, "opened_crosire")
            }
        }
    }
    
    Connections {
        target: root
        function onIsAppLauncherOpenChanged() {
            if(root.isAppLauncherOpen) {
                UserBehaviorAnalyzer.recordUserAction(4, "opened_app_launcher")
            }
        }
        
        function onIsPowerMenuOpenChanged() {
            if (root.isPowerMenuOpen) {
                UserBehaviorAnalyzer.recordUserAction(5, "opened_power_menu")
            }
        }
    }
    
    //Memory usage indicator
    Rectangle {
        id: memoryIndicator
        width: 80
        height: 20
        anchors.right: statusBar.right
        anchors.rightMargin: 20
        anchors.verticalCenter: statusBar.verticalCenter
        radius: 10
        color: "#333333"
        
        Rectangle {
            width: memoryIndicator.width * (ResourceManager.currentMemoryUsage / ResourceManager.maxMemoryUsage)
            height: memoryIndicator.height
            color: width > memoryIndicator.width * 0.8? "#FF0000": "#4CAF50"
            radius: 10
        }
        
        Text {
            anchors.centerIn: parent
            text: Math.round(ResourceManager.currentMemoryUsage / (1024 * 1024)) + "MB"
            color: "#FFFFFF"
            font.pixelSize: 12
        }
        
        // Warning when memory usage is high
        Connections {
            target: ResourceManager
            function onMemoryPressureWarning(current, max) {
                if (current > max * 0.9) {
                    memoryIndicator.color = "#FF5252"
                } else {
                    memoryIndicator.color = "#333333"
                }
            }
        }
    }
    
    //=====================
    // System components
    //=====================
    // Capsule component
    Component {
        id: capsuleComponent
        
        Item {
            id: capsule
            property string icon
            property string label
            property int colorIndex
            property string capsuleId
            width: 100
            height: 50
            property bool isExpanded: false
            
            // Base capsule (circular)
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 // Make it perfectly circular
                color: "#000000"
                border.width: 0 // Remove borders completely
            }
                
            // Icon only (untitled)
            Text {
                anchors.centerIn: parent
                text: capsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
                
            // Label
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: capsule.label
                font.family: ibmPlex.name
                font.pixelSize: 16
                color: pywalColors.colors[colorIndex]
            }
        }
        
        // Animation of interaction with the mouse
        ScaleAnimation on scale {
            target: parent
            from: 1
            to: 1.02
            duration: 50
            easing.type: Easing.OutQuart
            running: false
        }
        
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.scale = 1.02
                capsuleBase.border.width=3
            }
            onExited: {
                parent.scale = 1
                capsuleBase.border.width=2
            }
            onClicked: {
                // Special processing for AI capsule
                if (capsule.capsuleId === "crosire") {
                    expandAnimation.to = 140
                    expandAnimation.restart()
                    crosireContent.visible=!crosireContent.visible
                } else {
                    collapseAnimation.restart()
                }
                
                capsule.isExpanded = false
                activeCapsule = ""
                
                // Special processing for Arch capsule
                if (capsule.capsuleId === "arch") {
                    isAppLauncherOpen = false
                }
            }
        }
    }
    
    // Sound capsule component
    Component {
        id: musicCapsuleComponent
        
        Item {
            id: musicCapsule
            property string icon
            property string label
            property int colorIndex
            property string capsuleId
            width: 100
            height: 50
            property bool isExpanded: false
            
            // Base capsule (circular)
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 // Make it perfectly circular
                color: "#000000"
                border.width: 0 // Remove borders completely
            }
                
            // Icon only (untitled)
            Text {
                anchors.centerIn: parent
                text: musicCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                target: parent
                from: 1
                to: 1.02
                duration: 50
                easing.type: Easing.OutQuart
                running: false
            }
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.scale = 1.02
                    capsuleBase.border.width=3
                }
                onExited: {
                    parent.scale = 1
                    capsuleBase.border.width=2
                }
                onClicked: {
                    // Expand the sound capsule
                    isExpanded = !isExpanded;
                    if (isExpanded) {
                        musicCapsuleExpandAnimation.restart();
                        activeCapsule = "music";
                    } else {
                        musicCapsuleCollapseAnimation.restart();
                        activeCapsule = "";
                    }
                }
            }
            
            // Expansion Animation
            ParallelAnimation {
                id: expandAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 250
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                // Add a "click" effect on click
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.05
                    from: 1.1
                    duration: 50
                    easing.type: Easing.OutBack
                    delay: 100
                }
            }

            // Shrinkage animation
            ParallelAnimation {
                id: collapseAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 100
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }

            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            // Click animation on click
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
        }
    }

    //Capsule clipboard component
    Component {
        id: clipboardCapsuleComponent
        
        Item {
            id: clipboardCapsule
            property string icon
            property string label
            property int colorIndex
            property string capsuleId
            width: 100
            height: 50
            property bool isExpanded: false
            
            // Base capsule (circular)
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 // Make it perfectly circular
                color: "#000000"
                border.width: 0 // Remove borders completely
            }
                
            // Icon only (untitled)
            Text {
                anchors.centerIn: parent
                text: clipboardCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                target: parent
                from: 1
                to: 1.02
                duration: 50
                easing.type: Easing.OutQuart
                running: false
            }
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.scale = 1.02
                    capsuleBase.border.width=3
                }
                onExited: {
                    parent.scale = 1
                    capsuleBase.border.width=2
                }
                onClicked: {
                    // Expand the clipboard capsule
                    isExpanded = !isExpanded;
                    if (isExpanded) {
                        clipboardCapsuleExpandAnimation.restart();
                        activeCapsule = "clipboard";
                    } else {
                        clipboardCapsuleCollapseAnimation.restart();
                        activeCapsule = "";
                    }
                }
            }
            
            // Expansion Animation
            ParallelAnimation {
                id: expandAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 250
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                // Add a "click" effect on click
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.05
                    from: 1.1
                    duration: 50
                    easing.type: Easing.OutBack
                    delay: 100
                }
            }

            // Shrinkage animation
            ParallelAnimation {
                id: collapseAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 100
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }

            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            // Click animation on click
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
        }
    }

    // AI capsule component
    Component {
        id: crosireCapsuleComponent
        
        Item {
            id: crosireCapsule
            property string icon
            property string label
            property int colorIndex
            property string capsuleId
            width: 100
            height: 50
            property bool isExpanded: false
            property bool isListening: false
            
            // Base capsule (circular)
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 // Make it perfectly circular
                color: "#000000"
                border.width: 0 // Remove borders completely
            }
                
            // Icon only (untitled)
            Text {
                anchors.centerIn: parent
                text: crosireCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }

            // Animation effect run
            ScaleAnimation on scale {
            id: iconPulse
                duration: 50
                from: 1
                to: 1.1
                loops: Animation.Infinite
                running: crosireCapsule.isListening
                easing.type: Easing.OutInQuad
            }
            
            // Label
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: crosireCapsule.label
                font.family: ibmPlex.name
                font.pixelSize: 16
                color: pywalColors.colors[colorIndex]
            }
        }
        
        // Animation of interaction with the mouse
        ScaleAnimation on scale {
            target: parent
            from: 1
            to: 1.02
            duration: 50
            easing.type: Easing.OutQuart
            running: false
        }
        
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.scale = 1.02
                capsuleBase.border.width=3
            }
            onExited: {
                parent.scale = 1
                capsuleBase.border.width=2
            }
            onClicked: {
                // Expand Crosire Capsule
                isExpanded = !isExpanded;
                if (isExpanded) {
                    crosireCapsuleExpandAnimation.restart();
                    activeCapsule = "crosire";
                } else {
                    crosireCapsuleCollapseAnimation.restart();
                    activeCapsule = "";
                }
            }
            
            // Expansion Animation
            ParallelAnimation {
                id: expandAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 250
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                // Add a "click" effect on click
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1.05
                    from: 1.1
                    duration: 50
                    easing.type: Easing.OutBack
                    delay: 100
                }
            }

            // Shrinkage animation
            ParallelAnimation {
                id: collapseAnimation
                NumberAnimation {
                    target: capsule
                    property: "width"
                    to: 100
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                ScaleAnimation {
                    target: capsuleBase
                    property: "scale"
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }

            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            // Click animation on click
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
            
           // Artificial Intelligence Jobs
            property string currentQuery: ""
            property string currentResponse: ""
            property string token: "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";

            function queryCrosire(query) {
                currentQuery = query;
                currentResponse = "Thinking about...";
                
                try {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", "https://openrouter.ai/api/v1/chat/completions");
                    xhr.setRequestHeader("Authorization", "Bearer" + token);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                const response = JSON.parse(xhr.responseText);
                                currentResponse = response.choices[0].message.content;
                            } else {
                                currentResponse = "An error occurred connecting to Crosire";
                            }
                        }
                    };
                    
                    xhr.send(JSON.stringify({
                        "model": "qwen3-max",
                        "messages": [
                            {"role": "user", "content": query}
                        ]
                    }));
                } catch(e) {
                    console.error("Crosire call failed:", e);
                    currentResponse = "Failed to connect to Crosire";
                }
            }
        }
    }
    
    //Power button component
    Component {
        id: powerMenuItemComponent
        
        Item {
            id: powerMenuItem
            property string icon
            property string text
            property int colorIndex
            
            Rectangle {
                anchors.fill: parent
                radius: 25
                color: "#000000"
                [colorIndex]
                border.width: 0
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    Spacing: 15
                    
                    Text {
                        text: powerMenuItem.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }
                    
                    Text {
                        text: powerMenuItem.text
                        font.family: ibmPlex.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                        Layout.fillWidth: true
                    }
                }
                
                // Animation of interaction with the mouse
                ScaleAnimation on scale {
                    target: parent
                    from: 1
                    to: 1.05
                    duration: 50
                    easing.type: Easing.OutQuart
                    running: false
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.scale = 1.05
                    onExited: parent.scale = 1.0
                    onClicked: powerMenuItem.onClicked()
                }
            }
        }
    }
    
    //=====================
    // Handling system events
    //=====================
    
    // Handling keyboard events
    Keys.onPressed: {
        // Switch to lock screen (Super + L)
        if (event.key === Qt.Key_L && event.modifiers & Qt.MetaModifier) {
            isLocked = true;
            event.accepted = true;
        }

        // Application launcher (Super only)
        if (event.key === Qt.Key_Meta && event.modifiers === Qt.NoModifier) {
            isAppLauncherOpen=!isAppLauncherOpen;
            event.accepted = true;
        }
        
        // Mute (XF86AudioMute)
        if (event.key === Qt.Key_MediaToggle) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.setVolumeLevel(indicatorPopup.volumeLevel === 0 ? 50:0)
            event.accepted = true
        }
        
        // Volume Up (XF86AudioRaiseVolume)
        if (event.key === Qt.Key_VolumeUp) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.increaseVolume()
            event.accepted = true
        }
        
        // Lower the volume (XF86AudioLowerVolume)
        if (event.key === Qt.Key_VolumeDown) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.decreaseVolume()
            event.accepted = true
        }
        
        //Mute/Unmute Microphone (XF86AudioMicMute)
        if (event.key === Qt.Key_MicMuteToggle) {
            toggleMicrophoneMute();
            event.accepted = true;
        }

        // Increase brightness (XF86MonBrightnessUp)
        if (event.key === Qt.Key_BrightnessUp) {
            indicatorPopup.showIndicator("brightness")
            indicatorPopup.increaseBrightness()
            event.accepted = true
        }
        
        // Reduce brightness (XF86MonBrightnessDown)
        if (event.key === Qt.Key_BrightnessDown) {
            indicatorPopup.showIndicator("brightness")
            indicatorPopup.decreaseBrightness()
            event.accepted = true
        }
        
        // Notification Center (Super + N)
        if (event.key === Qt.Key_N && event.modifiers & Qt.AltModifier) {
            isNotificationCenterOpen=!isNotificationCenterOpen
            event.accepted = true
        }
        
        // Power menu (Super + Esc)
        if (event.key === Qt.Key_Escape && event.modifiers & Qt.MetaModifier) {
            isPowerMenuOpen=!isPowerMenuOpen;
            event.accepted = true;
        }
        
        // Artificial Intelligence (Super + C)
        if (event.key === Qt.Key_C && event.modifiers & Qt.AltModifier) {
            crosireContent.visible=!crosireContent.visible
            event.accepted = true
        }
        
        Keys.onPressed: {
            //Ctrl+Shift+Esc shortcut: Activate AOD mode
            if (event.key === Qt.Key_Escape && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                if (isLocked &&!isAODActive) {
                    lockScreen.enterAODModeMCX();
                } else if (isAODActive) {
                    lockScreen.wakeUpFromAOD();
                }
                event.accepted = true;
            }

        //===========================
        // Keyboard event handler
        //===========================
        Keys.onPressed: {
            // Super + E shortcut: Open the Drile app
            if (event.key === Qt.Key_E && event.modifiers === Qt.MetaModifier) {
                openDrileApp();
                event.accepted = true;
            }

            // Shortcut Ctrl + Shift + Q: Open the Settings app (Home)
            if (event.key === Qt.Key_Q && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("main");
                event.accepted = true;
            }

            // Ctrl+Shift+W shortcut: Open the Settings app (General Settings)
            if (event.key === Qt.Key_W && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("general");
                event.accepted = true;
            }

            // Ctrl+Shift+E shortcut: Open the Settings app (shortcuts section)
            if (event.key === Qt.Key_E && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("shortcuts");
                event.accepted = true;
            }
        }

        // Open clipboard (Super + V)
        if (event.key === Qt.Key_V && event.modifiers & Qt.AltModifier) {
            clipboardExpanded.visible=!clipboardExpanded.visible
            event.accepted = true
        }
    }
    
    //handle clicking on the space to close the expanded capsules
    MouseArea {
        anchors.fill: parent
        visible: activeCapsule!== ""
        onClicked: {
            for (let i = 0; i < capsuleLayout.children.length; i++) {
                let child = capsuleLayout.children[i]
                if (child.isExpanded) {
                    //Special processing of keyboard capsule
                    if (child.capsuleId === "keyboard") {
                        keyboardCapsule.collapseAnimation.restart()
                    }
                    
                    // Special handling of the clipboard capsule
                    if (child.capsuleId === "clipboard") {
                        clipboardExpanded.visible = false;
                        clipboardCapsule.collapseAnimation.restart()
                    }
                    
                    // Special processing for AI capsule
                    if (child.capsuleId === "crosire") {
                        crosireExpanded.visible = false;
                        crosireCapsule.crosireCollapseAnimation.restart()
                    }
                    
                    child.isExpanded = false
                    activeCapsule = ""
                }
            }
        }
    }

    //==============================
    // Integration with C++ (entry point)
    //==============================
    QtObject {
        id: cppIntegration
        property bool initialized: false
        property bool isDebugMode: false
        property int lastGC: 0
        property var pendingCalls: []
        property bool isProcessingCalls: false
        
        // Basic system services
        property var systemServices: {
            "power": null,
            "battery": null,
            "audio": null,
            "display": null,
            "network": null,
            "resources": null
        }
        
        // Resource monitoring
        property int cpuUsage: 0
        property int memoryUsage: 0
        property int gpuUsage: 0
        property bool isThrottling: false
        
        // Performance settings
        property int animationduration: 50
        property int animationEasing: Easing.OutQuart
        property bool opacityAnimationsEnabled: true
        property bool scaleAnimationsEnabled: true
        property bool slideAnimationsEnabled: true
        property bool rippleAnimationsEnabled: true
        
        // System configuration
        function initialize() {
            if (initialized) return;
            
            try {
                // Configure basic services
                initializeSystemServices();
                
                // Start monitoring resources
                startResourceMonitoring();
                
                // Download system settings
                loadSystemSettings();
                
                initialized = true;
                console.log("C++ integration configured successfully");
            } catch(e) {
                console.error("C++ integration configuration failed:", e);
            }
        }
        
        // Configure basic services
        function initializeSystemServices() {
            // Configure the power service
            systemServices.power = {
                getPowerMode: function(callback) {
                    Qt.callCpp("power.getPowerMode", function(mode) {
                        callback(mode);
                    });
                },
                setPowerMode: function(mode, callback) {
                    Qt.callCpp("power.setPowerMode", mode, function(success) {
                        if(success) {
                            updatePerformanceSettings(mode);
                        }
                        callback(success);
                    });
                }
            };
            
            // Configure battery service
            systemServices.battery = {
                getBatteryStatus: function(callback) {
                    Qt.callCpp("battery.getBatteryStatus", function(status) {
                        callback(status);
                    });
                },
                monitorBattery: function(callback) {
                    Qt.callCpp("battery.monitorBattery", callback);
                }
            };
            
            // Configure the audio service
            systemServices.audio = {
                getVolume: function(callback) {
                    Qt.callCpp("audio.getVolume", function(volume) {
                        callback(volume);
                    });
                },
                setVolume: function(volume, callback) {
                    Qt.callCpp("audio.setVolume", volume, callback);
                },
                getMuteStatus: function(callback) {
                    Qt.callCpp("audio.getMuteStatus", function(isMuted) {
                        callback(isMuted);
                    });
                },
                toggleMute: function(callback) {
                    Qt.callCpp("audio.toggleMute", callback);
                }
            };
            
            // Configure the display service
            systemServices.display = {
                getBrightness: function(callback) {
                    Qt.callCpp("display.getBrightness", function(brightness) {
                        callback(brightness);
                    });
                },
                setBrightness: function(brightness, callback) {
                    Qt.callCpp("display.setBrightness", brightness, callback);
                },
                takeScreenshot: function(options, callback) {
                    Qt.callCpp("display.takeScreenshot", options, callback);
                }
            };
            
            // Configure the network service
            systemServices.network = {
                getActiveConnection: function(callback) {
                    Qt.callCpp("network.getActiveConnection", function(connection) {
                        callback(connection);
                    });
                },
                scanWiFi: function(callback) {
                    Qt.callCpp("network.scanWiFi", function(nets) {
                        callback(networks);
                    });
                }
            };
            
            // Configure the resource service
            systemServices.resources = {
                getSystemUsage: function(callback) {
                    Qt.callCpp("resources.getSystemUsage", function(usage) {
                        callback(usage);
                    });
                },
                collectGarbage: function() {
                    Qt.callCpp("resources.collectGarbage");
                },
                setUpdateInterval: function(interval) {
                    Qt.callCpp("resources.setUpdateInterval", interval);
                }
            };
        }
        
        // Start monitoring resources
        function startResourceMonitoring() {
            Timer {
                id: resourceMonitorTimer
                interval: 2000
                running: true
                onTriggered: {
                    systemServices.resources.getSystemUsage(function(usage) {
                        cpuUsage = usage.cpu;
                        memoryUsage = usage.memory;
                        gpuUsage = usage.gpu || 0;
                        
                        // Take automatic actions based on resource usage
                        if (cpuUsage > 90 || memoryUsage > 85) {
                            throttleSystem();
                        } else if (isThrottling && cpuUsage < 70 && memoryUsage < 70) {
                            restorePerformance();
                        }
                    });
                }
            }
        }
        
        // Download system settings
        function loadSystemSettings() {
            try {
                const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                fs.source = "/home/user/.config/quickshell/system-settings.json";
                const data = fs.read();
                
                if(data) {
                    const settings = JSON. parse(data);
                    animationDuration = settings.animationDuration || 75;
                    animationEasing = settings.animationEasing || Easing.OutQuart;
                    opacityAnimationsEnabled = settings.opacityAnimationsEnabled !== false;
                    scaleAnimationsEnabled = settings.scaleAnimationsEnabled !== false;
                    slideAnimationsEnabled = settings.slideAnimationsEnabled !== false;
                    rippleAnimationsEnabled = settings. rippleAnimationsEnabled !== false;
                }
            } catch(e) {
                console.error("Failed to load system settings:", e);
            }
        }
        
        // Save system settings
        function saveSystemSettings() {
            try {
                const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                fs.source = "/home/user/.config/quickshell/system-settings.json";
                fs.write(JSON.stringify({
                    animationDuration: animationDuration,
                    animationEasing: animationEasing,
                    opacityAnimationsEnabled: opacityAnimationsEnabled,
                    scaleAnimationsEnabled: scaleAnimationsEnabled,
                    slideAnimationsEnabled: slideAnimationsEnabled,
                    rippleAnimationsEnabled: rippleAnimationsEnabled
                }));
            } catch(e) {
                console.error("Failed to save system settings:", e);
            }
        }
        
        // Control system performance
        function updatePerformanceSettings(mode) {
            switch(mode) {
                case "performance":
                    animationDuration = 200;
                    animationEasing = Easing.OutQuart;
                    opacityAnimationsEnabled = true;
                    scaleAnimationsEnabled = true;
                    rippleAnimationsEnabled = true;
                    systemServices.resources.setUpdateInterval(200);
                    break;
                    
                case "balanced":
                    animationDuration = 100;
                    animationEasing = Easing.OutQuart;
                    opacityAnimationsEnabled = true;
                    scaleAnimationsEnabled = true;
                    rippleAnimationsEnabled = false;
                    systemServices.resources.setUpdateInterval(300);
                    break;
                    
                case "power_saver":
                    animationDuration = 50;
                    animationEasing = Easing.Linear;
                    opacityAnimationsEnabled = false;
                    scaleAnimationsEnabled = false;
                    rippleAnimationsEnabled = false;
                    slideAnimationsEnabled = true;
                    systemServices.resources.setUpdateInterval(500);
                    break;
            }
            
            saveSystemSettings();
        }
        
        // Reduce system performance in case of high usage
        function throttleSystem() {
            if (isThrottling) return;
            
            isThrottling = true;
            console.log("Automatic savings mode activated due to high resource usage");
            
            // Reduce the quality of animations
            animationDuration = 50;
            animationEasing = Easing.Linear;
            
            // Disable unnecessary animations
            opacityAnimationsEnabled = false;
            scaleAnimationsEnabled = false;
            rippleAnimationsEnabled = false;
            
            // Reduce system updates
            systemServices.resources.setUpdateInterval(500);
        }
        
        // Restore performance when returning to normal use
        function restorePerformance() {
            isThrottling = false;
            console.log("Restore normal performance after improved resource utilization");
            
            //Restore quality of animations
            animationDuration = 100;
            animationEasing = Easing.OutQuart;
            
            //Reactivate animations
            opacityAnimationsEnabled = true;
            scaleAnimationsEnabled = true;
            rippleAnimationsEnabled = false;
            
            // Restore system updates
            systemServices.resources.setUpdateInterval(300);
        }
        
        //Memory management
        function collectGarbage() {
            // Collect garbage every 5 minutes or when 70% of memory is used
            if ((Date.now() - lastGC > 300000) || (Qt.application.memoryUsage > 0.7)) {
                systemServices.resources.collectGarbage();
                lastGC = Date.now();
            }
        }
        
        // Asynchronous loading of functions
        function asyncCall(functionName, args, callback) {
            pendingCalls.push({
                functionName: functionName,
                args: args,
                callback: callback
            });
            
            processPendingCalls();
        }
        
        function processPendingCalls() {
            if (isProcessingCalls || pendingCalls.length === 0) return;
            
            isProcessingCalls = true;
            
            const call = pendingCalls.shift();
            Qt.callCpp(call.functionName, call.args, function(result) {
                if(call.callback) {
                    call.callback(result);
                }
                isProcessingCalls = false;
                processPendingCalls();
            });
        }
        
        // Monitor system performance
        function monitorPerformance() {
            Timer {
                id: performanceMonitor
                interval: 5000
                running: true
                onTriggered: {
                    // Check the response time
                    const startTime = Date.now();
                    Qt.callCpp("test.performance", function() {
                        const responseTime = Date.now() - startTime;
                        
                        // If the response time is high, disable animations
                        if (responseTime > 100) {
                            if(!isThrottling) {
                                console.log("Increase response time to " + responseTime + "ms, activate savings mode");
                                throttleSystem();
                            }
                        }
                    });
                }
            }
        }
        
        // Connection test function
        function testConnection() {
            Qt.callCpp("test.connection", function(result) {
                console.log("C++ connection successful:", result);
            });
        }
        
        // Function to log errors
        function logError(error, context) {
            if (isDebugMode) {
                console.error("Error integrating with C++ [" + context + "]:", error);
            }
            
            try {
                const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                fs.source = "/home/user/.config/quickshell/errors.log";
                fs.write("[" + new Date().toISOString() + "] [" + context + "]: " + error + "\n", true);
            } catch(e) {
                console.error("Error logging failed:", e);
            }
        }
        
        // Initialize the system on startup
        Component.onCompleted: {
            initialize();
            monitorPerformance();
            
            // Collect garbage periodically
            Timer {
                interval: 60,000 // every minute
                running: true
                onTriggered: collectGarbage()
            }
        }
    }
    
    //======================
    // Advanced system functions
    //======================
    // Notification component
    Component {
        id: toastComponent
        
        Item {
            id: toast
            width: 300
            height: 60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            
            // Notification background
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                [4]
                border.width: 0
                opacity: 0.9
                
                // Blur effect
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.7)"
                    visible: !powerSaverModeActive
                }

                // In battery saving mode:
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.92)"
                    visible: powerSaverModeActive
                }
            }
            
            //Notification content
            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                Spacing: 15
                
                Text {
                    text: toast.icon
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: pywalColors.colors[4]
                }
                
                Text {
                    text: toast.message
                    font.family: ibmPlex.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                    Layout.fillWidth: true
                }
            }
            
            // Appearance animation
            OpacityAnimation on opacity {
                id: showAnimation
                from: 0
                to: 1
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            //Disappearance Animation
            OpacityAnimation on opacity {
                id: hideAnimation
                from: 1
                to: 0
                duration: 50
                easing.type: Easing.OutQuart
                onRunningChanged: {
                    if(!running&&to===0){
                        toast.destroy();
                    }
                }
            }
        }
    }

    //======================
    // Function to open the Drile application
    //======================
    function openDrileApp() {
        // Check if the application is already open
        if (isDrileOpen) {
            console.log("Drile application is already open.");
            return;
        }

        // Set the application state as open
        isDrileOpen = true;

        // Show Drile interface with quick animation
        drileApp.visible = true;
        drileOpenAnimation.restart();
    }

    //=================
    //Drele application component
    //=================
    Item {
        id: dreleApp
        anchors.fill: parent
        visible: false

        // Application background
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.9
            radius: 15
            border.color: pywalColors.colors[6]
            border.width: 1
        }

        // Application content
        ColumnLayout {
            anchors.centerIn: parent
            Spacing: 20

            Text {
                text: "Drile File Manager"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 24
                color: pywalColors.colors[7]
            }

            Button {
                text: "Close Drile"
                width: 150
                height: 40
                onClicked: closeDrileApp()
            }
        }

        // Appearance animation
        ParallelAnimation {
            id: drileOpenAnimation
            NumberAnimation {
                target: dreleApp
                property: "opacity"
                from: 0
                to: 1
                duration: 4 // Instant response according to MCX standards
            }
            ScaleAnimation {
                target: dreleApp
                property: "scale"
                from: 0.8
                to: 1
                duration: 4 // Instant response
            }
        }

        //Closing animation
        ParallelAnimation {
            id: drileCloseAnimation
            NumberAnimation {
                target: dreleApp
                property: "opacity"
                from: 1
                to: 0
                duration: 4
            }
            ScaleAnimation {
                target: dreleApp
                property: "scale"
                from: 1
                to: 0.8
                duration: 4
            }
            onRunningChanged: {
                if(!running) {
                    drileApp.visible = false;
                    isDrileOpen = false;
                }
            }
        }
    }

    // Function to close the Drile application
    function closeDrileApp() {
        drileCloseAnimation.restart();
    }

    //==============================
    // System monitoring by Crosire
    //==============================
    // Timer to monitor the system
    Timer {
        id: systemMonitor
        interval: 60,000 // every minute
        repeat: true
        running: true
        onTriggered: {
            monitorSystem();
        }
    }
    
    // Function to monitor the system
    function monitorSystem() {
        try {
            // Check memory usage
            const memoryProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            memoryProcess.start("free", ["-m"]);
            memoryProcess.waitForFinished();
            const memoryOutput = memoryProcess.readAllStandardOutput().trim();
            
            if(memoryOutput) {
                const lines = memoryOutput.split("\n");
                if(lines.length > 1) {
                    const memoryInfo = lines[1].split(/\s+/);
                    const total = parseInt(memoryInfo[1]);
                    const used = parseInt(memoryInfo[2]);
                    const usagePercent = (used / total) * 100;
                    
                    if (usagePercent > 90) {
                        showToast("Warning: High memory usage (" + usagePercent.toFixed(1) + "%)", "\uf240");
                        
                        // Suggest a solution from Crosire
                        const crosireSuggestion = "Memory usage appears to be high. Do you want to close unnecessary apps?";
                        showToast(crosireSuggestion, "\ue2ca");
                    }
                }
            }
            
            // Check CPU usage
            const cpuProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            cpuProcess.start("top", ["-bn1"]);
            cpuProcess.waitForFinished();
            const cpuOutput = cpuProcess.readAllStandardOutput().trim();
            
            if(cpuOutput) {
                const lines = cpuOutput.split("\n");
                for (const line of lines) {
                    if(line.includes("Cpu(s)")) {
                        const cpuInfo = line.split(",")[0];
                        const usagePercent = parseFloat(cpuInfo.split(":")[1].trim());
                        
                        if (usagePercent > 90) {
                            showToast("Warning: High CPU usage (" + usagePercent + "%)", "\uf2db");
                            
                            // Suggest a solution from Crosire
                            const crosireSuggestion = "CPU usage appears to be high. Do you want to close heavy apps?";
                            showToast(crosireSuggestion, "\ue2ca");
                        }
                    }
                }
            }
            
            // Check storage space
            const diskProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            diskProcess.start("df", ["/"]);
            diskProcess.waitForFinished();
            const diskOutput = diskProcess.readAllStandardOutput().trim();
            
            if(diskOutput) {
                const lines = diskOutput.split("\n");
                if(lines.length > 1) {
                    const diskInfo = lines[1].split(/\s+/);
                    const usagePercent = parseInt(diskInfo[4].replace("%", ""));
                    
                    if (usagePercent > 90) {
                        showToast("Warning: Low storage space (" + usagePercent + "%)", "\uf0a0");
                        
                        // Suggest a solution from Crosire
                        const crosireSuggestion = "Storage appears to be low. Do you want to delete temporary files?";
                        showToast(crosireSuggestion, "\ue2ca");
                    }
                }
            }
        } catch(e) {
            console.error("System monitoring failed:", e);
        }
    }
    
    //==================
    // Integration with the system
    //==================
    // Function to fetch battery information
    function getBatteryInfo() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO")
            fs.source = "/sys/class/power_supply/BAT0/capacity"
            const capacity = fs.read().trim()
            return capacity + "%"
        } catch(e) {
            console.warn("Battery information not found")
            return "N/A"
        }
    }
    
    // Function to fetch network information
    function getNetworkName() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("nmcli", ["-t", "-f", "ACTIVE, SSID", "dev", "wifi"]);
            process.waitForFinished();
            const output = process.readAllStandardOutput().trim();
            
            if(output) {
                const lines = output.split("\n");
                for (const line of lines) {
                    if(line.startsWith("yes:")) {
                        return line.split(":")[1];
                    }
                }
            }
            
            return "offline";
        } catch(e) {
            console.error("Failed to fetch network name:", e);
            return "offline";
        }
    }
    
    //=====================
    // Integration with Crosire
    //=====================
    // Function to call Crosire to parse a system problem
    function analyzeSystemIssue(issueDescription) {
        try {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "https://openrouter.ai/api/v1/chat/completions");
            xhr.setRequestHeader("Authorization", "Bearer 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");
            xhr.setRequestHeader("Content-Type", "application/json");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        const solution = response.choices[0].message.content;
                        showToast("Suggestion from Crosire: " + solution, "\ue2ca");
                    } else {
                        showToast("Problem parsing failed", "\uf071");
                    }
                }
            };
            
            xhr.send(JSON.stringify({
                "model": "mistralai/mistral-7b-instruct",
                "messages": [
                    {"role": "system", "content": "You are an expert technical assistant in solving operating system problems"},
                    {"role": "user", "content": "Problem: " + issueDescription + "\nWhat are the possible solutions?"}
                ]
            }));
        } catch(e) {
            console.error("Crosire call failed to analyze the problem:", e);
            showToast("Failed to connect to Crosire", "\uf071");
        }
    }
    
    // Function to call Crosire to improve user experience
    function optimizeUserExperience() {
        try {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "https://openrouter.ai/api/v1/chat/completions");
            xhr.setRequestHeader("Authorization", "Bearer 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");
            xhr.setRequestHeader("Content-Type", "application/json");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        const recommendations = response.choices[0].message.content;
                        showToast("Recommendations from Crosire to improve user experience:\n" + recommendations, "\ue2ca");
                    }
                }
            };
            
            xhr.send(JSON.stringify({
                "model": "mistralai/mistral-7b-instruct",
                "messages": [
                    {"role": "system", "content": "You are an expert technical assistant in improving the user experience of the operating system"},
                    {"role": "user", "content": "What are the recommendations for improving the user experience of QuickShell while considering performance and aesthetics?"}
                ]
            }));
        } catch(e) {
            console.error("Failed to call Crosire to improve user experience:", e);
        }
    }
    
    //=====================
    // System operation
    //=====================
    Component.onCompleted: {
        // Start system monitoring
        systemMonitor.start();
        
        // Improve user experience
        optimizeUserExperience();
    }
}
EOL

# ============================
# Desind Settings Application
# ============================
echo "(2/5) Create a settings application..."
echo "----------------------------------
cat <<EOL > ~/.config/QuickShell/SettingsApp/SettingsApp.qml
import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Layouts 6.8
import QtGraphicalEffects 6.8
import QtQuick.VirtualKeyboard 6.8
import QtQuick.Window 6.8
import Qt.labs.processes 6.8
import Qt.labs.settings 6.8
import Qt.labs.folderlistmodel 6.8

//===============
// Settings app
//===============
Item {
    id: settingsApp
    width: 1000
    height: 650
    property string activeTab: "home"
    property string activeSubTab: ""
    property bool isExpanded: false
    property int animationduration: 50
    
    // Basic system components
    property var themeList: []
    property var wallpaperList: []
    property var iconList: []
    property var mouseCursorList: []
    property var fontList: []
    
    // Property to specify the current partition
    property string settingsAppSection: "main"
    
                  // Highlight the current section
                background: Rectangle {
                    color: settingsAppSection === modelData.section ? 
                           Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.2): 
                           "transparent"
                    border.color: settingsAppSection === modelData.section ? 
                                 pywalColors.colors[2] : 
                                 Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    border.width: 1
                    radius: 10
                }
            }
        }
    }

    //=====================
    // Settings app interface
    //=====================
    Rectangle {
        id: settingsContainer
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        visible: false
        
        // Transparent background with blur effect
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.92
            
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: parent.width
                    height: parent.height
                }
                opacity: 0.7
            }
        }
        
        //Main tab bar 
        Item {
            id: islandContainer
            width: parent.width * 0.9
            height: 50
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            
            //Full oval background (without FastBlur)
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: 25
                color: Qt.rgba(0, 0, 0, 0.85)
                border.width: 0
                
                // Improve blur (without FastBlur)
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: 25
                    }
                    opacity: 0.7
                }
            }
            
            // Tab bar
            RowLayout {
                id: tabBar
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                Spacing: 10
                height: 50
                
                // Home tab
                TabButton {
                    icon: "\uf015"
                    active: activeTab === "home"
                    onClicked: {
                        activeTab = "home";
                        activeSubTab = "";
                    }
                    height: 50
                    width: 50
                }
                
                //Customization Center tab
                TabButton {
                    icon: "\uf133"
                    active: activeTab === "customization"
                    onClicked: {
                        activeTab = "customization";
                        activeSubTab = "themes";
                    }
                    height: 50
                    width: 50
                }
                
                // Screen Settings Tab
                TabButton {
                    icon: "\uf108"
                    active: activeTab === "display"
                    onClicked: {
                        activeTab = "display";
                        displaySettings.loadDisplayInfo();
                    }
                    height: 50
                    width: 50
                }
                
                //Resources tab
                TabButton {
                    icon: "\uf2db"
                    active: activeTab === "resources"
                    onClicked: {
                        activeTab = "resources";
                        loadResourceData();
                    }
                    height: 50
                    width: 50
                }
                
                // Tab about the device
                TabButton {
                    icon: "\uf108"
                    active: activeTab === "about"
                    onClicked: {
                        activeTab = "about";
                        activeSubTab = "device";
                    }
                    height: 50
                    width: 50
                }
            }
        }
        
        // Contents of tabs
        Item {
            id: tabContent
            anchors.top: parent.top
            anchors.topMargin: 20
            width: parent.width
            height: parent.height - 70
            
            // Home tab
            Item {
                id: homeTab
                anchors.fill: parent
                visible: activeTab === "home"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    Spacing: 20
                    
                    // Crosire Recommendations
                    Rectangle {
                        id: crosireRecommendations
                        width: parent.width
                        height: 120
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            Spacing: 10
                            
                            Text {
                                text: "Crosire Recommendations"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: pywalColors.colors[6]
                            }
                            
                            Text {
                                text: "You have been discovered to be using a modern device. We recommend activating animations to improve the user experience."
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 14
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                Layout.fillWidth: true
                                wrapMode: Text.Wrap
                            }
                            
                            Button {
                                width: 120
                                height: 40
                                radius: 20
                                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                border.color: pywalColors.colors[6]
                                border.width: 1
                                text: "Apply Recommendation"
                                
                                onClicked: {
                                    animationsSettings.setAnimationSpeed(100);
                                }
                            }
                        }
                    }
                    
                    // Quick shortcuts
                    Grid {
                        columns: 2
                        width: parent.width
                        Spacing: 15
                        
                        //Customization Center abbreviation
                        QuickShortcut {
                            icon: "\uf133"
                            title: "Customization Center"
                            description: "Customize the appearance of the entire system"
                            onClicked: {
                                activeTab = "customization";
                                activeSubTab = "themes";
                            }
                        }
                        
                        // Shorten screen settings
                        QuickShortcut {
                            icon: "\uf108"
                            title: "Screen Settings"
                            description: "Brightness, accuracy, eye protection"
                            onClicked: {
                                activeTab = "display";
                                displaySettings.loadDisplayInfo();
                            }
                        }
                        
                        // Resource shortcut
                        QuickShortcut {
                            icon: "\uf2db"
                            title: "Resources"
                            description: "Monitoring and Using Resources"
                            onClicked: {
                                activeTab = "resources";
                                loadResourceData();
                            }
                        }
                        
                        // Shortcut about the device
                        QuickShortcut {
                            icon: "\uf108"
                            title: "About the Device"
                            description: "Technical specifications of your device"
                            onClicked: {
                                activeTab = "about";
                                activeSubTab = "device";
                            }
                        }
                    }
                    
                    //Quick tips
                    Rectangle {
                        id: quickTips
                        width: parent.width
                        height: 100
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            Spacing: 5
                            
                            Text {
                                text: "Quick Tips"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 16
                                color: pywalColors.colors[4]
                            }
                            
                            Text {
                                Text: "Press Meta + Shift + C You can customize shortcuts in the Customization Center."
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 14
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                Layout.fillWidth: true
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
            
            //Customization Center tab
            Item {
                id: customizationTab
                anchors.fill: parent
                visible: activeTab === "customization"
                
                ColumnLayout {
                    anchors.fill: parent
                    Spacing: 15
                    anchors.margins: 15
                    
                    // Subtabs bar
                    RowLayout {
                        id: subTabBar
                        width: parent.width
                        height: 40
                        Spacing: 10
                        
                        //Themes tab
                        SubTabButton {
                            icon: "\uf042"
                            label: "Themes"
                            active: activeSubTab === "themes"
                            onClicked: activeSubTab = "themes"
                        }
                        
                        // Window shape tab
                        SubTabButton {
                            icon: "\uf108"
                            label: "windows"
                            active: activeSubTab === "windows"
                            onClicked: activeSubTab = "windows"
                        }
                        
                        //Mouse tab
                        SubTabButton {
                            icon: "\uf245"
                            label: "mouse"
                            active: activeSubTab === "mouse"
                            onClicked: activeSubTab = "mouse"
                        }
                        
                        // Backgrounds tab
                        SubTabButton {
                            icon: "\uf5fc"
                            label: "Backgrounds"
                            active: activeSubTab === "wallpapers"
                            onClicked: activeSubTab = "wallpapers"
                        }
                        
                        //Icons tab
                        SubTabButton {
                            icon: "\uf11b"
                            label: "Icons"
                            active: activeSubTab === "icons"
                            onClicked: activeSubTab = "icons"
                        }
                        
                        //Lock screen tab
                        SubTabButton {
                            icon: "\uf023"
                            label: "lock screen"
                            active: activeSubTab === "lockscreen"
                            onClicked: activeSubTab = "lockscreen"
                        }
                        
                        //Font tab
                        SubTabButton {
                            icon: "\uf031"
                            label: "fonts"
                            active: activeSubTab === "fonts"
                            onClicked: activeSubTab = "fonts"
                        }
                        
                        // Shortcuts tab
                        SubTabButton {
                            icon: "\uf11c"
                            label: "abbreviations"
                            active: activeSubTab === "shortcuts"
                            onClicked: activeSubTab = "shortcuts"
                        }
                    }
                    
                    // Content of sub-tabs
                    Item {
                        id: subTabContent
                        Layout.fillWidth: true
                        height: parent.height - 40
                        
                        //Themes tab
                        Item {
                            id: themesSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "themes"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // Current theme information
                                Rectangle {
                                    id: currentThemeInfo
                                    width: parent.width
                                    height: 80
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 15
                                        
                                        // Theme icon
                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "\uf042"
                                            font.family: faSolid.name
                                            font.pixelSize: 24
                                            color: pywalColors.colors[2]
                                        }
                                        
                                        // Theme information
                                        ColumnLayout {
                                            Spacing: 5
                                            
                                            Text {
                                                text: "Current theme: Desind Dark"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            Text {
                                                Text: "Dark look with harmonious colors"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 14
                                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            }
                                        }
                                    }
                                }
                                
                                // List of themes
                                ListView {
                                    id: themesList
                                    Layout.fillWidth: true
                                    height: 300
                                    model: themeList
                                    clip: true
                                    interactive: false
                                    
                                    delegate: ThemeItem {
                                        width: parent.width
                                        height: 60
                                        theme: modelData
                                        isActive: modelData.name === "Desind Dark"
                                        onClicked: {
                                            applyTheme(theme.name);
                                        }
                                    }
                                    
                                    // Appearance animation
                                    OpacityAnimation on opacity {
                                        duration: 50
                                        easing.type: Easing.OutQuart
                                        from: 0
                                        to: 1
                                    }
                                }
                                
                                //Theme Store button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Theme Store"
                                    
                                    onClicked: {
                                        openThemeStore();
                                    }
                                }
                            }
                        }
                        
                        // Window shape tab
                        Item {
                            id: windowsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "windows"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // Window properties
                                Rectangle {
                                    id: windowProperties
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 15
                                        
                                        //Edge shape
                                        OptionGroup {
                                            title: "The Shape of the Edges"
                                            options: ["square", "slightly rounded", "fully rounded"]
                                            currentIndex: 2
                                            onOptionSelected: {
                                                setWindowCorners(index);
                                            }
                                        }
                                        
                                        //Edge size
                                        OptionGroup {
                                            title: "Edge Size"
                                            options: ["small", "medium", "large"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setWindowRadius(index);
                                            }
                                        }
                                    }
                                }
                                
                                // Window Shapes Store Button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Window Shapes Store"
                                    
                                    onClicked: {
                                        openWindowStyleStore();
                                    }
                                }
                            }
                        }
                        
                        //Mouse tab
                        Item {
                            id: mouseSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "mouse"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // List of mouse pointers
                                ListView {
                                    id: mouseCursorList
                                    Layout.fillWidth: true
                                    height: 300
                                    model: mouseCursorList
                                    clip: true
                                    interactive: false
                                    
                                    delegate: MouseCursorItem {
                                        width: parent.width
                                        height: 60
                                        cursor: modelData
                                        isActive: modelData.name === "Desind Cursor"
                                        onClicked: {
                                            applyMouseCursor(cursor.name);
                                        }
                                    }
                                    
                                    // Appearance animation
                                    OpacityAnimation on opacity {
                                        duration: 50
                                        easing.type: Easing.OutQuart
                                        from: 0
                                        to: 1
                                    }
                                }
                                
                                // Mouse properties
                                Rectangle {
                                    id: mouseProperties
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 15
                                        
                                        // Mouse speed
                                        SliderControl {
                                            title: "Mouse Speed"
                                            min: 0
                                            max: 10
                                            value: 5
                                            onValueChanged: {
                                                setMouseSpeed(value);
                                            }
                                        }
                                        
                                        // Reverse scrolling direction
                                        ToggleControl {
                                            title: "Reverse scroll direction"
                                            active: false
                                            onToggled: {
                                                setMouseScrollDirection(active);
                                            }
                                        }
                                    }
                                }
                                
                                // Mouse pointer store button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Mouse Pointers Store"
                                    
                                    onClicked: {
                                        openMouseCursorStore();
                                    }
                                }
                            }
                        }
                        
                        // Backgrounds tab
                        Item {
                            id: wallpapersSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "wallpapers"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // Current background
                                Rectangle {
                                    id: currentWallpaper
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: "#000000"
                                    
                                    Image {
                                        anchors.fill: parent
                                        source: "qrc:/images/wallpaper1.jpg"
                                        fillMode: Image.PreserveAspectCrop
                                    }
                                    
                                    Text {
                                        anchors.centerIn: parent
                                        text: "Current background"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 24
                                        color: pywalColors.colors[7]
                                    }
                                }
                                
                                //List of backgrounds
                                GridView {
                                    id: wallpapersGrid
                                    Layout.fillWidth: true
                                    height: 250
                                    cellWidth: 150
                                    cellHeight: 100
                                    model: wallpaperList
                                    clip: true
                                    interactive: false
                                    
                                    delegate: WallpaperItem {
                                        width: parent.cellWidth
                                        height: parent.cellHeight
                                        wallpaper: modelData
                                        isActive: modelData.name === "Desind Default"
                                        onClicked: {
                                            applyWallpaper(wallpaper.path);
                                        }
                                    }
                                }
                                
                                // Background properties
                                Rectangle {
                                    id: wallpaperProperties
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 15
                                        
                                        // Display mode
                                        OptionGroup {
                                            title: "Display Mode"
                                            options: ["full", "identical", "magnified", "minified"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setWallpaperMode(index);
                                            }
                                        }
                                        
                                        // Background effects
                                        ToggleControl {
                                            title: "Animated Backgrounds"
                                            active: false
                                            onToggled: {
                                                setAnimatedWallpaper(active);
                                            }
                                        }
                                    }
                                }
                                
                                // Wallpaper Store Button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Background Store"
                                    
                                    onClicked: {
                                        openWallpaperStore();
                                    }
                                }
                            }
                        }
                        
                        //Icons tab
                        Item {
                            id: iconsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "icons"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // List of system icons
                                Rectangle {
                                    id: systemIconsSection
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "System icons"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[2]
                                        }
                                        
                                        ListView {
                                            id: systemIconsList
                                            Layout.fillWidth: true
                                            height: 120
                                            model: iconList.filter(i => i.type === "system")
                                            clip: true
                                            interactive: false
                                            
                                            delegate: IconItem {
                                                width: parent.width
                                                height: 40
                                                icon: modelData
                                                isActive: modelData.name === "Desind Icons"
                                                onClicked: {
                                                    applySystemIcons(icon.name);
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                // List of application icons
                                Rectangle {
                                    id: appIconsSection
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "App icons"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[3]
                                        }
                                        
                                        ListView {
                                            id: appIconsList
                                            Layout.fillWidth: true
                                            height: 120
                                            model: iconList.filter(i => i.type === "apps")
                                            clip: true
                                            interactive: false
                                            
                                            delegate: IconItem {
                                                width: parent.width
                                                height: 40
                                                icon: modelData
                                                isActive: modelData.name === "Desind Apps"
                                                onClicked: {
                                                    applyAppIcons(icon.name);
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                // Icon Store Button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Icon Store"
                                    
                                    onClicked: {
                                        openIconsStore();
                                    }
                                }
                            }
                        }
                        
                        //Lock screen tab
                        Item {
                            id: lockscreenSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "lockscreen"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // Preview the lock screen
                                Rectangle {
                                    id: lockscreenPreview
                                    width: parent.width
                                    height: 300
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.centerIn: parent
                                        anchors.margins: 15
                                        Spacing: 20
                                        
                                        Text {
                                            id: lockscreenTime
                                            text: Qt.formatTime(new Date(), "hh:mm")
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 60
                                            color: pywalColors.colors[6]
                                        }
                                        
                                        Text {
                                            id: lockscreenDate
                                            text: Qt.formatDate(new Date(), "dddd, dd MMMM yyyy")
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 20
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                        }
                                    }
                                }
                                
                                //Lock screen properties
                                Rectangle {
                                    id: lockscreenProperties
                                    width: parent.width
                                    height: 250
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 15
                                        
                                        // Hourly size
                                        OptionGroup {
                                            title: "Clock Size"
                                            options: ["small", "medium", "large"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setLockscreenClockSize(index);
                                            }
                                        }
                                        
                                        // Clock location
                                        OptionGroup {
                                            title: "The Place of the Hour"
                                            options: ["top", "middle", "bottom"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setLockscreenClockPosition(index);
                                            }
                                        }
                                        
                                        // Clock line
                                        OptionGroup {
                                            title: "Clock Line"
                                            options: ["Thin", "Light", "Regular", "Bold"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setLockscreenClockFont(index);
                                            }
                                        }
                                        
                                        // Background
                                        OptionGroup {
                                            title: "Background"
                                            options: ["Current Background", "Dark Background", "Custom Image"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setLockscreenWallpaper(index);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        //Font tab
                        Item {
                            id: fontsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "fonts"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 15
                                
                                // System line
                                Rectangle {
                                    id: systemFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "System line"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[2]
                                        }
                                        
                                        Text {
                                            text: "This font is used throughout the system."
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            Layout.fillWidth: true
                                            wrapMode: Text.Wrap
                                        }
                                        
                                        FontSelector {
                                            width: parent.width
                                            currentFont: "IBM Plex Sans Thin"
                                            onFontSelected: {
                                                setSystemFont(font);
                                            }
                                        }
                                    }
                                }
                                
                                // Application line
                                Rectangle {
                                    id: appFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "Application Line"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[3]
                                        }
                                        
                                        Text {
                                            text: "This font is used in supported applications"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            Layout.fillWidth: true
                                            wrapMode: Text.Wrap
                                        }
                                        
                                        FontSelector {
                                            width: parent.width
                                            currentFont: "IBM Plex Sans"
                                            onFontSelected: {
                                                setAppFont(font);
                                            }
                                        }
                                    }
                                }
                                
                                // API line
                                Rectangle {
                                    id: codeFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        Spacing: 10
                                        
                                        Text {
                                            text: "API font"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[4]
                                        }
                                        
                                        Text {
                                            text: "This font is used in software applications"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            Layout.fillWidth: true
                                            wrapMode: Text.Wrap
                                        }
                                        
                                        FontSelector {
                                            width: parent.width
                                            currentFont: "Fira Code"
                                            onFontSelected: {
                                                setCodeFont(font);
                                            }
                                        }
                                    }
                                }
                                
                                // Font Store button
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "Font Shop"
                                    
                                    onClicked: {
                                        openFontStore();
                                    }
                                }
                            }
                        }
                        
                        // Shortcuts tab
                        Item {
                            id: shortcutsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "shortcuts"

                        // Section header
                        Rectangle {
                            width: parent.width
                            height: 60
                            color: "#000000"
                            border.color: pywalColors.colors[6]
                            border.width: 1

                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 25
                                anchors.verticalCenter: parent.verticalCenter
                                text: "abbreviations"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: pywalColors.colors[7]
                            }

                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 25
                                anchors.verticalCenter: parent.verticalCenter
                                text: "\uf0c7" // Shortcuts icon
                                font.family: faSolid.name
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                            }
                        }

                        // Abbreviations content
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.topMargin: 60
                            Spacing: 10

                            // Search bar
                            TextField {
                                id: searchInput
                                Layout.fillWidth: true
                                placeholderText: "Find a shortcut..."
                                background: Rectangle {
                                    radius: 10
                                    color: "#1E1E1E"
                                    border.color: pywalColors.colors[4]
                                    border.width: 1
                                }
                                onTextChanged: filterShortcuts(text)
                            }

                            // Shortcuts list
                            ListView {
                                id: shortcutsList
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                model: filteredShortcutsModel
                                delegate: ShortcutItem {
                                    shortcutName: modelData.name
                                    shortcutKey: modelData.key
                                    shortcutDescription: modelData.description
                                    onEditShortcut: openEditDialog(modelData)
                                    onDeleteShortcut: deleteShortcut(modelData.id)
                                }
                            }

                            //Add shortcut button
                            Button {
                                text: "Add new shortcut"
                                width: 200
                                height: 40
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: openAddShortcutDialog()
                            }
                        }

                        // Dynamic Shortcuts Model
                        property var shortcutsModel: []
                        property var filteredShortcutsModel: shortcutsModel

                        // Filter functions
                        function filterShortcuts(query) {
                            if(!query.trim()) {
                                filteredShortcutsModel = shortcutsModel;
                                return;
                            }
                            filteredShortcutsModel = shortcutsModel.filter(function(shortcut) {
                                return shortcut.name.toLowerCase().includes(query.toLowerCase()) ||
                                    shortcut.key.toLowerCase().includes(query.toLowerCase());
                            });
                        }

                        // Load shortcuts dynamically
                        Timer {
                            interval: 2000
                            repeat: true
                            running: true
                            onTriggered: loadShortcuts()
                        }

                        // Shortcuts load function
                        function loadShortcuts() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("hyprctl", ["getoption", "binds"]);
                                process.waitForFinished();
                                const output = process.readAllStandardOutput();

                                let newShortcuts = [];
                                const lines = output.split("\n");
                                for (let i = 0; i < lines.length; i++) {
                                    const line = lines[i]. trim();
                                    if(line.startsWith("bind")) {
                                        const parts = line.split(" ");
                                        const key = parts[1];
                                        const command = parts.slice(2).join("");
                                        newShortcuts.push({
                                            id: Date.now() + i,
                                            name: getShortcutName(command),
                                            key: key,
                                            description: getShortcutDescription(command)
                                        });
                                    }
                                }

                                // Update the form
                                shortcutsModel = newShortcuts;
                                filteredShortcutsModel = newShortcuts;
                            } catch(e) {
                                console.error("Failed to load shortcuts:", e);
                            }
                        }

                        // Get the shortcut name based on the command
                        function getShortcutName(command) {
                            if (command.includes("exec")) {
                                return "Execute a command";
                            } else if (command.includes("workspace")) {
                                return "Change workspace";
                            } else if (command.includes("togglefloating")) {
                                return "Switch float mode";
                            } else {
                                return "custom shortcut";
                            }
                        }

                        // Get the shortcut description based on the command
                        function getShortcutDescription(command) {
                            return command.replace("exec", "").trim();
                        }

                        // Open the Add Shortcut window
                        function openAddShortcutDialog() {
                            addShortcutDialog.open();
                        }

                        // Open a shortcut edit window
                        function openEditDialog(shortcut) {
                            editShortcutDialog.shortcut = shortcut;
                            editShortcutDialog.open();
                        }

                        //Delete shortcut
                        function deleteShortcut(id) {
                            try {
                                const index = shortcutsModel.findIndex(function(shortcut) {
                                    return shortcut.id === id;
                                });
                                if(index!== -1) {
                                    shortcutsModel.splice(index, 1);
                                    saveShortcuts();
                                }
                            } catch(e) {
                                console.error("Failed to delete shortcut:", e);
                            }
                        }

                        // Save shortcuts
                        function saveShortcuts() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("hyprctl", ["keyword", "binds", JSON.stringify(shortcutsModel)]);
                                process.waitForFinished();
                            } catch(e) {
                                console.error("Failed to save shortcuts:", e);
                            }
                        }

                        // Add shortcut window
                        Dialog {
                            id: addShortcutDialog
                            title: "Add a new abbreviation"
                            standardButtons: Dialog.Ok | Dialog.Cancel

                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 10

                                TextField {
                                    id: shortcutNameInput
                                    placeholderText: "shortcut name"
                                }

                                TextField {
                                    id: shortcutKeyInput
                                    placeholderText: "shortcut key"
                                }

                                TextField {
                                    id: shortcutCommandInput
                                    placeholderText: "Related command"
                                }
                            }

                            onAccepted: {
                                const newShortcut = {
                                    id: Date.now(),
                                    name: shortcutNameInput.text,
                                    key: shortcutKeyInput.text,
                                    description: shortcutCommandInput.text
                                };
                                shortcutsModel.push(newShortcut);
                                saveShortcuts();
                            }
                        }

                        // Edit shortcut window
                        Dialog {
                            id: editShortcutDialog
                            title: "Edit Shortcut"
                            standardButtons: Dialog.Ok | Dialog.Cancel
                            property var shortcut: null

                            ColumnLayout {
                                anchors.fill: parent
                                Spacing: 10

                                TextField {
                                    id: editShortcutNameInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.name: ""
                                }

                                TextField {
                                    id: editShortcutKeyInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.key: ""
                                }

                                TextField {
                                    id: editShortcutCommandInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.description: ""
                                }
                            }

                            onAccepted: {
                                if (editShortcutDialog.shortcut) {
                                    editShortcutDialog.shortcut.name = editShortcutNameInput.text;
                                    editShortcutDialog.shortcut.key = editShortcutKeyInput.text;
                                    editShortcutDialog.shortcut.description = editShortcutCommandInput.text;
                                    saveShortcuts();
                                }
                            }
                        }
                    }

                    // Shortcut display component
                    Component {
                        id: shortcutItemComponent
                        Item {
                            id: shortcutItem
                            width: parent.width
                            height: 50

                            RowLayout {
                                anchors.fill: parent
                                Spacing: 10

                                Text {
                                    text: shortcutName
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                }

                                Text {
                                    text: shortcutKey
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[5]
                                }

                                Text {
                                    text: shortcutDescription
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[6]
                                }

                                Button {
                                    text: "edit"
                                    onClicked: onEditShortcut()
                                }

                                Button {
                                    text: "Delete"
                                    onClicked: onDeleteShortcut()
                                }
                            }
                        }
                    }
                }
            }

            // Screen Settings Tab
            Item {
                id: displayTab
                anchors.fill: parent
                visible: activeTab === "display"
                
                // Screen settings content
                Item {
                    id: displaySettings
                    anchors.fill: parent
                    
                    // Function to load screen information
                    function loadDisplayInfo() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["monitors"]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                const output = process.readAllStandardOutput().trim();
                                const lines = output.split('\n');
                                let currentMonitor = null;
                                
                                for (const line of lines) {
                                    if(line.startsWith("Monitor")) {
                                        if (currentMonitor) {
                                            monitors.push(currentMonitor);
                                        }
                                        
                                        currentMonitor = {
                                            name: line.split("")[1],
                                            isPrimary: line.includes("primary"),
                                            resolution: "",
                                            refreshRate: 0,
                                            brightness: 100
                                        };
                                    } else if (line.includes("at")) {
                                        const parts = line.split(" ");
                                        currentMonitor.resolution = parts[0];
                                        currentMonitor.refreshRate = parseFloat(parts[3].replace("Hz,"," ""));
                                    }
                                }
                                
                                if (currentMonitor) {
                                    monitors.push(currentMonitor);
                                }
                                
                                // Load brightness settings
                                for (let i = 0; i < monitors.length; i++) {
                                    const monitor = monitors[i];
                                    try {
                                        const brightnessProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                        brightnessProcess.start("brightnessctl", ["info", "-d", "sysfs/backlight/" + monitor.name]);
                                        brightnessProcess.waitForFinished(500);
                                        
                                        if (brightnessProcess.exitCode() === 0) {
                                            const output = brightnessProcess.readAllStandardOutput().trim();
                                            const match = output.match(/Current brightness:\s*(\d+)/);
                                            if(match) {
                                                monitor.brightness = parseInt(match[1]);
                                            }
                                        }
                                    } catch(e) {
                                        console.error("Failed to fetch screen brightness:", e);
                                    }
                                }
                                
                                // Update the user interface
                                updateDisplayUI();
                            }
                        } catch(e) {
                            console.error("Failed to fetch screen information:", e);
                            // Use default values in case of failure
                            monitors = [{
                                name: "Internal Screen",
                                isPrimary: true,
                                resolution: "1920x1080",
                                refreshRate: 60,
                                brightness: 75
                            }];
                            updateDisplayUI();
                        }
                    }
                    
                    // Function to update the user interface
                    function updateDisplayUI() {
                        // Update screen list
                        if(monitors.length > 0) {
                            currentMonitor = monitors[0];
                            monitorNameText.text = currentMonitor.name;
                            resolutionText.text = currentMonitor.resolution;
                            refreshRateText.text = currentMonitor.refreshRate + "Hz";
                            brightnessSlider.value = currentMonitor.brightness;
                        }
                    }
                    
                    // Function to change the precision
                    function changeResolution(resolution) {
                        if(!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["keyword", "monitor", currentMonitor.name + "," + resolution + ",auto,1"]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.resolution = resolution;
                                resolutionText.text = resolution;
                                showToast("Resolution changed successfully", "\uf00c");
                            } else {
                                showToast("Failed to change resolution", "\uf071");
                            }
                        } catch(e) {
                            console.error("Failed to change resolution:", e);
                            showToast("Failed to change resolution", "\uf071");
                        }
                    }
                    
                    // Function to change the refresh rate
                    function changeRefreshRate(rate) {
                        if(!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["keyword", "monitor", currentMonitor.name + "," + currentMonitor.resolution + ",auto," + rate]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.refreshRate = rate;
                                refreshRateText.text = rate + "Hz";
                                showToast("Update rate changed successfully", "\uf00c");
                            } else {
                                showToast("Failed to change refresh rate", "\uf071");
                            }
                        } catch(e) {
                            console.error("Failed to change refresh rate:", e);
                            showToast("Failed to change refresh rate", "\uf071");
                        }
                    }
                    
                    // Function to adjust brightness
                    function setBrightness(value) {
                        if(!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("brightnessctl", ["set", value + "%", "-d", "sysfs/backlight/" + currentMonitor.name]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.brightness = value;
                                showToast("Brightness changed", "\uf00c");
                            } else {
                                showToast("Brightness change failed", "\uf071");
                            }
                        } catch(e) {
                            console.error("Failed to change brightness:", e);
                            showToast("Brightness change failed", "\uf071");
                        }
                    }
                    
                    // Function to activate/deactivate eye protection
                    function toggleEyeProtection() {
                        eyeProtectionEnabled=!eyeProtectionEnabled;
                        
                        try {
                            if (eyeProtectionEnabled) {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("redshift", ["-O", "4500"]);
                                process.waitForFinished(500);
                            } else {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("redshift", ["-x"]);
                                process.waitForFinished(500);
                            }
                            
                            eyeProtectionToggle.active = eyeProtectionEnabled;
                            showToast(eyeProtectionEnabled ? "Eye protection activated": "Eye protection deactivated", "\uf00c");
                        } catch(e) {
                            console.error("Failed to change eye protection settings:", e);
                            showToast("Failed to change eye protection settings", "\uf071");
                        }
                    }
                    
                    // Function to adjust the eye protection level
                    function setEyeProtectionLevel(level) {
                        eyeProtectionLevel = level;
                        
                        try {
                            if (eyeProtectionEnabled) {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("redshift", ["-O", (6500 - level * 200).toString()]);
                                process.waitForFinished(500);
                            }
                        } catch(e) {
                            console.error("Failed to change eye protection level:", e);
                        }
                    }
                    
                    // Data
                    property var monitors: []
                    property var currentMonitor: null
                    property bool eyeProtectionEnabled: false
                    property int eyeProtectionLevel: 5
                    
                    // Screen settings content
                    ColumnLayout {
                        anchors.fill: parent
                        Spacing: 20
                        anchors.margins: 20
                        
                        // Current screen information
                        Rectangle {
                            id: currentDisplayInfo
                            width: parent.width
                            height: 80
                            radius: 15
                            color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 15
                                Spacing: 15
                                
                                // Screen icon
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf108"
                                    font.family: faSolid.name
                                    font.pixelSize: 24
                                    color: pywalColors.colors[2]
                                }
                                
                                // Screen information
                                ColumnLayout {
                                    Spacing: 5
                                    
                                    Text {
                                        id: monitorNameText
                                        text: "Internal screen"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: pywalColors.colors[2]
                                    }
                                    
                                    Text {
                                        text: "Screen Resolution and Brightness"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 14
                                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                    }
                                }
                            }
                        }

                        // Screen settings tabs
                        RowLayout {
                            id: displayTabBar
                            width: parent.width
                            height: 40
                            Spacing: 10
                            
                            //Year tab
                            SubTabButton {
                                icon: "\uf015"
                                label: "general"
                                active: activeDisplayTab === "general"
                                onClicked: activeDisplayTab = "general"
                            }
                            
                            //Brightness tab
                            SubTabButton {
                                icon: "\uf00d"
                                label: "brightness"
                                active: activeDisplayTab === "brightness"
                                onClicked: activeDisplayTab = "brightness"
                            }
                            
                            // Accuracy tab
                            SubTabButton {
                                icon: "\uf120"
                                label: "accuracy"
                                active: activeDisplayTab === "resolution"
                                onClicked: activeDisplayTab = "resolution"
                            }
                            
                            // Screens tab
                            SubTabButton {
                                icon: "\uf26c"
                                label: "Screens"
                                active: activeDisplayTab === "displays"
                                onClicked: activeDisplayTab = "displays"
                            }
                            
                            //Animations tab
                            SubTabButton {
                                icon: "\uf001"
                                label: "Animations"
                                active: activeDisplayTab === "animations"
                                onClicked: activeDisplayTab = "animations"
                            }
                        }
                        
                        // Contents of tabs
                        Item {
                            id: displayTabContent
                            Layout.fillWidth: true
                            height: parent.height - 120
                            
                            //Year tab
                            Item {
                                id: generalTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "general"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 20
                                    
                                    // Eye protection
                                    Rectangle {
                                        id: eyeProtectionSection
                                        width: parent.width
                                        height: 100
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 5
                                            
                                            Text {
                                                text: "Eye protection"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            Text {
                                                text: "Reduce blue light to protect against eye strain"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 14
                                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            }
                                            
                                            RowLayout {
                                                Spacing: 10
                                                
                                                ToggleSwitch {
                                                    id: eyeProtectionToggle
                                                    active: eyeProtectionEnabled
                                                    onToggled: toggleEyeProtection()
                                                }
                                                
                                                Slider {
                                                    id: eyeProtectionSlider
                                                    width: 200
                                                    minimumValue: 1
                                                    maximumValue: 10
                                                    value: eyeProtectionLevel
                                                    onValueChanged: setEyeProtectionLevel(value)
                                                }
                                            }
                                        }
                                    }
                                    
                                    // Crosire Recommendation
                                    Rectangle {
                                        id: crosireEyeProtectionRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            Text: "Crosire Recommendation: Eye protection is automatically activated because you are using the device after 8pm"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: pywalColors.colors[6]
                                            width: parent.width * 0.9
                                            wrapMode: Text.Wrap
                                            horizontalAlignment: Text.AlignHCenter
                                        }
                                    }
                                }
                            }
                            
                            //Brightness tab
                            Item {
                                id: brightnessTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "brightness"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 20
                                    
                                    // Screen brightness
                                    Rectangle {
                                        id: brightnessControl
                                        width: parent.width
                                        height: 120
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[1].r, pywalColors.colors[1].g, pywalColors.colors[1].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 15
                                            
                                            Text {
                                                text: "Screen Brightness"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[1]
                                            }
                                            
                                            Slider {
                                                id: brightnessSlider
                                                width: parent.width * 0.8
                                                minimumValue: 0
                                                maximumValue: 100
                                                value: 75
                                                onValueChanged: setBrightness(value)
                                            }
                                            
                                            Text {
                                                text: brightnessSlider.value + "%"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[1]
                                                anchors.horizontalCenter: parent.horizontalCenter
                                            }
                                        }
                                    }
                                    
                                    // Crosire Recommendation
                                    Rectangle {
                                        id: crosireBrightnessRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            Text: "Crosire Recommendation: Brightness is automatically adjusted based on ambient light"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: pywalColors.colors[6]
                                            width: parent.width * 0.9
                                            wrapMode: Text.Wrap
                                            horizontalAlignment: Text.AlignHCenter
                                        }
                                    }
                                }
                            }
                            
                            // Accuracy tab
                            Item {
                                id: resolutionTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "resolution"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 20
                                    
                                    // Screen information
                                    Rectangle {
                                        id: displayInfoResolution
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                        
                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 15
                                            
                                            // Screen icon
                                            Text {
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: "\uf108"
                                                font.family: faSolid.name
                                                font.pixelSize: 24
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            // Screen information
                                            ColumnLayout {
                                                Spacing: 5
                                                
                                                Text {
                                                    id: resolutionText
                                                    text: "1920x1080"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[2]
                                                }
                                                
                                                Text {
                                                    text: "Current screen resolution"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 14
                                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                                }
                                            }
                                        }
                                    }
                                    
                                    // Accuracy options
                                    Rectangle {
                                        id: resolutionOptions
                                        width: parent.width
                                        height: 200
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 10
                                            
                                            Text {
                                                text: "Resolution Options"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[3]
                                            }
                                            
                                            ListView {
                                                id: resolutionList
                                                Layout.fillWidth: true
                                                height: 120
                                                model: ["1920x1080", "1600x900", "1366x768", "1280x720"]
                                                delegate: ResolutionItem {
                                                    width: parent.width
                                                    height: 30
                                                    resolution: modelData
                                                    onClicked: {
                                                        changeResolution(resolution);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                    // Refresh rate
                                    Rectangle {
                                        id: refreshRateSection
                                        width: parent.width
                                        height: 100
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 5
                                            
                                            Text {
                                                text: "Refresh Rate"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[4]
                                            }
                                            
                                            RowLayout {
                                                Spacing: 10
                                                
                                                Text {
                                                    id: refreshRateText
                                                    text: "60 Hz"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[4]
                                                }
                                                
                                                Button {
                                                    width: 80
                                                    height: 30
                                                    radius: 15
                                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                                    border.color: pywalColors.colors[4]
                                                    border.width: 1
                                                    text: "120 Hz"
                                                    onClicked: changeRefreshRate(120)
                                                }
                                                
                                                Button {
                                                    width: 80
                                                    height: 30
                                                    radius: 15
                                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                                    border.color: pywalColors.colors[4]
                                                    border.width: 1
                                                    text: "144 Hz"
                                                    onClicked: changeRefreshRate(144)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            // Screens tab
                            Item {
                                id: displaysTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "displays"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 20
                                    
                                    // List of screens
                                    ListView {
                                        id: displaysList
                                        Layout.fillWidth: true
                                        height: 300
                                        model: monitors
                                        clip: true
                                        interactive: false
                                        
                                        delegate: DisplayItem {
                                            width: parent.width
                                            height: 60
                                            display: modelData
                                            isSelected: modelData === currentMonitor
                                            onClicked: {
                                                currentMonitor = display;
                                                updateDisplayUI();
                                            }
                                        }
                                    }
                                    
                                    // Selected screen settings
                                    Rectangle {
                                        id: selectedDisplaySettings
                                        width: parent.width
                                        height: 150
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 10
                                            
                                            Text {
                                                text: "Selected screen settings"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[5]
                                            }
                                            
                                            RowLayout {
                                                Spacing: 10
                                                
                                                ToggleSwitch {
                                                    id: primaryDisplayToggle
                                                    active: currentMonitor ? currentMonitor.isPrimary: false
                                                    onToggled: {
                                                        if (currentMonitor) {
                                                            currentMonitor.isPrimary = active;
                                                            setPrimaryDisplay(currentMonitor.name);
                                                        }
                                                    }
                                                }
                                                
                                                Text {
                                                    text: "Home Screen"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[5]
                                                    anchors.verticalCenter: parent.verticalCenter
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            //Animations tab
                            Item {
                                id: animationsTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "animations"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    Spacing: 20
                                    
                                    //Animations speed
                                    Rectangle {
                                        id: animationSpeedSection
                                        width: parent.width
                                        height: 150
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 15
                                            
                                            Text {
                                                text: "Animation Speed"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[5]
                                            }
                                            
                                            Slider {
                                                id: animationSpeedSlider
                                                width: parent.width * 0.8
                                                minimumValue: 50
                                                maximumValue: 300
                                                value: 100
                                                onValueChanged: setAnimationSpeed(value)
                                            }
                                            
                                            Text {
                                                text: animationSpeedSlider.value + "ms"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[5]
                                                anchors.horizontalCenter: parent.horizontalCenter
                                            }
                                        }
                                    }
                                    
                                    // Crosire Recommendation
                                    Rectangle {
                                        id: crosireAnimationsRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            Text: "Crosire Recommendation: Animations speed is automatically adjusted based on your device's performance"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: pywalColors.colors[6]
                                            width: parent.width * 0.9
                                            wrapMode: Text.Wrap
                                            horizontalAlignment: Text.AlignHCenter
                                        }
                                    }
                                    
                                    //Animation options
                                    Rectangle {
                                        id: animationOptionsSection
                                        width: parent.width
                                        height: 200
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            Spacing: 10
                                            
                                            Text {
                                                text: "Custom Animations"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[5]
                                            }
                                            
                                            //Animation options
                                            ColumnLayout {
                                                Spacing: 10
                                                
                                                AnimationOption {
                                                    label: "Animation Open/Close Capsules"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "Animation Open/Close Lock Screen"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "Animation scrolling between workspaces"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "Animation Indicators"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "Notification Animation"
                                                    isEnabled: true
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            //Resources tab
            Item {
                id: resourcesTab
                anchors.fill: parent
                visible: activeTab === "resources"
                
                ColumnLayout {
                    anchors.fill: parent
                    Spacing: 20
                    anchors.margins: 20
                    
                    // Resource usage chart
                    Rectangle {
                        id: resourcesChart
                        width: parent.width
                        height: 200
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        
                        // The chart drawing library will be used here
                        Text {
                            anchors.centerIn: parent
                            text: "Resource Usage Chart"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[2]
                        }
                    }
                    
                    // Memory usage
                    ResourceUsage {
                        title: "Memory"
                        icon: "\uf2db"
                        current: 5.2
                        total: 16
                        unit: "GB"
                        colorIndex: 2
                    }
                    
                    // Processor usage
                    ResourceUsage {
                        title: "The Processor"
                        icon: "\uf2db"
                        current: 35
                        total: 100
                        unit: "%"
                        colorIndex: 3
                    }
                    
                    // Use graphics card
                    ResourceUsage {
                        title: "Graphics"
                        icon: "\uf26c"
                        current: 25
                        total: 100
                        unit: "%"
                        colorIndex: 4
                    }
                    
                    // Storage usage
                    ResourceUsage {
                        title: "Storage"
                        icon: "\uf0a0"
                        current: 250
                        total: 512
                        unit: "GB"
                        colorIndex: 5
                    }
                    
                    // Active operations
                    Rectangle {
                        id: activeProcesses
                        width: parent.width
                        height: 200
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            Spacing: 10
                            
                            Text {
                                text: "Active processes"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: pywalColors.colors[6]
                            }
                            
                            ListView {
                                id: processesList
                                Layout.fillWidth: true
                                height: 120
                                model: processList
                                clip: true
                                interactive: false
                                
                                delegate: ProcessItem {
                                    width: parent.width
                                    height: 30
                                    process: modelData
                                }
                            }
                        }
                    }
                }
            }
            
            // Tab about the device
            Item {
                id: aboutTab
                anchors.fill: parent
                visible: activeTab === "about"
                
                ColumnLayout {
                    anchors.fill: parent
                    Spacing: 20
                    anchors.margins: 20
                    
                    // System logo
                    Rectangle {
                        id: systemLogo
                        width: 150
                        height: 150
                        radius: 75
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        
                        Text {
                            anchors.centerIn: parent
                            text: "D"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 60
                            color: pywalColors.colors[2]
                        }
                    }
                    
                    // System information
                    Rectangle {
                        id: systemInfoSection
                        width: parent.width
                        height: 300
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            Spacing: 15
                            
                            Text {
                                text: "System Information"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 24
                                color: pywalColors.colors[2]
                            }
                            
                            SystemInfoItem {
                                label: "Device Name"
                                value: systemInfo.deviceName
                            }
                            
                            SystemInfoItem {
                                label: "Operating System"
                                value: systemInfo.os
                            }
                            
                            SystemInfoItem {
                                label: "nucleus"
                                value: systemInfo.kernel
                            }
                            
                            SystemInfoItem {
                                label: "processor"
                                value: systemInfo.processor
                            }
                            
                            SystemInfoItem {
                                label: "Memory"
                                value: systemInfo.memory
                            }
                            
                            SystemInfoItem {
                                label: "graphics"
                                value: systemInfo.graphics
                            }
                            
                            SystemInfoItem {
                                label: "Storage"
                                value: systemInfo.storage
                            }
                        }
                    }
                    
                    //License information
                    Rectangle {
                        id: licenseInfo
                        width: parent.width
                        height: 100
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Desind OS is open source, built on Arch Linux\n, and licensed under the GPL v3."
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[6]
                            width: parent.width * 0.9
                            wrapMode: Text.Wrap
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }
        }
    }
    
    //====================
    // Auxiliary components
    //====================
    
    //Main tab component
    Component {
        id: tabButtonComponent
        
        Item {
            id: tabButton
            property string icon
            property bool active: false
            width: 50
            height: 50
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 25
                color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): "#000000"
                
                // Icon
                Text {
                    anchors.centerIn: parent
                    text: tabButton.icon
                    font.family: faSolid.name
                    font.pixelSize: 18
                    color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(tabButton.onClicked) {
                        tabButton.onClicked();
                    }
                }
                onEntered: {
                    if(!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if(!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    //Subtab component
    Component {
        id: subTabButtonComponent
        
        Item {
            id: subTabButton
            property string icon
            property string label
            property bool active: false
            width: 100
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): "#000000"
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: subTabButton.icon
                    font.family: faSolid.name
                    font.pixelSize: 18
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Text
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: subTabButton.label
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (subTabButton.onClicked) {
                        subTabButton.onClicked();
                    }
                }
                onEntered: {
                    if(!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if(!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    //Quick shortcut component
    Component {
        id: quickShortcutComponent
        
        Item {
            id: quickShortcut
            property string icon
            property string title
            property string description
            width: parent.width / 2 - 7.5
            height: 150
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                
                // Icon
                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: quickShortcut.icon
                    font.family: faSolid.name
                    font.pixelSize: 24
                    color: pywalColors.colors[2]
                }
                
                // Address
                Text {
                    anchors.top: iconText.bottom
                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: quickShortcut.title
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: pywalColors.colors[2]
                }
                
                // Description
                Text {
                    anchors.top: titleText.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: quickShortcut.description
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    width: parent.width * 0.9
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (quickShortcut.onClicked) {
                        quickShortcut.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    //Group option component
    Component {
        id: optionGroupComponent
        
        Item {
            id: optionGroup
            property string title
            property list<string> options
            property int currentIndex: 0
            signal optionSelected(int index)
            width: parent.width
            height: 80
            
            // Address
            Text {
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 15
                text: optionGroup.title
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            // Options menu
            RowLayout {
                anchors.top: titleText.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                Spacing: 10
                
                Repeater {
                    model: optionGroup.options.length
                    delegate: OptionItem {
                        text: optionGroup.options[index]
                        active: index === optionGroup.currentIndex
                        onClicked: {
                            optionGroup.currentIndex = index;
                            optionGroup.optionSelected(index);
                        }
                    }
                }
            }
        }
    }
    
    // Option component
    Component {
        id: optionItemComponent
        
        Item {
            id: optionItem
            property string text
            property bool active: false
            width: 100
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): "#000000"
                border.color: active ? pywalColors.colors[2] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 1
                
                // Text
                Text {
                    anchors.centerIn: parent
                    text: optionItem.text
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (optionItem.onClicked) {
                        optionItem.onClicked();
                    }
                }
                onEntered: {
                    if(!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if(!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    // Switch control component
    Component {
        id: toggleControlComponent
        
        Item {
            id: toggleControl
            property string title
            property bool active: false
            signal toggled(bool active)
            width: parent.width
            height: 40
            
            // Text
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                text: toggleControl.title
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            // Switch indicator
            ToggleSwitch {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 15
                active: toggleControl.active
                onToggled: {
                    toggleControl.active = active;
                    toggleControl.toggled(active);
                }
            }
        }
    }
    
    // Chip control component
    Component {
        id: sliderControlComponent
        
        Item {
            id: sliderControl
            property string title
            property int min: 0
            property int max: 100
            property int value: 50
            signal valueChanged(int value)
            width: parent.width
            height: 60
            
            // Text
            Text {
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.leftMargin: 15
                text: sliderControl.title
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            // Slide
            Slider {
                anchors.top: titleText.bottom
                anchors.topMargin: 5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                minimumValue: sliderControl.min
                maximumValue: sliderControl.max
                value: sliderControl.value
                onValueChanged: {
                    sliderControl.value = value;
                    sliderControl.valueChanged(value);
                }
            }
            
            // Text value
            Text {
                anchors.top: slider.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                text: sliderControl.value
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
            }
        }
    }
    
    // Font selection component
    Component {
        id: fontSelectorComponent
        
        Item {
            id: fontSelector
            property string currentFont
            width: parent.width
            height: 40
            
            // Font list
            ComboBox {
                anchors.fill: parent
                anchors.margins: 15
                model: ["IBM Plex Sans Thin", "IBM Plex Sans", "Fira Code", "Noto Sans", "Roboto", "Open Sans"]
                currentIndex: model.indexOf(fontSelector.currentFont)
                onActivated: {
                    fontSelector.currentFont = model[index];
                    fontSelector.fontSelected(model[index]);
                }
                
                contentItem: Text {
                    text: displayText
                    font.family: displayText
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
            }
        }
    }
    
    // Theme element component
    Component {
        id: themeItemComponent
        
        Item {
            id: themeItem
            property var theme
            property bool isActive: false
            width: parent.width
            height: 60
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: themeItem.isActive ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: themeItem.isActive ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf042"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: themeItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Theme name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: themeItem.theme.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: themeItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Theme description
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: themeItem.theme.description
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(themeItem.onClicked) {
                        themeItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Mouse pointer element component
    Component {
        id: mouseCursorItemComponent
        
        Item {
            id: mouseCursorItem
            property var cursor
            property bool isActive: false
            width: parent.width
            height: 60
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: mouseCursorItem.isActive ? 
                       Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1): 
                       "#000000"
                border.color: mouseCursorItem.isActive ? 
                              pywalColors.colors[3] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf245"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: mouseCursorItem.isActive ? pywalColors.colors[3] : pywalColors.colors[7]
                }
                
                // Mouse pointer name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: mouseCursorItem.cursor.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: mouseCursorItem.isActive ? pywalColors.colors[3] : pywalColors.colors[7]
                }
                
                // Mouse pointer description
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: mouseCursorItem.cursor.description
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (mouseCursorItem.onClicked) {
                        mouseCursorItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Background element component
    Component {
        id: wallpaperItemComponent
        
        Item {
            id: wallpaperItem
            property var wallpaper
            property bool isActive: false
            width: parent.width
            height: 100
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: wallpaperItem.isActive ? 
                       Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1): 
                       "#000000"
                border.color: wallpaperItem.isActive ? 
                              pywalColors.colors[4] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // The picture
                Image {
                    anchors.fill: parent
                    source: wallpaperItem.wallpaper.thumbnail
                    fillMode: Image.PreserveAspectCrop
                }
                
                // Background name
                Text {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: wallpaperItem.wallpaper.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (wallpaperItem.onClicked) {
                        wallpaperItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Icon element component
    Component {
        id: iconItemComponent
        
        Item {
            id: iconItem
            property var icon
            property bool isActive: false
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: iconItem.isActive ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: iconItem.isActive ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf11b"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: iconItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Icon name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: iconItem.icon.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: iconItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (iconItem.onClicked) {
                        iconItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Abbreviation element component
    Component {
        id: shortcutItemComponent
        
        Item {
            id: shortcutItem
            property var shortcut
            width: parent.width
            height: 50
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Name
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: shortcutItem.shortcut.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Abbreviation
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: shortcutItem.shortcut.keys
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[4]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (shortcutItem.onClicked) {
                        shortcutItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Screen element component
    Component {
        id: displayItemComponent
        
        Item {
            id: displayItem
            property var display
            property bool isSelected: false
            width: parent.width
            height: 60
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: displayItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: displayItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf108"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: displayItem.isSelected ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Screen name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: displayItem.display.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: displayItem.isSelected ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                // Screen information
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: displayItem.display.resolution + " @ " + displayItem.display.refreshRate + "Hz"
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(DisplayItem.onClicked) {
                        DisplayItem.onClicked();
                    }
                }
                onEntered: {
                    if(!DisplayItem.isSelected) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if(!DisplayItem.isSelected) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    // Animation option component
    Component {
        id: animationOptionComponent
        
        Item {
            id: animationOption
            property string label
            property bool isEnabled: true
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Text
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: animationOption.label
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Activation indicator
                ToggleSwitch {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    active: animationOption.isEnabled
                    onToggled: {
                        animationOption.isEnabled = active;
                        toggleAnimation(animationOption.label, active);
                    }
                }
            }
        }
    }
    
    // Resource usage component
    Component {
        id: resourceUsageComponent
        
        Item {
            id: resourceUsage
            property string title
            property string icon
            property real current
            property real total
            property string unit
            property int colorIndex
            width: parent.width
            height: 80
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.1)
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: resourceUsage.icon
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: pywalColors.colors[colorIndex]
                }
                
                // Name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    text: resourceUsage.title
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[colorIndex]
                }
                
                // Value
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 15
                    text: resourceUsage.current + " / " + resourceUsage.total + " " + resourceUsage.unit
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[colorIndex]
                }
                
                // Progress bar
                Rectangle {
                    anchors.left: nameText.right
                    anchors.leftMargin: 10
                    anchors.right: valueText.left
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    height: 10
                    radius: 5
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                    
                    Rectangle {
                        width: parent.width * (resourceUsage.current / resourceUsage.total)
                        height: parent.height
                        radius: 5
                        color: pywalColors.colors[colorIndex]
                    }
                }
            }
        }
    }
    
    // Process element component
    Component {
        id: processItemComponent
        
        Item {
            id: processItem
            property var process
            width: parent.width
            height: 30
            
            // Name
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: processItem.process.name
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: pywalColors.colors[7]
            }
            
            // Usage
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: processItem.process.usage + "%"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: pywalColors.colors[4]
            }
        }
    }
    
    // System information component
    Component {
        id: systemInfoItemComponent
        
        Item {
            id: systemInfoItem
            property string label
            property string value
            width: parent.width
            height: 30
            
            // Label
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: systemInfoItem.label + ":"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            // Value
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: systemInfoItem.value
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[2]
            }
        }
    }
    
    //Theme Store Component
    Component {
        id: themeStoreComponent
        
        Item {
            id: themeStore
            width: 600
            height: 400
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                
                // Transparent background with slight blur effect (without FastBlur)
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                    opacity: 0.92
                    
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Rectangle {
                            width: parent.width
                            height: parent.height
                        }
                        opacity: 0.7
                    }
                }
            }
            
            // Search bar
            Rectangle {
                id: searchContainer
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.8
                height: 40
                radius: 20
                color: Qt.rgba(0, 0, 0, 0.85)
                
                TextInput {
                    anchors.fill: parent
                    anchors.margins: 15
                    text: ""
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[5]
                    placeholderText: "Find themes..."
                    placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    selectByMouse: true
                    focus: true
                    
                    onTextChanged: {
                        filterThemes(text);
                    }
                }
            }
            
            // List of themes
            ListView {
                id: storeThemesList
                anchors.top: searchContainer.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.9
                height: 250
                model: themeStore.themes
                clip: true
                interactive: false
                
                delegate: ThemeStoreItem {
                    width: parent.width
                    height: 70
                    theme: modelData
                    onClicked: {
                        previewTheme(theme);
                    }
                }
                
                // Appearance animation
                OpacityAnimation on opacity {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 0
                    to: 1
                }
            }
            
            // Install button
            Button {
                id: installButton
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: 150
                height: 40
                radius: 20
                color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                border.color: pywalColors.colors[5]
                border.width: 1
                text: "install"
                visible: themeStore.selectedTheme!== null
                
                onClicked: {
                    installTheme(themeStore.selectedTheme);
                }
            }
        }
    }
    
    //Theme Store Item Component
    Component {
        id: themeStoreItemComponent
        
        Item {
            id: themeStoreItem
            property var theme
            width: parent.width
            height: 70
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Thumbnail
                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 50
                    source: themeStoreItem.theme.thumbnail
                    fillMode: Image.PreserveAspectCrop
                }
                
                // Name
                Text {
                    anchors.left: thumbnail.right
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    text: themeStoreItem.theme.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Description
                Text {
                    anchors.left: thumbnail.right
                    anchors.leftMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 10
                    text: themeStoreItem.theme.description
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    width: 200
                    elide: Text.ElideRight
                }
                
                // Evaluation
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf005" + themeStoreItem.theme.rating
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[5]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (themeStoreItem.onClicked) {
                        themeStoreItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    //====================
    // System functions
    //====================
    // Open the Settings app
    function openSettings() {
        settingsContainer.visible = true;
        settingsContainer.opacity = 0;
        fadeInAnimation.target = settingsContainer;
        fadeInAnimation.restart();
    }
    
    // Close the Settings app
    function closeSettings() {
        fadeOutAnimation.target = settingsContainer;
        fadeOutAnimation.onCompleted = function() {
            settingsContainer.visible = false;
        };
        fadeOutAnimation.restart();
    }
    
    // Load resource data
    function loadResourceData() {
        try {
            // Load memory usage
            const memProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            memProcess.start("free", ["-h"]);
            memProcess.waitForFinished(500);
            
            if (memProcess.exitCode() === 0) {
                const output = memProcess.readAllStandardOutput().trim();
                const lines = output.split('\n');
                const memLine = lines[1].split(/\s+/);
                const used = parseFloat(memLine[2].replace("Gi", ""));
                const total = parseFloat(memLine[1].replace("Gi", ""));
                
                // Update the user interface
                memoryUsage.current = used;
                memoryUsage.total = total;
            }
            
            // Load processor usage
            const cpuProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            cpuProcess.start("top", ["-bn1"]);
            cpuProcess.waitForFinished(500);
            
            if (cpuProcess.exitCode() === 0) {
                const output = cpuProcess.readAllStandardOutput().trim();
                const lines = output.split('\n');
                const cpuLine = lines[2];
                const match = cpuLine.match(/Cpu\(s\):\s*([\d.]+)/);
                
                if(match) {
                    const cpuUsage = parseFloat(match[1]);
                    cpuUsage.current = cpuUsage;
                }
            }
            
            // Load active processes
            const processProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            processProcess.start("ps", ["-eo", "comm,%cpu", "--sort=-%cpu"]);
            processProcess.waitForFinished(500);
            
            if (processProcess.exitCode() === 0) {
                const output = processProcess.readAllStandardOutput().trim();
                const lines = output.split('\n').slice(1, 6); // Remove the address and display only 5 operations
                
                processList = [];
                for (const line of lines) {
                    const parts = line.trim().split(/\s+/);
                    if(parts.length >= 2) {
                        processList.push({
                            name: parts[0],
                            usage: parts[1]
                        });
                    }
                }
                
                // Update the user interface
                processesList.model = processList;
            }
        } catch(e) {
            console.error("Failed to load resource data:", e);
        }
    }
    
    // Download themes
    function loadThemes() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["~/.themes"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const themes = output.split('\n');
                
                themeList = themes.map(theme => ({
                    name: theme,
                    description: "Desind Custom Theme",
                    thumbnail: `~/.themes/${theme}/thumbnail.png`
                }));
                
                // Update the user interface
                themesList.model = themeList;
            }
        } catch(e) {
            console.error("Failed to load themes:", e);
            // Use default themes
            themeList = [
                {name: "Desind Dark", description: "Dark theme with matching colors", thumbnail: "qrc:/themes/desind_dark.png"},
                {name: "Desind Light", description: "Light theme with soft colors", thumbnail: "qrc:/themes/desind_light.png"},
                {name: "Solarized Dark", description: "Classic Dark Theme", thumbnail: "qrc:/themes/solarized_dark.png"}
            ];
            themesList.model = themeList;
        }
    }
    
    // Theme app
    function applyTheme(themeName) {
        try {
            // Theme app
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "gtk-theme", themeName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("The theme was applied successfully", "\uf00c");
            } else {
                showToast("Theme application failed", "\uf071");
            }
        } catch(e) {
            console.error("Theme application failed:", e);
            showToast("Theme application failed", "\uf071");
        }
    }
    
    //Open theme store
    function openThemeStore() {
        try {
            // Download themes from the Internet
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https://www.gnome-look.org/"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const themes = JSON.parse(output);
                
                themeStore.themes = themes.map(theme => ({
                    name: theme.name,
                    description: theme.description,
                    rating: theme.rating,
                    thumbnail: theme.thumbnail_url
                }));
            } else {
                // Use default themes
                themeStore.themes = [
                    {name: "Desind Dark", description: "Dark theme with matching colors", rating: 4.8, thumbnail: "qrc:/themes/desind_dark.png"},
                    {name: "Desind Light", description: "Light theme with soft colors", rating: 4.5, thumbnail: "qrc:/themes/desind_light.png"},
                    {name: "Solarized Dark", description: "Classic Dark Theme", rating: 4.7, thumbnail: "qrc:/themes/solarized_dark.png"},
                    {name: "Nord", description: "Dark theme with cool colors", rating: 4.6, thumbnail: "qrc:/themes/nord.png"},
                    {name: "Dracula", description: "Dark theme with bright colors", rating: 4.9, thumbnail: "qrc:/themes/dracula.png"}
                ];
            }
            
            // View Theme Store
            themeStore.visible = true;
            themeStore.opacity = 0;
            fadeInAnimation.target = themeStore;
            fadeInAnimation.restart();
        } catch(e) {
            console.error("Failed to open theme store:", e);
            showToast("Failed to open theme store", "\uf071");
        }
    }
    
    // Theme preview
    function previewTheme(theme) {
        themeStore.selectedTheme = theme;
        // Here you can add preview logic
    }
    
    // Install the theme
    function installTheme(theme) {
        try {
            // Download the theme
            const downloadProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            downloadProcess.start("wget", [theme.download_url, "-P", "/tmp"]);
            downloadProcess.waitForFinished(5000); // 5-second timeout
            
            if (downloadProcess.exitCode() === 0) {
                // Install the theme
                const installProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                installProcess.start("tar", ["-xvf", `/tmp/${theme.name}.tar.gz`, "-C", "~/.themes"]);
                installProcess.waitForFinished(5000);
                
                if (installProcess.exitCode() === 0) {
                    // Update the theme list
                    loadThemes();
                    showToast("The theme was installed successfully", "\uf00c");
                    
                    //Close theme store
                    fadeOutAnimation.target = themeStore;
                    fadeOutAnimation.onCompleted = function() {
                        themeStore.visible = false;
                    };
                    fadeOutAnimation.restart();
                } else {
                    showToast("Theme installation failed", "\uf071");
                }
            } else {
                showToast("Theme download failed", "\uf071");
            }
        } catch(e) {
            console.error("Theme installation failed:", e);
            showToast("Theme installation failed", "\uf071");
        }
    }
    
    // Download wallpapers
    function loadWallpapers() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["~/.wallpapers"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const wallpapers = output.split('\n');
                
                wallpaperList=wallpapers.map(wallpaper=>({
                    name: wallpaper,
                    path: `~/.wallpapers/${wallpaper}`,
                    thumbnail: `~/.wallpapers/${wallpaper}/thumbnail.jpg`
                }));
                
                // Update the user interface
                wallpapersGrid.model = wallpaperList;
            }
        } catch(e) {
            console.error("Failed to load wallpapers:", e);
            // Use virtual backgrounds
            wallpaperList = [
                {name: "Desind Default", path: "qrc:/wallpapers/wallpaper1.jpg", thumbnail: "qrc:/wallpapers/default_thumbnail.jpg"},
                {name: "Nature", path: "qrc:/wallpapers/nature.jpg", thumbnail: "qrc:/wallpapers/nature_thumbnail.jpg"},
                {name: "Abstract", path: "qrc:/wallpapers/abstract.jpg", thumbnail: "qrc:/wallpapers/abstract_thumbnail.jpg"},
                {name: "Dark", path: "qrc:/wallpapers/dark.jpg", thumbnail: "qrc:/wallpapers/dark_thumbnail.jpg"},
                {name: "Light", path: "qrc:/wallpapers/light.jpg", thumbnail: "qrc:/wallpapers/light_thumbnail.jpg"}
            ];
            wallpapersGrid.model = wallpaperList;
        }
    }
    
    // Background application
    function applyWallpaper(wallpaperPath) {
        try {
            // Background application
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.background", "picture-uri", `file://${wallpaperPath}`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("Background changed successfully", "\uf00c");
            } else {
                showToast("Background change failed", "\uf071");
            }
        } catch(e) {
            console.error("Background change failed:", e);
            showToast("Background change failed", "\uf071");
        }
    }
    
    //Open wallpaper store
    function openWallpaperStore() {
        try {
            // Download wallpapers from the Internet
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https://www.gnome-look.org/browse/cat/130/"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const wallpapers = JSON.parse(output);
                
                wallpaperStore.wallpapers = wallpapers.map(wallpaper => ({
                    name: wallpaper.name,
                    description: wallpaper.description,
                    rating: wallpaper.rating,
                    thumbnail: wallpaper.thumbnail_url
                }));
            } else {
                // Use virtual backgrounds
                wallpaperStore.wallpapers=[
                    {name: "Nature", description: "Scenic Landscape", rating: 4.8, thumbnail: "qrc:/wallpapers/nature_thumbnail.jpg"},
                    {name: "Abstract", description: "Artistic Abstract Designs", rating: 4.5, thumbnail: "qrc:/wallpapers/abstract_thumbnail.jpg"},
                    {name: "Dark", description: "Stylish Dark Wallpapers", rating: 4.7, thumbnail: "qrc:/wallpapers/dark_thumbnail.jpg"},
                    {name: "Light", description: "Soft Light Backgrounds", rating: 4.6, thumbnail: "qrc:/wallpapers/light_thumbnail.jpg"},
                    {name: "Patterns", description: "Geometric Patterns", rating: 4.9, thumbnail: "qrc:/wallpapers/patterns_thumbnail.jpg"}
                ];
            }
            
            //View wallpaper store
            wallpaperStore.visible = true;
            wallpaperStore.opacity = 0;
            fadeInAnimation.target = wallpaperStore;
            fadeInAnimation.restart();
        } catch(e) {
            console.error("Failed to open wallpaper store:", e);
            showToast("Failed to open background store", "\uf071");
        }
    }
    
    // Load icons
    function loadIcons() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["~/.icons"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const icons = output.split('\n');
                
                iconList = icons.map(icon => ({
                    name: icon,
                    type: "apps", // Type can be specified based on location
                    thumbnail: `~/.icons/${icon}/thumbnail.png`
                }));
                
                // Update the user interface
                systemIconsList.model = iconList.filter(i => i.type === "system");
                appIconsList.model = iconList.filter(i => i.type === "apps");
            }
        } catch(e) {
            console.error("Icon loading failed:", e);
            // Use default icons
            iconList = [
                {name: "Desind Icons", type: "system", thumbnail: "qrc:/icons/desind_system.png"},
                {name: "Desind Apps", type: "apps", thumbnail: "qrc:/icons/desind_apps.png"},
                {name: "Papirus", type: "apps", thumbnail: "qrc:/icons/papirus.png"},
                {name: "Tela", type: "apps", thumbnail: "qrc:/icons/tela.png"},
                {name: "Breeze", type: "apps", thumbnail: "qrc:/icons/breeze.png"}
            ];
            systemIconsList.model = iconList.filter(i => i.type === "system");
            appIconsList.model = iconList.filter(i => i.type === "apps");
        }
    }
    
    // Apply system icons
    function applySystemIcons(iconName) {
        try {
            // Apply system icons
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "icon-theme", iconName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("System icons changed successfully", "\uf00c");
            } else {
                showToast("Failed to change system icons", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change system icons:", e);
            showToast("Failed to change system icons", "\uf071");
        }
    }
    
    //Application of application icons
    function applyAppIcons(iconName) {
        try {
            //Application of application icons
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "icon-theme", iconName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("App icons changed successfully", "\uf00c");
            } else {
                showToast("Failed to change app icons", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change application icons:", e);
            showToast("Failed to change app icons", "\uf071");
        }
    }
    
    //Open icon store
    function openIconsStore() {
        try {
            // Download icons from the Internet
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https://api.desindos.com/icons"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const icons = JSON.parse(output);
                
                iconsStore.icons = icons.map(icon => ({
                    name: icon.name,
                    description: icon.description,
                    rating: icon.rating,
                    thumbnail: icon.thumbnail_url
                }));
            } else {
                // Use default icons
                iconsStore.icons = [
                    {name: "Desind Icons", description: "Custom icons for Desind", rating: 4.8, thumbnail: "qrc:/icons/desind_system.png"},
                    {name: "Papirus", description: "Simple and elegant icons", rating: 4.5, thumbnail: "qrc:/icons/papirus.png"},
                    {name: "Tela", description: "Recent Icons", rating: 4.7, thumbnail: "qrc:/icons/tela.png"},
                    {name: "Breeze", description: "Icons from KDE", rating: 4.6, thumbnail: "qrc:/icons/breeze.png"},
                    {name: "Fluent", description: "Microsoft Design Compatible Icons", rating: 4.9, thumbnail: "qrc:/icons/fluent.png"}
                ];
            }
            
            // View icon store
            iconsStore.visible = true;
            iconsStore.opacity = 0;
            fadeInAnimation.target = iconsStore;
            fadeInAnimation.restart();
        } catch(e) {
            console.error("Failed to open icon store:", e);
            showToast("Failed to open icon store", "\uf071");
        }
    }
    
    // Load mouse pointers
    function loadMouseCursors() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["~/.icons"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const cursors = output.split('\n');
                
                mouseCursorList = cursors.map(cursor => ({
                    name: cursor,
                    description: "Custom Mouse Pointer",
                    thumbnail: `~/.icons/${cursor}/cursor.png`
                }));
                
                // Update the user interface
                mouseCursorList.model = mouseCursorList;
            }
        } catch(e) {
            console.error("Failed to load mouse pointers:", e);
            // Use default pointers
            mouseCursorList=[
                {name: "Desind Cursor", description: "Custom mouse cursor for Desind", thumbnail: "qrc:/cursors/desind.png"},
                {name: "Breeze", description: "KDE mouse cursor", thumbnail: "qrc:/cursors/breeze.png"},
                {name: "DMZ-White", description: "White Mouse Pointer", thumbnail: "qrc:/cursors/dmz-white.png"},
                {name: "DMZ-Black", description: "Black Mouse Pointer", thumbnail: "qrc:/cursors/dmz-black.png"}
            ];
            mouseCursorList.model = mouseCursorList;
        }
    }
    
    // Mouse pointer application
    function applyMouseCursor(cursorName) {
        try {
            // Mouse pointer application
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "cursor-theme", cursorName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("Mouse cursor changed successfully", "\uf00c");
            } else {
                showToast("Mouse cursor change failed", "\uf071");
            }
        } catch(e) {
            console.error("Mouse cursor change failed:", e);
            showToast("Mouse cursor change failed", "\uf071");
        }
    }
    
    // Open the mouse pointer store
    function openMouseCursorStore() {
        try {
            // Download mouse pointers from the Internet
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https://api.desindos.com/cursors"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const cursors = JSON.parse(output);
                
                mouseCursorStore.cursors = cursors.map(cursor => ({
                    name: cursor.name,
                    description: cursor.description,
                    rating: cursor.rating,
                    thumbnail: cursor.thumbnail_url
                }));
            } else {
                // Use default pointers
                mouseCursorStore.cursors=[
                    {name: "Desind Cursor", description: "Custom mouse cursor for Desind", rating: 4.8, thumbnail: "qrc:/cursors/desind.png"},
                    {name: "Breeze", description: "KDE Mouse Pointer", rating: 4.5, thumbnail: "qrc:/cursors/breeze.png"},
                    {name: "DMZ-White", description: "White Mouse Pointer", rating: 4.7, thumbnail: "qrc:/cursors/dmz-white.png"},
                    {name: "DMZ-Black", description: "Black Mouse Pointer", rating: 4.6, thumbnail: "qrc:/cursors/dmz-black.png"},
                    {name: "Fluent", description: "Microsoft Design Compatible Mouse Pointer", rating: 4.9, thumbnail: "qrc:/cursors/fluent.png"}
                ];
            }
            
            //View mouse cursor store
            mouseCursorStore.visible = true;
            mouseCursorStore.opacity = 0;
            fadeInAnimation.target = mouseCursorStore;
            fadeInAnimation.restart();
        } catch(e) {
            console.error("Failed to open mouse pointer store:", e);
            showToast("Failed to open mouse pointer store", "\uf071");
        }
    }
    
    // Download fonts
    function loadFonts() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("fc-list", [":family"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const fonts = output.split('\n');
                
                fontList = fonts.map(font => ({
                    name: font.split(':')[0],
                    description: "Font available in the system"
                }));
            }
        } catch(e) {
            console.error("Failed to load fonts:", e);
            // Use virtual fonts
            fontList = [
                {name: "IBM Plex Sans Thin", description: "Light and modern font"},
                {name: "IBM Plex Sans", description: "Standard, clear font"},
                {name: "Fira Code", description: "Custom programming font"},
                {name: "Noto Sans", description: "Comprehensive multilingual font"},
                {name: "Roboto", description: "Modern font from Google"}
            ];
        }
    }
    
    // Set system line
    function setSystemFont(font) {
        try {
            // Set system line
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("System font changed successfully", "\uf00c");
            } else {
                showToast("System font change failed", "\uf071");
            }
        } catch(e) {
            console.error("System font change failed:", e);
            showToast("System font change failed", "\uf071");
        }
    }
    
    // Set the application font
    function setAppFont(font) {
        try {
            // Set the application font
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "document-font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("Application font changed successfully", "\uf00c");
            } else {
                showToast("Application font change failed", "\uf071");
            }
        } catch(e) {
            console.error("Application font change failed:", e);
            showToast("Application font change failed", "\uf071");
        }
    }
    
    // Set the API font
    function setCodeFont(font) {
        try {
            // Set the API font
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "monospace-font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("API font changed successfully", "\uf00c");
            } else {
                showToast("Failed to change API font", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change API font:", e);
            showToast("Failed to change API font", "\uf071");
        }
    }
    
    //Open font store
    function openFontStore() {
        try {
            // Download fonts from the Internet
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https://api.desindos.com/fonts"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const fonts = JSON.parse(output);
                
                fontStore.fonts = fonts.map(font => ({
                    name: font.name,
                    description: font.description,
                    rating: font.rating,
                    thumbnail: font.thumbnail_url
                }));
            } else {
                // Use virtual fonts
                fontStore.fonts = [
                    {name: "IBM Plex Sans", description: "Fresh and clear font", rating: 4.8, thumbnail: "qrc:/fonts/ibm_plex.png"},
                    {name: "Fira Code", description: "Custom font for programming", rating: 4.5, thumbnail: "qrc:/fonts/fira_code.png"},
                    {name: "Noto Sans", description: "Comprehensive Multilingual Font", rating: 4.7, thumbnail: "qrc:/fonts/noto_sans.png"},
                    {name: "Roboto", description: "Google Modern Font", rating: 4.6, thumbnail: "qrc:/fonts/roboto.png"},
                    {name: "Open Sans", description: "Readable font", rating: 4.9, thumbnail: "qrc:/fonts/open_sans.png"}
                ];
            }
            
            // View font store
            fontStore.visible = true;
            fontStore.opacity = 0;
            fadeInAnimation.target = fontStore;
            fadeInAnimation.restart();
        } catch(e) {
            console.error("Failed to open font store:", e);
            showToast("Failed to open font store", "\uf071");
        }
    }
    
    // Change the speed of animations
    function setAnimationSpeed(speed) {
        try {
            // Apply animation speed
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "enable-animations", speed > 50 ? "true" : "false"]);
            process.waitForFinished(500);
            
            // Change the duration of animations in the system
            animationDuration = speed;
            
            if (process.exitCode() === 0) {
                showToast(`Animations speed changed to ${speed} ms`, "\uf00c");
            } else {
                showToast("Animation speed change failed", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change animation speed:", e);
            showToast("Animation speed change failed", "\uf071");
        }
    }
    
    //Activate/Deactivate Animation
    function toggleAnimation(animationName, active) {
        try {
            // Here you can add logic to activate/deactivate a specific animation
            showToast(active ? `${animationName}` activated: `${animationName}`, "\uf00c" has been deactivated);
        } catch(e) {
            console.error("Failed to change animation settings:", e);
            showToast("Failed to change animation settings", "\uf071");
        }
    }
    
    // Change the shape of the edges
    function setWindowCorners(index) {
        try {
            // Here you can add logic to change the shape of the edges
            const corners = ["square", "slightlyRounded", "fullyRounded"];
            showToast(`The shape of the edges has been changed to ${corners[index]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to change edge shape:", e);
            showToast("Failed to change edge shape", "\uf071");
        }
    }
    
    // Resize edges
    function setWindowRadius(index) {
        try {
            // Here you can add logic to resize edges
            const sizes = ["small", "medium", "large"];
            showToast(`Edges resized to ${sizes[index]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to resize edges:", e);
            showToast("Failed to resize edges", "\uf071");
        }
    }
    
    // Change mouse speed
    function setMouseSpeed(speed) {
        try {
            // Change mouse speed
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("xset", ["m", speed * 10, "5"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`Mouse speed changed to ${speed}`, "\uf00c");
            } else {
                showToast("Mouse speed change failed", "\uf071");
            }
        } catch(e) {
            console.error("Mouse speed change failed:", e);
            showToast("Mouse speed change failed", "\uf071");
        }
    }
    
    // Change the scroll direction
    function setMouseScrollDirection(inverted) {
        try {
            // Change the scroll direction
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.peripherals.touchpad", "natural-scroll", inverted ? "true" : "false"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(inverted? "Reverse scroll direction activated": "Reverse scroll direction cancelled", "\uf00c");
            } else {
                showToast("Failed to change scroll direction", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change scroll direction:", e);
            showToast("Failed to change scroll direction", "\uf071");
        }
    }
    
    // Change background display mode
    function setWallpaperMode(modeIndex) {
        try {
            const modes = ["zoom", "scaled", "stretched", "wallpaper"];
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.background", "picture-options", modes[modeIndex]]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`Display mode changed to ${modes[modeIndex]}`, "\uf00c");
            } else {
                showToast("Failed to change display mode", "\uf071");
            }
        } catch(e) {
            console.error("Failed to change display mode:", e);
            showToast("Failed to change display mode", "\uf071");
        }
    }
    
    //Activate/Deactivate animated wallpapers
    function setAnimatedWallpaper(active) {
        try {
            // Here you can add logic to activate/deactivate animated backgrounds
            showToast(active ? "Animated wallpapers activated": "Animated wallpapers deactivated", "\uf00c");
        } catch(e) {
            console.error("Failed to change animated background settings:", e);
            showToast("Failed to change animated background settings", "\uf071");
        }
    }
    
    // Change the lock screen clock size
    function setLockscreenClockSize(sizeIndex) {
        try {
            const sizes = ["small", "medium", "large"];
            // Here you can add logic to change the clock size
            showToast(`The clock has been resized to ${sizes[sizeIndex]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to resize lock screen clock:", e);
            showToast("Failed to resize lock screen clock", "\uf071");
        }
    }
    
    // Change the location of the lock screen clock
    function setLockscreenClockPosition(positionIndex) {
        try {
            const positions = ["top", "center", "bottom"];
            // Here you can add logic to change the location of the clock
            showToast(`The clock location has been changed to ${positions[positionIndex]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to relocate lock screen clock:", e);
            showToast("Failed to relocate lock screen clock", "\uf071");
        }
    }
    
    // Change the lock screen clock font
    function setLockscreenClockFont(fontIndex) {
        try {
            const fonts = ["Thin", "Light", "Regular", "Bold"];
            // Here you can add logic to change the clock line
            showToast(`The clock font has been changed to ${fonts[fontIndex]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to change lock screen clock font:", e);
            showToast("Failed to change lock screen clock font", "\uf071");
        }
    }
    
    // Change the lock screen background
    function setLockscreenWallpaper(wallpaperIndex) {
        try {
            const wallpapers = ["current", "dark", "custom"];
            // Here logic can be added to change the background of the lock screen
            showToast(`The lock screen background has been changed to ${wallpapers[wallpaperIndex]}`, "\uf00c");
        } catch(e) {
            console.error("Failed to change lock screen background:", e);
            showToast("Failed to change lock screen background", "\uf071");
        }
    }
    
    // Set the home screen
    function setPrimaryDisplay(displayName) {
        try {
            // Set the home screen
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["keyword", "monitor", displayName + ", preferred, auto, 1"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`${displayName} is set as the home screen`, "\uf00c");
            } else {
                showToast("Home screen mapping failed", "\uf071");
            }
        } catch(e) {
            console.error("Home screen mapping failed:", e);
            showToast("Home screen mapping failed", "\uf071");
        }
    }
    
    // Display notification
    function showToast(message, icon) {
        // Here you can add logic to display a notification
        console.log(`Toast: ${message}`);
    }

    // Function to open the settings application with the desired partition selected
    function openSettingsApp(section) {
        // If the application is already open, just change the partition
        if (isSettingsAppOpen) {
            navigateSettingsApp(section)
            return
        }
        
        //Very fast appearance effect (maximum MCX)
        settingsAppOpenEffect.start()
        
        // Open the Settings app
        isSettingsAppOpen = true
        settingsAppSection = section
        
        // Fast transition effect to open the application
        settingsAppAnimation.start()
    }

    // Effect of opening the Settings app (MCX max)
    Rectangle {
        id: settingsAppOpenEffect
        anchors.centerIn: parent
        width: 0
        height: 0
        radius: 0
        color: pywalColors.colors[6]
        opacity: 0.5
        
        SequentialAnimation {
            id: settingsAppAnimation
            NumberAnimation {
                target: settingsAppOpenEffect
                property: "width"
                from: 0
                to: Screen.width * 0.8
                duration: 4
            }
            NumberAnimation {
                target: settingsAppOpenEffect
                property: "height"
                from: 0
                to: Screen.height * 0.8
                duration: 4
            }
            NumberAnimation {
                target: settingsAppOpenEffect
                property: "opacity"
                from: 0.5
                to: 0
                duration: 4
            }
            NumberAnimation {
                target: settingsAppOpenEffect
                property: "radius"
                from: 0
                to: 20
                duration: 4
            }
        }
        
        onVisibleChanged: {
            if (visible) {
                settingsAppAnimation.restart()
            }
        }
    }

    // Function to navigate within the Settings app
    function navigateSettingsApp(section) {
        settingsAppSection = section
        
        // Fast transition effect between sections
        settingsSectionTransition.start()
    }

    // Effect of moving between settings sections (max MCX)
    Rectangle {
        id: settingsSectionTransition
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        
        SequentialAnimation {
            id: sectionTransitionAnimation
            NumberAnimation {
                target: settingsSectionTransition
                property: "opacity"
                from: 0
                to: 1
                duration: 2
            }
            NumberAnimation {
                target: settingsSectionTransition
                property: "opacity"
                from: 1
                to: 0
                duration: 2
            }
        }
    }

    //=========================
    // Appearance and disappearance animations
    //=========================
    // Appearance animation
    OpacityAnimation {
        id: fadeInAnimation
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    //Disappearance Animation
    OpacityAnimation {
        id: fadeOutAnimation
        from: 1
        to: 0
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    //==========================
    // Load default data
    //==========================
    Component.onCompleted: {
        // Load default data
        loadThemes();
        loadWallpapers();
        loadIcons();
        loadMouseCursors();
        loadFonts();
        
        // Download system information
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hostname");
            process.waitForFinished(500);
            if (process.exitCode() === 0) {
                systemInfo.deviceName = process.readAllStandardOutput().trim();
            }
        } catch(e) {
            console.error("Failed to fetch device name:", e);
        }
    }
}
EOL

# ===============
# Preparing Drile
# ===============
echo "---------------------------
echo "(3/5) Create a file manager..."
cat <<EOL > ~/.config/Drile/Drile.qml
//=====================
//Drile - File Manager
//=====================
import QtQuick 6.8
import QtQuick.Controls 6.8
import QtQuick.Layouts 6.8
import QtGraphicalEffects 6.8
import Qt.labs.processes 6.8
import QtQml 6.8
import "qrc:/fonts/fontawesome.js" as faSolid
import "qrc:/colors/pywalColors.js" as pywalColors
import QtQuick.Extras 6.8
import QtMultimedia 6.8

Item {
    id: drele
    width: 1000
    height: 650
    
    // Application properties
    property string currentPath: "/home/" + Qt.application.arguments[2]
    property string selectedPath: ""
    property int viewMode: 0 // 0: list, 1: grid, 2: detail
    property int animationduration: 50
    property int debounceTime: 50
    property bool showHiddenFiles: false
    property var clipboard: null
    property string clipboardAction: "" // "cut" or "copy"
    
    // File form
    property var files: []
    property var selectedFiles: []
    property var bookmarks: [
        {name: "Home", path: "/home/" + Qt.application.arguments[2]},
        {name: "Images", path: "/home/" + Qt.application.arguments[2] + "/Pictures"},
        {name: "Documents", path: "/home/" + Qt.application.arguments[2] + "/Documents"},
        {name: "Downloads", path: "/home/" + Qt.application.arguments[2] + "/Downloads"},
        {name: "Video", path: "/home/" + Qt.application.arguments[2] + "/Videos"}
    ]
    
    // Application status
    property bool isSearching: false
    property string searchQuery: ""
    property var tabs: [{id: "tab1", title: "Home", path: "/home/" + Qt.application.arguments[2]}]
    property int activeTabIndex: 0
    property bool contextMenuVisible: false
    property point contextMenuPos: ({x: 0, y: 0})
    
    // Configure the user interface
    Rectangle {
        id: container
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        visible: false
        
        // Transparent background with slight blur effect (without FastBlur)
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.92
            
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: parent.width
                    height: parent.height
                }
                opacity: 0.7
            }
        }
        
        // Top tab bar (dynamic island)
        Item {
            id: islandContainer
            width: parent.width * 0.9
            height: 50
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            
            //Full oval background (without FastBlur)
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: 25
                color: Qt.rgba(0, 0, 0, 0.85)
                border.width: 0
                
                // Improve blur (without FastBlur)
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: 25
                    }
                    opacity: 0.7
                }
            }
            
            // Tab bar
            RowLayout {
                id: tabBar
                anchors.fill: parent
                anchors.margins: 10
                Spacing: 5
                
                // Tab buttons
                Repeater {
                    model: drile.tabs
                    delegate: TabButton {
                        id: tabButton
                        text: modelData.title
                        active: index === drile.activeTabIndex
                        onCloseRequested: {
                            closeTab(index)
                        }
                        onClicked: {
                            drile.activeTabIndex = index;
                            drile.currentPath = drile.tabs[index].path;
                            loadDirectory(drile.currentPath);
                        }
                    }
                }
                
                // Add new tab button
                Button {
                    width: 40
                    height: 40
                    radius: 20
                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                    border.color: pywalColors.colors[5]
                    border.width: 1
                    text: "+"
                    
                    onClicked: {
                        addNewTab();
                    }
                }
            }
        }
        
        // Application content
        Item {
            id: content
            anchors.top: islandContainer.bottom
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            
            // Navigation bar
            RowLayout {
                id: navigationBar
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                height: 40
                Spacing: 10
                
                // Navigation buttons
                Button {
                    width: 40
                    height: 40
                    radius: 20
                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                    border.color: pywalColors.colors[2]
                    border.width: 1
                    text: "\uf060" // Return code
                    
                    onClicked: {
                        goBack();
                    }
                }
                
                Button {
                    width: 40
                    height: 40
                    radius: 20
                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                    border.color: pywalColors.colors[2]
                    border.width: 1
                    text: "\uf061" // Progress code
                    
                    onClicked: {
                        goForward();
                    }
                }
                
                Button {
                    width: 40
                    height: 40
                    radius: 20
                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                    border.color: pywalColors.colors[2]
                    border.width: 1
                    text: "\uf0e2" // Update code
                    
                    onClicked: {
                        loadDirectory(currentPath);
                    }
                }
                
                // Path bar
                Rectangle {
                    id:pathBar
                    Layout.fillWidth: true
                    height: 40
                    radius: 20
                    color: Qt.rgba(0, 0, 0, 0.85)
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        Spacing: 5
                        
                        // Folder path
                        Repeater {
                            model: currentPath.split("/").filter(p => p!== "").length + 1
                            delegate: PathSegment {
                                text: index === 0? "Home": currentPath.split("/")[index]
                                isLast: index === currentPath.split("/").filter(p => p!== "").length
                                onClicked: {
                                    let newPath = "/";
                                    for (let i = 1; i <= index; i++) {
                                        newPath += currentPath.split("/")[i] + "/";
                                    }
                                    if (index === 0) {
                                        newPath = "/home/" + Qt.application.arguments[2];
                                    }
                                    currentPath = newPath;
                                    loadDirectory(currentPath);
                                }
                            }
                        }
                    }
                }
                
                // Search bar
                Rectangle {
                    id: searchContainer
                    width: 300
                    height: 40
                    radius: 20
                    color: Qt.rgba(0, 0, 0, 0.85)
                    
                    TextInput {
                        anchors.fill: parent
                        anchors.margins: 15
                        text: ""
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[5]
                        placeholderText: "Search this folder..."
                        placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                        selectByMouse: true
                        focus: false
                        maximumLength: 100
                        
                        onTextChanged: {
                            if (searchTimer) {
                                clearTimeout(searchTimer);
                            }
                            
                            if(text.length > 0) {
                                searchTimer = setTimeout(function() {
                                    searchQuery = text;
                                    performSearch(text);
                                }, debounceTime);
                            } else {
                                searchQuery = "";
                                loadDirectory(currentPath);
                            }
                        }
                    }
                    
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\uf002"
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    }
                }
            }
            
            // File manager content
            Item {
                id: fileManagerContent
                anchors.top: navigationBar.bottom
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                
                // Favorites sidebar
                Rectangle {
                    id: sidebar
                    width: 250
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    color: "#000000"
                    border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                    border.width: 1
                    
                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 15
                        Spacing: 10
                        
                        //Favorite titles
                        Text {
                            text: "Favorites"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        // Favorites List
                        ListView {
                            id: bookmarksList
                            Layout.fillWidth: true
                            height: 150
                            model: drile.bookmarks
                            clip: true
                            interactive: false
                            
                            delegate: BookmarkItem {
                                width: parent.width
                                height: 40
                                bookmark: modelData
                                onClicked: {
                                    currentPath = bookmark.path;
                                    loadDirectory(currentPath);
                                }
                            }
                        }
                        
                        // Website addresses
                        Text {
                            text: "Locations"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        // List of sites
                        ListView {
                            id: locationsList
                            Layout.fillWidth: true
                            height: 200
                            model: [
                                {name: "Computer", icon: "\uf109"},
                                {name: "Network", icon: "\uf1eb"},
                                {name: "Engines", icon: "\uf0a0"}
                            ]
                            clip: true
                            interactive: false
                            
                            delegate: LocationItem {
                                width: parent.width
                                height: 40
                                location: modelData
                                onClicked: {
                                    if(location.name === "computer") {
                                        currentPath = "/";
                                        loadDirectory(currentPath);
                                    }
                                }
                            }
                        }
                        
                        // Device addresses
                        Text {
                            text: "Devices"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        // Device List
                        ListView {
                            id: devicesList
                            Layout.fillWidth: true
                            height: 100
                            model: getDevices()
                            clip: true
                            interactive: false
                            
                            delegate: DeviceItem {
                                width: parent.width
                                height: 40
                                device: modelData
                                onClicked: {
                                    currentPath = device.mountPoint;
                                    loadDirectory(currentPath);
                                }
                            }
                        }
                    }
                }
                
                // File display area
                Item {
                    id: filesArea
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: sidebar.right
                    anchors.right: parent.right
                    anchors.margins: 10
                    
                    // Toolbar
                    RowLayout {
                        id: toolbar
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        height: 40
                        Spacing: 10
                        
                        // Display buttons
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode === 0? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode=== 0? 1 : 0
                            text: "\uf00b" // List code
                            
                            onClicked: {
                                viewMode = 0;
                            }
                        }
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode===1? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode===1? 1 : 0
                            text: "\uf009" // Network code
                            
                            onClicked: {
                                viewMode = 1;
                            }
                        }
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode === 2? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode===2? 1 : 0
                            text: "\uf0ae" // Detail code
                            
                            onClicked: {
                                viewMode = 2;
                            }
                        }
                        
                        // Show hidden files button
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: showHiddenFiles ? Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1): Qt.rgba(0, 0, 0, 0.85)
                            border.color: showHiddenFiles ? pywalColors.colors[5] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                            border.width: showHiddenFiles ? 1 : 0
                            text: "\uf06e" // Hidden file code
                            
                            onClicked: {
                                showHiddenFiles=!showHiddenFiles;
                                loadDirectory(currentPath);
                            }
                        }
                    }
                    
                    // Display elements by mode
                    Item {
                        id: viewContainer
                        anchors.top: toolbar.bottom
                        anchors.topMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        
                        // Display list
                        Item {
                            id:listView
                            anchors.fill: parent
                            visible: viewMode===0
                            
                            ListView {
                                id: listFilesView
                                anchors.fill: parent
                                model: filteredFiles
                                clip: true
                                interactive: false
                                
                                delegate: FileItem {
                                    width: parent.width
                                    height: 40
                                    file: modelData
                                    isSelected: drile.selectedFiles.some(f => f.path === file.path)
                                    onClicked: {
                                        handleFileClick(file, mouse)
                                    }
                                    onDoubleClicked: {
                                        if (file.isDirectory) {
                                            currentPath = file.path;
                                            loadDirectory(currentPath);
                                        } else {
                                            openFile(file.path);
                                        }
                                    }
                                }
                                
                                // Appearance animation
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                            }
                        }
                        
                        // Network view
                        Item {
                            id: gridView
                            anchors.fill: parent
                            visible: viewMode===1
                            
                            GridView {
                                id: gridFilesView
                                anchors.fill: parent
                                cellWidth: 150
                                cellHeight: 150
                                model: filteredFiles
                                clip: true
                                interactive: false
                                
                                delegate: GridFileItem {
                                    width: parent.cellWidth
                                    height: parent.cellHeight
                                    file: modelData
                                    isSelected: drile.selectedFiles.some(f => f.path === file.path)
                                    onClicked: {
                                        handleFileClick(file, mouse)
                                    }
                                    onDoubleClicked: {
                                        if (file.isDirectory) {
                                            currentPath = file.path;
                                            loadDirectory(currentPath);
                                        } else {
                                            openFile(file.path);
                                        }
                                    }
                                }
                                
                                // Appearance animation
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                            }
                        }
                        
                        // View details
                        Item {
                            id: detailsView
                            anchors.fill: parent
                            visible: viewMode===2
                            
                            ListView {
                                id: detailsFilesView
                                anchors.fill: parent
                                model: filteredFiles
                                clip: true
                                interactive: false
                                
                                delegate: DetailFileItem {
                                    width: parent.width
                                    height: 30
                                    file: modelData
                                    isSelected: drile.selectedFiles.some(f => f.path === file.path)
                                    onClicked: {
                                        handleFileClick(file, mouse)
                                    }
                                    onDoubleClicked: {
                                        if (file.isDirectory) {
                                            currentPath = file.path;
                                            loadDirectory(currentPath);
                                        } else {
                                            openFile(file.path);
                                        }
                                    }
                                }
                                
                                // Appearance animation
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Context menu (right mouse button)
        Rectangle {
            id: contextMenu
            width: 250
            height: contextMenuItems.length * 40
            radius: 15
            color: "#000000"
            border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
            border.width: 1
            visible: contextMenuVisible
            x: contextMenuPos.x
            y: contextMenuPos.y
            
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: parent.width
                    height: parent.height
                    radius: 15
                }
                opacity: 0.7
            }
            
            Repeater {
                id: contextMenuRepeater
                model: contextMenuItems
                delegate: ContextMenuItem {
                    width: parent.width
                    height: 40
                    item: modelData
                    onClicked: {
                        executeContextMenuItem(item);
                        contextMenuVisible = false;
                    }
                }
            }
        }
    }
    
    //====================
    // Auxiliary components
    //====================
    
    // Tab component
    Component {
        id: tabButtonComponent
        
        Item {
            id: tabButton
            property string text
            property bool active: false
            width: 120
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): "#000000"
                border.color: active ? pywalColors.colors[2] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 1
                
                // Text
                Text {
                    anchors.centerIn: parent
                    text: tabButton.text
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            //Close button
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                width: 20
                height: 20
                radius: 10
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.3): Qt.rgba(0, 0, 0, 0.5)
                visible: drill.tabs.length > 1
                
                Text {
                    anchors.centerIn: parent
                    text: "×"
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if(tabButton.onCloseRequested) {
                            tabButton.onCloseRequested();
                        }
                    }
                    onEntered: {
                        parent.color=active? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.5): Qt.rgba(0, 0, 0, 0.7);
                    }
                    onExited: {
                        parent.color=active? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.3): Qt.rgba(0, 0, 0, 0.5);
                    }
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(tabButton.onClicked) {
                        tabButton.onClicked();
                    }
                }
                onEntered: {
                    if(!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if(!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    // Path slice component
    Component {
        id: pathSegmentComponent
        
        Item {
            id: pathSegment
            property string text
            property bool isLast: false
            width: 80
            height: 30
            
            // Text
            Text {
                anchors.centerIn: parent
                text: pathSegment.text
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: pywalColors.colors[7]
                elide: Text.ElideRight
                width: parent.width * 0.8
            }
            
            // separator
            Text {
                anchors.left: parent.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: isLast? "": "/"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (pathSegment.onClicked) {
                        pathSegment.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Favorites component
    Component {
        id: bookmarkItemComponent
        
        Item {
            id: bookmarkItem
            property var bookmark
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: bookmarkItem.bookmark.name === "Home" ? "\uf015" : 
                          (bookmarkItem.bookmark.name === "Photos"? "\uf03e": 
                          (bookmarkItem.bookmark.name === "Documents"? "\uf15c": 
                          (bookmarkItem.bookmark.name === "Downloads" ? "\uf019" : 
                          (bookmarkItem.bookmark.name === "Video"? "\uf03d" : "\uf15b"))))
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Text
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: bookmarkItem.bookmark.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (bookmarkItem.onClicked) {
                        bookmarkItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Site component
    Component {
        id: locationItemComponent
        
        Item {
            id: locationItem
            property var location
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: locationItem.location.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Text
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: locationItem.location.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (locationItem.onClicked) {
                        locationItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Device component
    Component {
        id: deviceItemComponent
        
        Item {
            id: deviceItem
            property var device
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: deviceItem.device.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Text
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: deviceItem.device.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (deviceItem.onClicked) {
                        deviceItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // File element component (list view)
    Component {
        id: fileItemComponent
        
        Item {
            id: fileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: fileItem.isSelected? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: fileItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "\uf07b" : 
                          (fileItem.file.extension === "pdf" ? "\uf1c1" :
                          (fileItem.file.extension === "txt" ? "\uf15c":
                          (fileItem.file.extension === "jpg" || fileItem.file.extension === "png" ? "\uf03e":
                          (fileItem.file.extension === "mp3" || fileItem.file.extension === "wav" ? "\uf001" :
                          (fileItem.file.extension === "mp4" || fileItem.file.extension === "avi" ? "\uf03d" : "\uf15b")))))
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: fileItem.file.isDirectory ? pywalColors.colors[5] : 
                           (fileItem.file.extension === "pdf" ? pywalColors.colors[3] :
                           (fileItem.file.extension === "txt" ? pywalColors.colors[6] :
                           (fileItem.file.extension === "jpg" || fileItem.file.extension === "png" ? pywalColors.colors[4] :
                           (fileItem.file.extension === "mp3" || fileItem.file.extension === "wav" ? pywalColors.colors[2] :
                           (fileItem.file.extension === "mp4" || fileItem.file.extension === "avi" ? pywalColors.colors[1] : pywalColors.colors[7])))))
                }
                
                // Name
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                    elide: Text.ElideRight
                    width: 200
                }
                
                // Type
                Text {
                    anchors.left: nameText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "folder": fileItem.file.extension.toUpperCase()
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
                
                // Size
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "": formatFileSize(fileItem.file.size)
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
                
                //History
                Text {
                    anchors.right: sizeText.left
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: formatDate(fileItem.file.modified)
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (fileItem.onClicked) {
                        fileItem.onClicked();
                    }
                }
                onDoubleClicked: {
                    if (fileItem.onDoubleClicked) {
                        fileItem.onDoubleClicked();
                    }
                }
                onPressAndHold: {
                    if (mouse.button === Qt.RightButton) {
                        showContextMenu(mouseX, mouseY);
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // File element component (grid view)
    Component {
        id: gridFileItemComponent
        
        Item {
            id: gridFileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: parent.height
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: gridFileItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: gridFileItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    Spacing: 5
                    
                    // Icon
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: gridFileItem.file.isDirectory ? "\uf07b" : 
                              (gridFileItem.file.extension === "pdf" ? "\uf1c1" :
                              (gridFileItem.file.extension === "txt" ? "\uf15c":
                              (gridFileItem.file.extension === "jpg" || gridFileItem.file.extension === "png" ? "\uf03e":
                              (gridFileItem.file.extension === "mp3" || gridFileItem.file.extension === "wav" ? "\uf001" :
                              (gridFileItem.file.extension === "mp4" || gridFileItem.file.extension === "avi" ? "\uf03d" : "\uf15b")))))
                        font.family: faSolid.name
                        font.pixelSize: 30
                        color: gridFileItem.file.isDirectory ? pywalColors.colors[5] : 
                               (gridFileItem.file.extension === "pdf" ? pywalColors.colors[3] :
                               (gridFileItem.file.extension === "txt" ? pywalColors.colors[6] :
                               (gridFileItem.file.extension === "jpg" || gridFileItem.file.extension === "png" ? pywalColors.colors[4] :
                               (gridFileItem.file.extension === "mp3" || gridFileItem.file.extension === "wav" ? pywalColors.colors[2] :
                               (gridFileItem.file.extension === "mp4" || gridFileItem.file.extension === "avi" ? pywalColors.colors[1] : pywalColors.colors[7])))))
                    }
                    
                    // Name
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: gridFileItem.file.name
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                        elide: Text.ElideRight
                        width: parent.width * 0.9
                    }
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (gridFileItem.onClicked) {
                        gridFileItem.onClicked();
                    }
                }
                onDoubleClicked: {
                    if (gridFileItem.onDoubleClicked) {
                        gridFileItem.onDoubleClicked();
                    }
                }
                onPressAndHold: {
                    if (mouse.button === Qt.RightButton) {
                        showContextMenu(mouseX, mouseY);
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // File element component (view details)
    Component {
        id: detailFileItemComponent
        
        Item {
            id: detailFileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: 30
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 5
                color: detailFileItem.isSelected? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1): 
                       "#000000"
                border.color: detailFileItem.isSelected? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 5
                    Spacing: 10
                    
                    // Icon
                    Text {
                        Layout.alignment: Qt.AlignVCenter
                        text: detailFileItem.file.isDirectory ? "\uf07b" : 
                              (detailFileItem.file.extension === "pdf" ? "\uf1c1" :
                              (detailFileItem.file.extension === "txt" ? "\uf15c":
                              (detailFileItem.file.extension === "jpg" || detailFileItem.file.extension === "png" ? "\uf03e":
                              (detailFileItem.file.extension === "mp3" || detailFileItem.file.extension === "wav" ? "\uf001" :
                              (detailFileItem.file.extension === "mp4" || detailFileItem.file.extension === "avi" ? "\uf03d" : "\uf15b")))))
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: detailFileItem.file.isDirectory ? pywalColors.colors[5] : 
                               (detailFileItem.file.extension === "pdf" ? pywalColors.colors[3] :
                               (detailFileItem.file.extension === "txt" ? pywalColors.colors[6] :
                               (detailFileItem.file.extension === "jpg" || detailFileItem.file.extension === "png" ? pywalColors.colors[4] :
                               (detailFileItem.file.extension === "mp3" || detailFileItem.file.extension === "wav" ? pywalColors.colors[2] :
                               (detailFileItem.file.extension === "mp4" || detailFileItem.file.extension === "avi" ? pywalColors.colors[1] : pywalColors.colors[7])))))
                    }
                    
                    // Name
                    Text {
                        Layout.fillWidth: true
                        text: detailFileItem.file.name
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                        elide: Text.ElideRight
                    }
                    
                    // Type
                    Text {
                        width: 100
                        text: detailFileItem.file.isDirectory ? "folder": detailFileItem.file.extension.toUpperCase()
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    // Size
                    Text {
                        width: 100
                        text: detailFileItem.file.isDirectory ? "": formatFileSize(detailFileItem.file.size)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    //History
                    Text {
                        width: 150
                        text: formatDate(detailFileItem.file.modified)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (detailFileItem.onClicked) {
                        detailFileItem.onClicked();
                    }
                }
                onDoubleClicked: {
                    if (detailFileItem.onDoubleClicked) {
                        detailFileItem.onDoubleClicked();
                    }
                }
                onPressAndHold: {
                    if (mouse.button === Qt.RightButton) {
                        showContextMenu(mouseX, mouseY);
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    // Context menu item component
    Component {
        id: contextMenuItemComponent
        
        Item {
            id: contextMenuItem
            property var item
            width: parent.width
            height: 40
            
            // Background
            Rectangle {
                anchors.fill: parent
                radius: 5
                color: "#000000"
                border.width: 0
                
                // Icon
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: contextMenuItem.item.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                // Text
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: contextMenuItem.item.text
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[7]
                }
            }
            
            // Animation of interaction with the mouse
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            // Interaction area
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (contextMenuItem.onClicked) {
                        contextMenuItem.onClicked();
                    }
                }
                onEntered: {
                    parent.scale = 1.05;
                }
                onExited: {
                    parent.scale = 1.0;
                }
            }
        }
    }
    
    //====================
    // System functions
    //====================
    
    // Open the file manager
    function openDrile() {
        container.visible = true;
        container.opacity = 0;
        fadeInAnimation.target = container;
        fadeInAnimation.restart();
        
        // Download the current directory
        loadDirectory(currentPath);
    }
    
    // Close the file manager
    function closeDrile() {
        fadeOutAnimation.target = container;
        fadeOutAnimation.onCompleted = function() {
            container.visible = false;
        };
        fadeOutAnimation.restart();
    }
    
    // Download the contents of the directory
    function loadDirectory(path) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["-lA", path]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const lines = output.split('\n');
                
                drile.files = [];
                
                for (const line of lines) {
                    if (line.startsWith("total")) continue;
                    
                    const parts = line.split(/\s+/);
                    if (parts.length < 9) continue;
                    
                    const isDirectory = parts[0].startsWith("d");
                    const name = line.substring(line.lastIndexOf(" ") + 1);
                    const size = isDirectory ? 0 : parseInt(parts[4]);
                    const modified = line.substring(line.indexOf(":") - 3, line.indexOf(":") + 5);
                    
                    // Skip hidden files if view is not enabled
                    if(!showHiddenFiles && name.startsWith(".")) continue;
                    
                    drile.files.push({
                        name: name,
                        path: path + "/" + name,
                        isDirectory: isDirectory,
                        size: size,
                        modified: modified,
                        extension: isDirectory? "": name.split(".").pop().toLowerCase()
                    });
                }
                
                // Update the user interface
                updateUI();
            }
        } catch(e) {
            console.error("Failed to load directory:", e);
            showToast("Failed to load directory", "\uf071");
        }
    }
    
    // Search the directory
    function performSearch(query) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("find", [currentPath, "-iname", `*${query}*`, "-maxdepth", "1"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const paths = output.split('\n');
                
                drile.files = [];
                
                for (const path of paths) {
                    if(!path || path === currentPath) continue;
                    
                    const name = path.substring(path.lastIndexOf("/") + 1);
                    const isDirectory = path.endsWith("/");
                    
                    drile.files.push({
                        name: name,
                        path: path,
                        isDirectory: isDirectory,
                        size: 0, // Size will be updated later
                        modified: "",
                        extension: isDirectory? "": name.split(".").pop().toLowerCase()
                    });
                }
                
                // Update the user interface
                updateUI();
            }
        } catch(e) {
            console.error("Search failed:", e);
            showToast("Search Failed", "\uf071");
        }
    }
    
    // Update the user interface
    function updateUI() {
        // Update file list
        if (viewMode === 0) {
            listFilesView.model = filteredFiles;
        } else if (viewMode === 1) {
            gridFilesView.model = filteredFiles;
        } else if (viewMode === 2) {
            detailsFilesView.model = filteredFiles;
        }
    }
    
    // Open a file
    function openFile(path) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("xdg-open", [path]);
            process.waitForFinished(500);
            
            if (process.exitCode() !== 0) {
                showToast("Failed to open file", "\uf071");
            }
        } catch(e) {
            console.error("Failed to open file:", e);
            showToast("Failed to open file", "\uf071");
        }
    }
    
    // Return to the previous directory
    function goBack() {
        const parts = currentPath.split("/");
        if(parts.length > 2) {
            parts.pop();
            currentPath = parts. join("/");
            loadDirectory(currentPath);
        }
    }
    
    // Progress to the next directory
    function goForward() {
        // In this simple version, progress will not be supported
        showToast("No previous directory to reapply to", "\uf071");
    }
    
    // Add a new tab
    function addNewTab() {
        const newTab = {
            id: "tab" + (drile.tabs.length + 1),
            title: "New",
            path: "/home/" + Qt.application.arguments[2]
        };
        
        drile.tabs = [...drile.tabs, newTab];
        drile.activeTabIndex = drile.tabs.length - 1;
        drile.currentPath = newTab.path;
        loadDirectory(drile.currentPath);
    }
    
    // Close tab
    function closeTab(index) {
        if (drile.tabs.length === 1) return;
        
        const newTabs = [...drile.tabs];
        newTabs.splice(index, 1);
        
        drile.tabs = newTabs;
        
        if (index <= drill.activeTabIndex) {
            drile.activeTabIndex = Math.min(drile.activeTabIndex, drile.tabs.length - 1);
            drile.currentPath = drile.tabs[drile.activeTabIndex].path;
            loadDirectory(drile.currentPath);
        }
    }
    
    // Handling file clicks
    function handleFileClick(file, mouse) {
        if (mouse.button === Qt.RightButton) {
            showContextMenu(mouse.x, mouse.y);
            return;
        }
        
        if (mouse.modifiers & Qt.ControlModifier || mouse.modifiers & Qt.ShiftModifier) {
            //Multiple choice
            if (selectedFiles.some(f => f.path === file.path)) {
                selectedFiles = selectedFiles.filter(f => f.path!== file.path);
            } else {
                selectedFiles = [...selectedFiles, file];
            }
        } else {
            // One choice
            if (selectedFiles.length === 1 && selectedFiles[0].path === file.path) {
                // Click on an already selected file
                if (file.isDirectory) {
                    currentPath = file.path;
                    loadDirectory(currentPath);
                } else {
                    openFile(file.path);
                }
            } else {
                selectedFiles = [file];
            }
        }
        
        updateUI();
    }
    
    // Display context menu
    function showContextMenu(x, y) {
        contextMenuPos = ({x: x, y: y});
        contextMenuVisible = true;
        
        // Update list items based on selection
        updateContextMenuItems();
    }
    
    // Update context menu items
    function updateContextMenuItems() {
        if(selectedFiles.length === 0) {
            contextMenuItems = [
                {icon: "\uf067", text: "paste", action: "paste"},
                {icon: "\uf07b", text: "new folder", action: "new_folder"},
                {icon: "\uf0c2", text: "file mining", action: "search"}
            ];
        } else if (selectedFiles.length === 1) {
            const file = selectedFiles[0];
            contextMenuItems = [
                {icon: "\uf0c5", text: "open", action: "open"},
                {icon: "\uf07c", text: "Open with...", action: "open_with"},
                {icon: "\uf0c5", text: "Open in new window", action: "open_in_new_window"},
                {icon: "\uf0c8", text: "cut", action: "cut"},
                {icon: "\uf0ea", text: "copy", action: "copy"},
                {icon: "\uf24d", text: "rename", action: "rename"},
                {icon: "\uf0c4", text: "properties", action: "properties"},
                {icon: "\uf1f8", text: "Send to", action: "send_to"},
                {icon: "\uf1f6", text: "Create shortcut", action: "create_shortcut"},
                {icon: "\uf1f8", text: "Send to Recycle Bin", action: "move_to_trash"}
            ];
        } else {
            contextMenuItems = [
                {icon: "\uf0c8", text: "cut", action: "cut"},
                {icon: "\uf0ea", text: "copy", action: "copy"},
                {icon: "\uf1f8", text: "Send to Recycle Bin", action: "move_to_trash"}
            ];
        }
    }
    
    // Implement the context menu item
    function executeContextMenuItem(item) {
        switch (item.action) {
            case "open":
                if(selectedFiles.length === 1) {
                    if (selectedFiles[0].isDirectory) {
                        currentPath = selectedFiles[0].path;
                        loadDirectory(currentPath);
                    } else {
                        openFile(selectedFiles[0].path);
                    }
                }
                break;
                
            case "open_with":
                //will be applied in future versions
                showToast("'Open with...' feature Under development", "\uf071");
                break;
                
            case "open_in_new_window":
                //will be applied in future versions
                showToast("The 'Open in New Window' feature is under development", "\uf071");
                break;
                
            case "cut":
                clipboard = [...selectedFiles];
                clipboardAction = "cut";
                showToast(`Cut ${selectedFiles.length} element(s)`, "\uf0c8");
                break;
                
            case "copy":
                clipboard = [...selectedFiles];
                clipboardAction = "copy";
                showToast(`Copy ${selectedFiles.length} element(s)`, "\uf0ea");
                break;
                
            case "paste":
                if (clipboard) {
                    pasteFiles();
                }
                break;
                
            case "rename":
                if(selectedFiles.length === 1) {
                    //will be applied in future versions
                    showToast("The 'rename' feature is under development", "\uf071");
                }
                break;
                
            case "properties":
                if(selectedFiles.length === 1) {
                    //will be applied in future versions
                    showToast("The 'Properties' feature is under development", "\uf071");
                }
                break;
                
            case "send_to":
                //will be applied in future versions
                showToast("'Send to' feature under development", "\uf071");
                break;
                
            case "create_shortcut":
                //will be applied in future versions
                showToast("The 'Create Shortcut' feature is under development", "\uf071");
                break;
                
            case "move_to_trash":
                moveToTrash();
                break;
                
            case "new_folder":
                createNewFolder();
                break;
                
            case "search":
                //will be applied in future versions
                showToast("'File mining' feature under development", "\uf071");
                break;
        }
    }
    
    // Paste files
    function pasteFiles() {
        try {
            for (const file of clipboard) {
                if(clipboardAction === "cut") {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("mv", [file.path, currentPath + "/" + file.name]);
                    process.waitForFinished(500);
                } else if (clipboardAction === "copy") {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("cp", ["-r", file.path, currentPath + "/" + file.name]);
                    process.waitForFinished(500);
                }
            }
            
            clipboard = null;
            clipboardAction = "";
            loadDirectory(currentPath);
            showToast(`Done ${clipboardAction === "cut" ? "transfer": "copy"} items successfully`, "\uf00c");
        } catch(e) {
            console.error("Failed to paste files:", e);
            showToast("Failed to paste files", "\uf071");
        }
    }
    
    // Move files to the Recycle Bin
    function moveToTrash() {
        try {
            for (const file of selectedFiles) {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                process.start("gio", ["trash", file.path]);
                process.waitForFinished(500);
            }
            
            selectedFiles = [];
            loadDirectory(currentPath);
            showToast(`${selectedFiles.length} item(s) moved to Recycle Bin`, "\uf1f8");
        } catch(e) {
            console.error("Failed to transfer files to Recycle Bin:", e);
            showToast("Failed to move files to Recycle Bin", "\uf071");
        }
    }
    
    // Create a new folder
    function createNewFolder() {
        try {
            const folderName = "New Folder";
            let counter = 2;
            let name = folderName;
            
            // Ensure the name is unique
            while (files.some(f => f.name === name)) {
                name = `${folderName} ${counter}`;
                counter++;
            }
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("mkdir", [currentPath + "/" + name]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                loadDirectory(currentPath);
                showToast(`${name}" was created successfully`, "\uf07b");
            } else {
                showToast("Failed to create folder", "\uf071");
            }
        } catch(e) {
            console.error("Failed to create folder:", e);
            showToast("Failed to create folder", "\uf071");
        }
    }
    
    // Get the device list
    function getDevices() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("lsblk", ["-o", "NAME, SIZE,MOUNTPOINT", "-b", "-J"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const data = JSON.parse(output);
                
                const devices = [];
                for (const blockdevice of data.blockdevices) {
                    if (blockdevice.mountpoint) {
                        devices.push({
                            name: blockdevice.name,
                            size: blockdevice.size,
                            mountPoint: blockdevice.mountpoint,
                            icon: "\uf0a0"
                        });
                    }
                }
                
                return devices;
            }
        } catch(e) {
            console.error("Failed to fetch devices:", e);
        }
        
        return [];
    }
    
    // Format file size
    function formatFileSize(bytes) {
        if (bytes === 0) return "0 B";
        
        const k = 1024;
        const sizes = ["B", "KB", "MB", "GB", "TB"];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
    }
    
    // Date format
    function formatDate(dateString) {
        // In this simple version, we will return the string as is
        return dateString;
    }
    
    // Display notification
    function showToast(message, icon) {
        //will be applied in future versions
        console.log(`Toast: ${message}`);
    }
    
    //====================
    // Appearance and disappearance animations
    //====================
    
    // Appearance animation
    OpacityAnimation {
        id: fadeInAnimation
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    //Disappearance Animation
    OpacityAnimation {
        id: fadeOutAnimation
        from: 1
        to: 0
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    //====================
    // Data and calculations
    //====================
    // List of context menu items
    property var contextMenuItems: []
    
    // Filtered files
    property var filteredFiles: {
        if(searchQuery) {
            return files.filter(file => 
                file.name.toLowerCase().includes(searchQuery.toLowerCase())
            );
        }
        return files;
    }
    
    //====================
    // Handling shortcuts
    //====================
    Keys.onPressed: {
        // Shortcut Ctrl+N to create a new folder
        if (event.key === Qt.Key_N && event.modifiers & Qt.ControlModifier) {
            createNewFolder();
            event.accepted = true;
        }
        
        // Abbreviation Ctrl + C to copy
        if (event.key === Qt.Key_C && event.modifiers & Qt.ControlModifier) {
            if (selectedFiles.length > 0) {
                clipboard = [...selectedFiles];
                clipboardAction = "copy";
                showToast(`Copy ${selectedFiles.length} element(s)`, "\uf0ea");
            }
            event.accepted = true;
        }
        
        //Ctrl+X shortcut to cut
        if (event.key === Qt.Key_X && event.modifiers & Qt.ControlModifier) {
            if (selectedFiles.length > 0) {
                clipboard = [...selectedFiles];
                clipboardAction = "cut";
                showToast(`Cut ${selectedFiles.length} element(s)`, "\uf0c8");
            }
            event.accepted = true;
        }
        
        // Ctrl+V shortcut to paste
        if (event.key === Qt.Key_V && event.modifiers & Qt.ControlModifier) {
            if (clipboard) {
                pasteFiles();
            }
            event.accepted = true;
        }
        
        // Delete shortcut to delete
        if (event.key === Qt.Key_Delete) {
            if (selectedFiles.length > 0) {
                moveToTrash();
            }
            event.accepted = true;
        }
        
        // F2 shortcut for renaming
        if (event.key === Qt.Key_F2) {
            if(selectedFiles.length === 1) {
                //will be applied in future versions
                showToast("The 'rename' feature is under development", "\uf071");
            }
            event.accepted = true;
        }
        
        // F5 shortcut to update
        if (event.key === Qt.Key_F5) {
            loadDirectory(currentPath);
            event.accepted = true;
        }
        
        // Shortcut Alt + ← to return
        if (event.key === Qt.Key_Left && event.modifiers & Qt.AltModifier) {
            goBack();
            event.accepted = true;
        }
        
        // Abbreviation Alt + → for progress
        if (event.key === Qt.Key_Right && event.modifiers & Qt.AltModifier) {
            goForward();
            event.accepted = true;
        }
        
        // Shortcut Ctrl+T to open a new tab
        if (event.key === Qt.Key_T && event.modifiers & Qt.ControlModifier) {
            addNewTab();
            event.accepted = true;
        }
        
        // Ctrl+W shortcut to close the tab
        if (event.key === Qt.Key_W && event.modifiers & Qt.ControlModifier) {
            if(tabs.length > 1) {
                closeTab(activeTabIndex);
            }
            event.accepted = true;
        }
        
        // Ctrl+Q shortcut to close the file manager
        if (event.key === Qt.Key_Q && event.modifiers & Qt.ControlModifier) {
            closeDrile();
            event.accepted = true;
        }
    }
    
    //=======
    // Configuration
    //=======
    Component.onCompleted: {
        // Download the current directory
        loadDirectory(currentPath);
        
        // Set default context menu items
        updateContextMenuItems();
    }
}
EOL

# =========================
# QuickShell Resource File
# =========================
echo "--------------------------
echo "(4/5) Configure resources..."
cat <<EOL > ~/.config/QuickShell/resources.qrc
<RCC>
    <qresource prefix="/">
        <!-- OTF -->
        <file alias="fa-solid-900.otf">fonts/fa-solid-900.otf</file>
        <file alias="fa-regular-400.otf">fonts/fa-regular-400.otf</file>
        <file alias="fa-brands-400.otf">fonts/fa-brands-400.otf</file>
	    <file alias="IBM-Plex-Sans-Thin.ttf">fonts/IBM-Plex-Sans-Thin.ttf</file>
	    <file alias="IBM-Plex-Sans-Bold.ttf">fonts/IBM-Plex-Sans-Bold.ttf</file>

        <!-- JPG -->
        <file alias="wallpaper1.jpg">images/wallpaper1.jpg</file>
	    <file alias="wallpaper2.jpg">images/wallpaper2.jpg</file>
	    <file alias="wallpaper3.jpg">images/wallpaper3.jpg</file>
        <file alias="wallpaper4.jpg">images/wallpaper4.jpg</file>
        <file alias="wallpaper5.jpg">images/wallpaper5.jpg</file>
        <file alias="wallpaper6.jpg">images/wallpaper6.jpg</file>
        <file alias="wallpaper7.jpg">images/wallpaper7.jpg</file>
        <file alias="wallpaper8.jpg">images/wallpaper8.jpg</file>
        <file alias="wallpaper0.jpg">images/wallpaper9.jpg</file>
        <file alias="wallpaper10.jpg">images/wallpaper10.jpg</file>

        <!-- JSON -->
        <file alias="settings.json">data/settings.json</file>

        <!-- QML -->
        <file alias="shell.qml">qml/shell.qml</file>
        <file alias="settingsapp.qml">qml/settingsapp.qml</file>
        <file alias="welcome.qml">qml/drile.qml</file>
     	<file alias="welcome.qml">qml/welcome.qml</file>

        <!-- Docs -->
        <file alias="README.md">docs/README.md</file>
        <file alias="LICENSE">docs/LICENSE</file>
    </qresource>
</RCC>
EOL

# =============================
# Building the System with C++
# =============================
echo "-----------------------------
echo "(5/5) Building a system using C++..."

cat <<EOL > ~/src/quickshell/main.cpp
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QtQuickControls2>

#include "cpp/GlassMorphismEffect.h"
#include "cpp/QuickShellAnimation.h"
#include "cpp/QuickShellEffects.h"
#include "cpp/QuickShellSystem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setOrganizationName("Desind");
    QCoreApplication::setApplicationName("QuickShell");

    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;

    qmlRegisterType<GlassMorphismEffect>("QuickShell.Effects", 1, 0, "GlassMorphismEffect");
    qmlRegisterType<QuickShellAnimation>("QuickShell.Animation", 1, 0, "QuickShellAnimation");
    qmlRegisterType<QuickShellEffects>("QuickShell.Effects", 1, 0, "QuickShellEffects");
    qmlRegisterType<QuickShellSystem>("QuickShell.System", 1, 0, "QuickShellSystem");

    engine.addImportPath("qrc:/");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
EOL

cat <<EOL > ~/.config/QuickShell/CMakeLists.txt
cmake_minimum_required(VERSION 3.16)
project(QuickShellPlugins)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Core Quick REQUIRED)

add_library(QuickShellPlugins SHARED
    src/quickshell/main.cpp
    src/quickshell/QuickShellPlugin.cpp
    src/quickshell/animation/QuickShellAnimation.h
    src/quickshell/animation/QuickShellAnimation.cpp
    src/quickshell/effects/QuickShellEffects.h
    src/quickshell/effects/QuickShellEffects.cpp
    src/quickshell/effects/GlassMorphismEffect.h
    src/quickshell/effects/GlassMorphismEffect.cpp
    src/quickshell/system/QuickShellSystem.h
    src/quickshell/system/QuickShellSystem.cpp
)

target_include_directories(QuickShellPlugins PRIVATE
    src/quickshell
)

target_link_libraries(QuickShellPlugins
    PRIVATE
        Qt6::Core
        Qt6::Quick
)

install(TARGETS QuickShellPlugins
    LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/plugins/quickshell
)
EOL

cat <<EOL > ~/src/quickshell/animation/QuickShellAnimation.h
#ifndef QUICKSHELLANIMATION_H
#define QUICKSHELLANIMATION_H

#include <QObject>
#include <QQuickItem>
#include <QElapsedTimer>
#include <QVariantAnimation>
#include <QQuickWindow>
#include <QOpenGLFunctions>
#include <QVector>
#include <memory>
#include <atomic>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <functional>
#include <unordered_map>
#include <QQuickWindow>
#include <QOpenGLContext>
#include <QOpenGLShaderProgram>
#include <QOpenGLBuffer>
#include <QOpenGLVertexArrayObject>

class QuickShellAnimation: public QObject, protected QOpenGLFunctions {
    Q_OBJECT
    Q_PROPERTY(qreal animationDuration READ animationDuration WRITE setAnimationDuration NOTIFY animationDurationChanged)
    Q_PROPERTY(qreal animationEasing READ animationEasing WRITE setAnimationEasing NOTIFY animationEasingChanged)
    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    
public:
    explicit QuickShellAnimation(QObject *parent = nullptr);
    ~QuickShellAnimation();
    
    // Management functions
    Q_INVOKABLE void startAnimation(QObject *target, const QString &property, qreal from, qreal to, int duration = -1);
    Q_INVOKABLE void stopAnimation(QObject *target, const QString &property);
    Q_INVOKABLE void stopAllAnimations();
    Q_INVOKABLE bool isAnimating(QObject *target, const QString &property) const;
    
    //Animation settings
    qreal animationDuration() const { return m_animationDuration; }
    void setAnimationDuration(qreal duration);
    
    qreal animationEasing() const { return m_animationEasing; }
    void setAnimationEasing(qreal easing);
    
    bool enabled() const { return m_enabled; }
    void setEnabled(bool enabled);
    
    // Performance improvement functions
    Q_INVOKABLE void setHighPerformanceMode(bool enabled);
    Q_INVOKABLE void setVSyncEnabled(bool enabled);
    Q_INVOKABLE void setAnimationQuality(int quality); // 0-100
    
    // Advanced Jobs
    Q_INVOKABLE void registerCustomEasing(const QString &name, std::function<qreal(qreal)> evaluatingFunction);
    Q_INVOKABLE void animateWithCustomEasing(QObject *target, const QString &property, qreal from, qreal to, int duration, const QString &easingName);
    
signals:
    void animationDurationChanged();
    void animationEasingChanged();
    void enabledChanged();
    void animationStarted(QObject *target, const QString &property);
    void animationStopped(QObject *target, const QString &property);
    void animationProgress(QObject *target, const QString &property, qreal progress);
    
private slots:
    void handleWindowBeforeRendering();
    
private:
    struct Animation {
        QObject *target;
        QString property;
        qreal from;
        qreal to;
        int duration;
        int startTime;
        std::function<qreal(qreal)> easingFunction;
        bool active;
    };
    
    void initializeOpenGL();
    void cleanupOpenGL();
    void renderAnimations();
    void processAnimations();
    qreal calculateEasing(qreal progress, int evaluatingType) const;
    void updateTargetProperty(Animation &anim, qreal value);
    
    qreal m_animationDuration;
    qreal m_animationEasing;
    bool m_enabled;
    bool m_highPerformanceMode;
    bool m_vSyncEnabled;
    int m_animationQuality;
    
    QQuickWindow *m_window;
    std::vector<Animation> m_animations;
    std::unordered_map<QString, std::function<qreal(qreal)>> m_customEasings;
    
    // OpenGL resources
    QOpenGLShaderProgram *m_shaderProgram;
    QOpenGLBuffer *m_vertexBuffer;
    QOpenGLVertexArrayObject *m_vao;
    
    std::thread m_animationThread;
    std::atomic<bool> m_running;
    std::mutex m_mutex;
    std::condition_variable m_condition;
};

#endif // QUICKSHELLANIMATION_H
EOL

cat <<EOL > ~/src/quickshell/animation/QuickShellAnimation.cpp
#include "QuickShellAnimation.h"
#include <QQuickItem>
#include <QQuickWindow>
#include <QOpenGLContext>
#include <QOpenGLFunctions>
#include <QOpenGLShaderProgram>
#include <QOpenGLBuffer>
#include <QOpenGLVertexArrayObject>
#include <QElapsedTimer>
#include <QDebug>
#include <cmath>
#include <algorithm>
#include <chrono>
#include <thread>

QuickShellAnimation::QuickShellAnimation(QObject *parent)
    : QObject(parent),
      m_animationDuration(100),
      m_animationEasing(2), //Easing.OutQuart
      m_enabled(true),
      m_highPerformanceMode(false),
      m_vSyncEnabled(true),
      m_animationQuality(100),
      m_window(nullptr),
      m_shaderProgram(nullptr),
      m_vertexBuffer(nullptr),
      m_vao(nullptr),
      m_running(false)
{
    // Detect the main QML window
    for (QWindow *window : QGuiApplication::topLevelWindows()) {
        if (QQuickWindow *quickWindow = qobject_cast<QQuickWindow*>(window)) {
            m_window = quickWindow;
            break;
        }
    }
    
    if(m_window) {
        m_window->beforeRendering.connect(this, &QuickShellAnimation::handleWindowBeforeRendering, Qt::DirectConnection);
    }
    
    // Register default facilitation functions
    registerCustomEasing("linear", [](qreal t) { return t; });
    registerCustomEasing("easeInQuad", [](qreal t) { return t * t; });
    registerCustomEasing("easeOutQuad", [](qreal t) { return t * (2 - t); });
    registerCustomEasing("easeInOutQuad", [](qreal t) { return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t; });
    registerCustomEasing("easeInCubic", [](qreal t) { return t * t * t; });
    registerCustomEasing("easeOutCubic", [](qreal t) { return (--t) * t * t + 1; });
    registerCustomEasing("easeInOutCubic", [](qreal t) { return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1; });
    registerCustomEasing("easeInQuart", [](qreal t) { return t * t * t * t; });
    registerCustomEasing("easeOutQuart", [](qreal t) { return 1 - (--t) * t * t * t; });
    registerCustomEasing("easeInOutQuart", [](qreal t) { 
        return t < 0.5 ? 8 * t * t * t * t: 1 - 8 * (--t) * t * t * t; 
    });
    
    // Start the processing thread
    m_running = true;
    m_animationThread = std::thread([this]() {
        QElapsedTimer timer;
        while (m_running) {
            timer.start();
            
            {
                std::unique_lock<std::mutex> lock(m_mutex);
                m_condition.wait_for(lock, std::chrono::milliseconds(1));
            }
            
            processAnimations();
            
            // Maintain 5ms refresh cycle (200 fps)
            int elapsed = timer.elapsed();
            if (elapsed < 5 && m_highPerformanceMode) {
                QThread::usleep((5 - elapsed) * 1000);
            }
        }
    });
}

QuickShellAnimation::~QuickShellAnimation() {
    m_running = false;
    m_condition.notify_one();
    if (m_animationThread.joinable()) {
        m_animationThread.join();
    }
    
    if(m_window) {
        m_window->beforeRendering.disconnect(this);
    }
    
    cleanupOpenGL();
}

void QuickShellAnimation::setAnimationDuration(qreal duration) {
    if (qFuzzyCompare(m_animationDuration, duration))
        return;
    
    m_animationDuration = duration;
    emit animationDurationChanged();
}

void QuickShellAnimation::setAnimationEasing(qreal easing) {
    if (qFuzzyCompare(m_animationEasing, easing))
        return;
    
    m_animationEasing = easing;
    emit animationEasingChanged();
}

void QuickShellAnimation::setEnabled(bool enabled) {
    if (m_enabled == enabled)
        return;
    
    m_enabled = enabled;
    emit enabledChanged();
}

void QuickShellAnimation::setHighPerformanceMode(bool enabled) {
    m_highPerformanceMode = enabled;
}

void QuickShellAnimation::setVSyncEnabled(bool enabled) {
    m_vSyncEnabled = enabled;
    if(m_window) {
        m_window->setVSyncEnabled(enabled);
    }
}

void QuickShellAnimation::setAnimationQuality(int quality) {
    m_animationQuality = qBound(0, quality, 100);
}

void QuickShellAnimation::startAnimation(QObject *target, const QString &property, qreal from, qreal to, int duration) {
    if(!m_enabled || !target)
        return;
    
    if (duration == -1)
        duration = m_animationDuration;
    
    // Stop any animation based on the same property
    stopAnimation(target, property);
    
    Animation anim;
    anim.target = target;
    anim.property = property;
    anim.from = from;
    anim.to = to;
    anim.duration = duration;
    anim.startTime = QDateTime::currentMSecsSinceEpoch();
    anim.easingFunction = [this](qreal t) {
        return calculateEasing(t, m_animationEasing);
    };
    anim.active = true;
    
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_animations.push_back(anim);
    }
    
    emit animationStarted(target, property);
}

void QuickShellAnimation::stopAnimation(QObject*target, const QString&property) {
    std::lock_guard<std::mutex> lock(m_mutex);
    
    auto it = std::remove_if(m_animations.begin(), m_animations.end(),
        [target, &property](const Animation &anim) {
            return anim.target == target && anim.property == property;
        });
    
    if(it!= m_animations.end()) {
        m_animations.erase(it, m_animations.end());
        emit animationStopped(target, property);
    }
}

void QuickShellAnimation::stopAllAnimations() {
    std::lock_guard<std::mutex> lock(m_mutex);
    m_animations.clear();
}

bool QuickShellAnimation::isAnimating(QObject *target, const QString &property) const {
    std::lock_guard<std::mutex> lock(m_mutex);
    
    for (const auto &anim: m_animations) {
        if (anim.target == target && anim.property == property && anim.active) {
            return true;
        }
    }
    
    return false;
}

void QuickShellAnimation::registerCustomEasing(const QString &name, std::function<qreal(qreal)> evaluatingFunction) {
    m_customEasings[name] = easingFunction;
}

void QuickShellAnimation::animateWithCustomEasing(QObject *target, const QString &property, qreal from, qreal to, int duration, const QString &easingName) {
    if(!m_enabled || !target || m_customEasings.find(easingName) == m_customEasings.end())
        return;
    
    Animation anim;
    anim.target = target;
    anim.property = property;
    anim.from = from;
    anim.to = to;
    anim.duration = duration;
    anim.startTime = QDateTime::currentMSecsSinceEpoch();
    anim.easingFunction = m_customEasings[easingName];
    anim.active = true;
    
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        m_animations.push_back(anim);
    }
    
    emit animationStarted(target, property);
}

void QuickShellAnimation::handleWindowBeforeRendering() {
    if(!m_enabled)
        return;
    
    // Processing animations in this context
    processAnimations();
    
    // If the quality is less than 100, we use OpenGL for effects
    if (m_animationQuality < 100 && m_window && m_window->openglContext()) {
        initializeOpenGL();
        renderAnimations();
    }
}

void QuickShellAnimation::initializeOpenGL() {
    if (m_shaderProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    // Create a shader program
    m_shaderProgram = new QOpenGLShaderProgram();
    m_shaderProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    words = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_shaderProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform float opacity;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    vec4 color = texture2D(source, chords);\n"
        "    gl_FragColor = vec4(color.rgb, color.a * opacity);\n"
        "}\n");
    
    m_shaderProgram->bindAttributeLocation("vertices", 0);
    m_shaderProgram->link();
    m_shaderProgram->bind();
    
    // Create stores
    m_vertexBuffer = new QOpenGLBuffer(QOpenGLBuffer::VertexBuffer);
    m_vertexBuffer->create();
    m_vertexBuffer->bind();
    
    // Create a list array object
    m_vao = new QOpenGLVertexArrayObject();
    if (m_vao->create())
        m_vao->bind();
}

void QuickShellAnimation::cleanupOpenGL() {
    if(m_vao) {
        m_vao->destroy();
        delete m_vao;
        m_vao = nullptr;
    }
    
    if (m_vertexBuffer) {
        m_vertexBuffer->destroy();
        delete m_vertexBuffer;
        m_vertexBuffer = nullptr;
    }
    
    if(m_shaderProgram) {
        delete m_shaderProgram;
        m_shaderProgram = nullptr;
    }
}

void QuickShellAnimation::renderAnimations() {
    if(!m_shaderProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    // Calculate visual effects
    float opacity = m_animationQuality / 100.0f;
    
    // Apply effects
    m_shaderProgram->bind();
    m_shaderProgram->setUniformValue("opacity", opacity);
    
    //Draw effects
    m_window->openglContext()->functions()->glEnable(GL_BLEND);
    m_window->openglContext()->functions()->glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    // ... Implementation details of drawing effects
    
    m_window->openglContext()->functions()->glDisable(GL_BLEND);
    m_shaderProgram->release();
}

void QuickShellAnimation::processAnimations() {
    if(!m_enabled)
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    std::vector<Animation> completedAnimations;
    
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        
        for (auto &anim: m_animations) {
            if(!anim.active)
                continue;
            
            qint64 elapsed = currentTime - anim.startTime;
            if (elapsed >= anim.duration) {
                //Animation completed
                updateTargetProperty(anim, anim.to);
                anim.active = false;
                completedAnimations.push_back(anim);
                continue;
            }
            
            //Progress account
            qreal progress = static_cast<qreal>(elapsed)/anim.duration;
            qreal evaluatedProgress = anim.easingFunction ? anim.easingFunction(progress) : progress;
            qreal value = anim.from + (anim.to - anim.from) * evaluatedProgress;
            
            // Update property
            updateTargetProperty(anim, value);
            
            emit animationProgress(anim.target, anim.property, evaluatedProgress);
        }
        
        // Clean up completed animations
        m_animations.erase(
            std::remove_if(m_animations.begin(), m_animations.end(),
                [](const Animation &anim) { return!anim.active; }),
            m_animations.end()
        );
    }
    
    // Send signals to complete animations
    for (const auto &anim: completedAnimations) {
        emit animationStopped(anim.target, anim.property);
    }
}

qreal QuickShellAnimation::calculateEasing(qreal progress, int easingType) const {
    switch (easingType) {
    case 0: // Linear
        return progress;
    case 1: // EaseInQuad
        return progress * progress;
    case 2: // EaseOutQuad
        return progress * (2 - progress);
    case 3: // EaseInOutQuad
        return progress < 0.5 ? 2 * progress * progress : -1 + (4 - 2 * progress) * progress;
    case 4: // EaseInCubic
        return progress * progress * progress;
    case 5: // EaseOutCubic
        return (--progress) * progress * progress + 1;
    case 6: // EaseInOutCubic
        return progress < 0.5 ? 4 * progress * progress * progress : (progress - 1) * (2 * progress - 2) * (2 * progress - 2) + 1;
    case 7: // EaseInQuart
        return progress * progress * progress * progress;
    case 8: // EaseOutQuart
        return 1 - (--progress) * progress * progress * progress;
    case 9: // EaseInOutQuart
        return progress < 0.5 ? 8 * progress * progress * progress * progress: 1 - 8 * (--progress) * progress * progress * progress;
    default:
        return progress;
    }
}

void QuickShellAnimation::updateTargetProperty(Animation&anim, qreal value) {
    if (QQuickItem *item = qobject_cast<QQuickItem*>(anim.target)) {
        if (anim.property == "x") {
            item->setX(value);
        } else if (anim.property == "y") {
            item->setY(value);
        } else if (anim.property == "width") {
            item->setWidth(value);
        } else if (anim.property == "height") {
            item->setHeight(value);
        } else if (anim.property == "scale") {
            item->setScale(value);
        } else if (anim.property == "rotation") {
            item->setRotation(value);
        } else if (anim.property == "opacity") {
            item->setOpacity(value);
        }
    } else {
        anim.target->setProperty(anim.property.toUtf8(), value);
    }
}
EOL

cat <<EOL > ~/src/quickshell/effects/QuickShellEffects.h
#ifndef QUICKSHELLEFFECTS_H
#define QUICKSHELLEFFECTS_H

#include <QObject>
#include <QQuickItem>
#include <QOpenGLFunctions>
#include <QOpenGLShaderProgram>
#include <QOpenGLBuffer>
#include <QOpenGLVertexArrayObject>
#include <QVector2D>
#include <QVector3D>
#include <QVector4D>
#include <QColor>
#include <QElapsedTimer>
#include <QTimer>
#include <QVariant>
#include <QJSValue>

class QuickShellEffects : public QObject, protected QOpenGLFunctions {
    Q_OBJECT
    Q_PROPERTY(qreal blurRadius READ blurRadius WRITE setBlurRadius NOTIFY blurRadiusChanged)
    Q_PROPERTY(qreal opacity READ opacity WRITE setOpacity NOTIFY opacityChanged)
    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    
public:
    explicit QuickShellEffects(QObject *parent = nullptr);
    ~QuickShellEffects();
    
    // Effects properties
    qreal blurRadius() const { return m_blurRadius; }
    void setBlurRadius(qreal radius);
    
    qreal opacity() const { return m_opacity; }
    void setOpacity(qreal opacity);
    
    bool enabled() const { return m_enabled; }
    void setEnabled(bool enabled);
    
    QColor backgroundColor() const { return m_backgroundColor; }
    void setBackgroundColor(const QColor &color);
    
    //Special effects
    Q_INVOKABLE void applySmoothBlur(QQuickItem *item, qreal radius = -1, qreal opacity = -1);
    Q_INVOKABLE void applyEyeFriendlyGlow(QQuickItem *item, const QColor &color, qreal intensity = 1.0);
    Q_INVOKABLE void applyDynamicIslandEffect(QQuickItem *item, bool isExpanded = false);
    Q_INVOKABLE void applyWaterRippleEffect(QQuickItem *item, const QPointF & center, qreal maxRadius = 100);
    Q_INVOKABLE void applySmoothTransition(QQuickItem *source, QQuickItem *target, qreal duration = 300);
    
    // Resource management
    Q_INVOKABLE void optimizeEffectsForPerformance();
    Q_INVOKABLE void optimizeEffectsForQuality();
    Q_INVOKABLE void setEffectQuality(int quality); // 0-100
    
    //Advanced effects
    Q_INVOKABLE void startPulseAnimation(QQuickItem *item, const QColor &color, int duration = 1000, int interval = 2000);
    Q_INVOKABLE void stopPulseAnimation(QQuickItem *item);
    Q_INVOKABLE void startBreathingAnimation(QQuickItem *item, qreal minScale = 0.95, qreal maxScale = 1.05, int duration = 3000);
    Q_INVOKABLE void stopBreathingAnimation(QQuickItem *item);
    
signals:
    void blurRadiusChanged();
    void opacityChanged();
    void enabledChanged();
    void backgroundColorChanged();
    void effectApplied(QQuickItem *item, const QString &effectType);
    
private slots:
    void handleWindowBeforeRendering();
    void handlePulseAnimations();
    void handleBreathingAnimations();
    
private:
    struct BlurEffect {
        QQuickItem *item;
        qreal radius;
        qreal opacity;
        bool active;
    };
    
    struct PulseEffect {
        QQuickItem *item;
        QColor color;
        int duration;
        int interval;
        QElapsedTimer timer;
        bool active;
    };
    
    struct BreathingEffect {
        QQuickItem *item;
        qreal minScale;
        qreal maxScale;
        int duration;
        QElapsedTimer timer;
        bool active;
    };
    
    void initializeOpenGL();
    void cleanupOpenGL();
    void renderEffects();
    void renderBlurEffect(const BlurEffect &effect);
    void renderPulseEffect(const PulseEffect &effect);
    void renderBreathingEffect(const BreathingEffect &effect);
    
    qreal m_blurRadius;
    qreal m_opacity;
    bool m_enabled;
    QColor m_backgroundColor;
    int m_effectQuality;
    
    QQuickWindow *m_window;
    std::vector<BlurEffect> m_blurEffects;
    std::vector<PulseEffect> m_pulseEffects;
    std::vector<BreathingEffect> m_breathingEffects;
    
    // OpenGL resources
    QOpenGLShaderProgram *m_blurProgram;
    QOpenGLShaderProgram *m_pulseProgram;
    QOpenGLShaderProgram *m_breathingProgram;
    QOpenGLBuffer *m_vertexBuffer;
    QOpenGLVertexArrayObject *m_vao;
    
    QTimer m_pulseTimer;
    QTimer m_breathingTimer;
};

#endif // QUICKSHELLEFFECTS_H
EOL

cat <<EOL > ~/src/quickshell/effects/QuickShellEffects.cpp
#include "QuickShellEffects.h"
#include <QQuickItem>
#include <QQuickWindow>
#include <QOpenGLContext>
#include <QOpenGLFunctions>
#include <QOpenGLShaderProgram>
#include <QOpenGLBuffer>
#include <QOpenGLVertexArrayObject>
#include <QElapsedTimer>
#include <QDebug>
#include <cmath>
#include <algorithm>
#include <QTimer>

QuickShellEffects::QuickShellEffects(QObject *parent)
    : QObject(parent),
      m_blurRadius(32.0),
      m_opacity(0.8),
      m_enabled(true),
      m_backgroundColor(Qt::black),
      m_effectQuality(90),
      m_window(nullptr),
      m_blurProgram(nullptr),
      m_pulseProgram(nullptr),
      m_breathingProgram(nullptr),
      m_vertexBuffer(nullptr),
      m_vao(nullptr)
{
    // Detect the main QML window
    for (QWindow *window : QGuiApplication::topLevelWindows()) {
        if (QQuickWindow *quickWindow = qobject_cast<QQuickWindow*>(window)) {
            m_window = quickWindow;
            break;
        }
    }
    
    if(m_window) {
        m_window->beforeRendering.connect(this, &QuickShellEffects::handleWindowBeforeRendering, Qt::DirectConnection);
    }
    
    //Set timers
    m_pulseTimer.setInterval(16); // 60 frames per second
    m_pulseTimer.setSingleShot(false);
    connect(&m_pulseTimer, &QTimer::timeout, this, &QuickShellEffects::handlePulseAnimations);
    
    m_breathingTimer.setInterval(16);
    m_breathingTimer.setSingleShot(false);
    connect(&m_breathingTimer, &QTimer::timeout, this, &QuickShellEffects::handleBreathingAnimations);
}

QuickShellEffects::~QuickShellEffects() {
    if(m_window) {
        m_window->beforeRendering.disconnect(this);
    }
    
    cleanupOpenGL();
}

void QuickShellEffects::setBlurRadius(qreal radius) {
    if (qFuzzyCompare(m_blurRadius, radius))
        return;
    
    m_blurRadius = radius;
    emit blurRadiusChanged();
}

void QuickShellEffects::setOpacity(qreal opacity) {
    if (qFuzzyCompare(m_opacity, opacity))
        return;
    
    m_opacity = qBound(0.0, opacity, 1.0);
    emit opacityChanged();
}

void QuickShellEffects::setEnabled(bool enabled) {
    if (m_enabled == enabled)
        return;
    
    m_enabled = enabled;
    if(!m_enabled) {
        m_blurEffects.clear();
        m_pulseEffects.clear();
        m_breathingEffects.clear();
    }
    emit enabledChanged();
}

void QuickShellEffects::setBackgroundColor(const QColor &color) {
    if (m_backgroundColor == color)
        return;
    
    m_backgroundColor = color;
    emit backgroundColorChanged();
}

void QuickShellEffects::applySmoothBlur(QQuickItem *item, qreal radius, qreal opacity) {
    if(!m_enabled || !item)
        return;
    
    if (radius < 0) radius = m_blurRadius;
    if (opacity < 0) opacity = m_opacity;
    
    // Remove any existing blur effect
    for (auto &effect: m_blurEffects) {
        if (effect.item == item) {
            effect.radius = radius;
            effect.opacity = opacity;
            effect.active = true;
            return;
        }
    }
    
    // Add a new blur effect
    BlurEffect effect;
    effect.item = item;
    effect.radius = radius;
    effect.opacity = opacity;
    effect.active = true;
    m_blurEffects.push_back(effect);
    
    emit effectApplied(item, "blur");
}

void QuickShellEffects::applyEyeFriendlyGlow(QQuickItem *item, const QColor &color, qreal intensity) {
    if(!m_enabled || !item)
        return;
    
    // Here you can add logic for the eye-pleasing visible light effect
    // A light blur effect with a custom gradient can be used
    
    applySmoothBlur(item, 16.0, intensity * 0.3);
}

void QuickShellEffects::applyDynamicIslandEffect(QQuickItem *item, bool isExpanded) {
    if(!m_enabled || !item)
        return;
    
    //Dynamic island effect
    if (isExpanded) {
        applySmoothBlur(item, 24.0, 0.7);
    } else {
        applySmoothBlur(item, 32.0, 0.85);
    }
}

void QuickShellEffects::applyWaterRippleEffect(QQuickItem *item, const QPointF & center, qreal maxRadius) {
    if(!m_enabled || !item)
        return;
    
    // Here you can add logic for the effect of water waves
    // A dynamic blur effect can be used with the center moving
    
    applySmoothBlur(item, 8.0, 0.5);
}

void QuickShellEffects::applySmoothTransition(QQuickItem *source, QQuickItem *target, qreal duration) {
    if(!m_enabled || !source || !target)
        return;
    
    // Smooth transition effect between elements
    applySmoothBlur(source, 16.0, 0.5);
    applySmoothBlur(target, 16.0, 0.5);
    
    // Here logic can be added for gradual transition
}

void QuickShellEffects::optimizeEffectsForPerformance() {
    m_effectQuality = 70; // Average quality for better performance
    m_blurRadius = 16.0;  // Reduce blur radius
}

void QuickShellEffects::optimizeEffectsForQuality() {
    m_effectQuality = 100; // High quality
    m_blurRadius = 32.0;   //Increase blur radius
}

void QuickShellEffects::setEffectQuality(int quality) {
    m_effectQuality = qBound(0, quality, 100);
}

void QuickShellEffects::startPulseAnimation(QQuickItem *item, const QColor &color, int duration, int interval) {
    if(!m_enabled || !item)
        return;
    
    // Stop any pulse effect based on the same element
    for (auto &effect: m_pulseEffects) {
        if (effect.item == item) {
            effect.color = color;
            effect.duration = duration;
            effect.interval = interval;
            effect.timer.restart();
            effect.active = true;
            return;
        }
    }
    
    // Add a new pulse effect
    PulseEffect effect;
    effect.item = item;
    effect.color = color;
    effect.duration = duration;
    effect.interval = interval;
    effect.timer.restart();
    effect.active = true;
    m_pulseEffects.push_back(effect);
    
    // Start the timer if it is not running
    if (m_pulseEffects.size() == 1) {
        m_pulseTimer.start();
    }
}

void QuickShellEffects::stopPulseAnimation(QQuickItem *item) {
    for (auto &effect: m_pulseEffects) {
        if (effect.item == item) {
            effect.active = false;
        }
    }
}

void QuickShellEffects::startBreathingAnimation(QQuickItem *item, qreal minScale, qreal maxScale, int duration) {
    if(!m_enabled || !item)
        return;
    
    // Stop any breathing effect based on the same element
    for (auto &effect: m_breathingEffects) {
        if (effect.item == item) {
            effect.minScale = minScale;
            effect.maxScale = maxScale;
            effect.duration = duration;
            effect.timer.restart();
            effect.active = true;
            return;
        }
    }
    
    // Add a new breathing effect
    BreathingEffect effect;
    effect.item = item;
    effect.minScale = minScale;
    effect.maxScale = maxScale;
    effect.duration = duration;
    effect.timer.restart();
    effect.active = true;
    m_breathingEffects.push_back(effect);
    
    // Start the timer if it is not running
    if (m_breathingEffects.size() == 1) {
        m_breathingTimer.start();
    }
}

void QuickShellEffects::stopBreathingAnimation(QQuickItem *item) {
    for (auto &effect: m_breathingEffects) {
        if (effect.item == item) {
            effect.active = false;
        }
    }
}

void QuickShellEffects::handleWindowBeforeRendering() {
    if(!m_enabled)
        return;
    
    //address effects in this context
    renderEffects();
}

void QuickShellEffects::handlePulseAnimations() {
    if (m_pulseEffects.empty())
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    
    for (auto &effect: m_pulseEffects) {
        if(!effect.active)
            continue;
        
        qreal elapsed = fmod(effect.timer.elapsed(), effect.interval);
        qreal progress = elapsed / effect.interval;
        
        if (progress < 0.5) {
            // Increase transparency
            qreal opacity = progress * 2.0;
            applyEyeFriendlyGlow(effect.item, effect.color, opacity);
        } else {
            // Reduce transparency
            qreal opacity = 2.0 - progress * 2.0;
            applyEyeFriendlyGlow(effect.item, effect.color, opacity);
        }
    }
}

void QuickShellEffects::handleBreathingAnimations() {
    if (m_breathingEffects.empty())
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    
    for (auto &effect: m_breathingEffects) {
        if(!effect.active)
            continue;
        
        qreal elapsed = fmod(effect.timer.elapsed(), effect.duration);
        qreal progress = elapsed / effect.duration;
        
        //calculate the scale of the element using a sine function for a normal breathing effect
        qreal scale = effect.minScale + (effect.maxScale - effect.minScale) * (0.5 + 0.5 * qSin(progress * 2 * M_PI));
        effect.item->setScale(scale);
    }
}

void QuickShellEffects::initializeOpenGL() {
    if (m_blurProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    // Create a shader program for blur
    m_blurProgram = new QOpenGLShaderProgram();
    m_blurProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    words = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_blurProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform float radius;\n"
        "uniform float opacity;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    vec4 color = vec4(0.0);\n"
        "    float total=0.0;\n"
        "    vec2 size = vec2(1.0, 1.0);\n"
        "    \n"
        "    // Calculate the blur effect using a circular sample\n
        "    for (int i = -4; i <= 4; i++) {\n"
        "        for (int j = -4; j <= 4; j++) {\n"
        "            float weight = 1.0 - length(vec2(i, j))/5.0;\n"
        "            color += texture2D(source, chords + vec2(i, j) * radius / 500.0) * weight;\n"
        "            total += weight;\n"
        "        }\n"
        "    }\n"
        "    \n"
        "    gl_FragColor = vec4(color.rgb / total, color.a * opacity);\n"
        "}\n");
    
    m_blurProgram->bindAttributeLocation("vertices", 0);
    m_blurProgram->link();
    m_blurProgram->bind();
    
    // Create a shader program for pulsating effect
    m_pulseProgram = new QOpenGLShaderProgram();
    m_pulseProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    words = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_pulseProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform vec4 glowColor;\n"
        "uniform float intensity;\n"
        "variing vec2 chords;\n"
        "void main() {\n"
        "    vec4 color = texture2D(source, chords);\n"
        "    vec4 glow = glowColor * intensity;\n"
        "    gl_FragColor = vec4(mix(color.rgb, glow.rgb, glow.a), color.a);\n"
        "}\n");
    
    m_pulseProgram->bindAttributeLocation("vertices", 0);
    m_pulseProgram->link();
    
    // Create stores
    m_vertexBuffer = new QOpenGLBuffer(QOpenGLBuffer::VertexBuffer);
    m_vertexBuffer->create();
    m_vertexBuffer->bind();
    
    // Create a list array object
    m_vao = new QOpenGLVertexArrayObject();
    if (m_vao->create())
        m_vao->bind();
}

void QuickShellEffects::cleanupOpenGL() {
    if(m_vao) {
        m_vao->destroy();
        delete m_vao;
        m_vao = nullptr;
    }
    
    if (m_vertexBuffer) {
        m_vertexBuffer->destroy();
        delete m_vertexBuffer;
        m_vertexBuffer = nullptr;
    }
    
    if(m_blurProgram) {
        delete m_blurProgram;
        m_blurProgram = nullptr;
    }
    
    if(m_pulseProgram) {
        delete m_pulseProgram;
        m_pulseProgram = nullptr;
    }
    
    if(m_breathingProgram) {
        delete m_breathingProgram;
        m_breathingProgram = nullptr;
    }
}

void QuickShellEffects::renderEffects() {
    if(!m_enabled || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    //Activate effects
    m_window->openglContext()->functions()->glEnable(GL_BLEND);
    m_window->openglContext()->functions()->glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    //Draw blur effects
    for (const auto &effect: m_blurEffects) {
        if(effect.active) {
            renderBlurEffect(effect);
        }
    }
    
    //Draw pulse effects
    for (const auto &effect: m_pulseEffects) {
        if(effect.active) {
            renderPulseEffect(effect);
        }
    }
    
    //Draw breathing effects
    for (const auto &effect: m_breathingEffects) {
        if(effect.active) {
            renderBreathingEffect(effect);
        }
    }
    
    //Disable effects
    m_window->openglContext()->functions()->glDisable(GL_BLEND);
}

void QuickShellEffects::renderBlurEffect(const BlurEffect &effect) {
    if(!m_blurProgram || !m_window || !m_window->openglContext())
        return;
    
    m_blurProgram->bind();
    m_blurProgram->setUniformValue("radius", static_cast<float>(effect.radius));
    m_blurProgram->setUniformValue("opacity", static_cast<float>(effect.opacity));
    
    // Effect drawing
    m_window->openglContext()->functions()->glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    m_blurProgram->release();
}

void QuickShellEffects::renderPulseEffect(const PulseEffect &effect) {
    if(!m_pulseProgram || !m_window || !m_window->openglContext())
        return;
    
    m_pulseProgram->bind();
    m_pulseProgram->setUniformValue("glowColor", effect.color);
    m_pulseProgram->setUniformValue("intensity", 1.0f);
    
    // Effect drawing
    m_window->openglContext()->functions()->glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    m_pulseProgram->release();
}

void QuickShellEffects::renderBreathingEffect(const BreathingEffect &effect) {
    // No special drawing is needed for this effect, which is implemented by changing the element's scale
}
EOL

cat <<EOL > ~/src/quickshell/effects/GlassMorphismEffect.h
#ifndef GLASSMORPHISMEFFECT_H
#define GLASSMORPHISMEFFECT_H

#include <QImage>
#include <QObject>
#include <QElapsedTimer>

// GlassMorphismEffect class
class GlassMorphismEffect : public QObject
{
    Q_OBJECT

public:
    explicit GlassMorphismEffect(QObject *parent = nullptr);
    ~GlassMorphismEffect();

    // Apply the effect to the image
    void applyEffect(QImage &input, QImage &output, int radius, float intensity);

private:
    //Gaussian camouflage application
    QImage applyGaussianBlur(const QRgb *bits, int width, int height, int radius);

    // Horizontal camouflage stage
    void horizontalBlur(const QRgb *source, QRgb *target, int width, int height, int radius);

    //Vertical camouflage phase
    void verticalBlur(const QRgb *source, QRgb *target, int width, int height, int radius);
};

#endif // GLASSMORPHISMEFFECT_H
EOL

cat <<EOL > ~/src/quickshell/system/GlassMorphismEffect.h
#include "GlassMorphismEffect.h"
#include <QElapsedTimer>
#include <QtMath>

GlassMorphismEffect::GlassMorphismEffect(QObject *parent)
    : QObject(parent)
{
}

GlassMorphismEffect::~GlassMorphismEffect()
{
}

void GlassMorphismEffect::applyEffect(QImage &input, QImage &output, int radius, float intensity)
{
    QElapsedTimer timer;
    timer.start();

    if (input.isNull() || input.format()!= QImage::Format_ARGB32) {
        output = input;
        return;
    }

    QRgb *bits = (QRgb *)input.bits();
    const int width = input.width();
    const int height = input. height();

    QImage blurred = applyGaussianBlur(bits, width, height, radius);

    output = QImage(width, height, QImage::Format_ARGB32);
    QRgb *outBits = (QRgb *)output.bits();

    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            int index = y * width + x;
            QRgb original = bits[index];
            QRgb blurredPixel = blurred.bits()[index];

            int r = qRed(blurredPixel);
            int g = qGreen(blurredPixel);
            int b = qBlue(blurredPixel);
            int a = qAlpha(original);

            int glassAlpha = qMin(255, static_cast<int>(a * intensity));
            outBits[index] = qRgba(r, g, b, glassAlpha);
        }
    }

    qint64 elapsed = timer.elapsed();
    if (elapsed > 2) {
        qDebug() << "GlassMorphismEffect: Processing take" << elapsed << "ms";
    }
}

QImage GlassMorphismEffect::applyGaussianBlur(const QRgb *bits, int width, int height, int radius)
{
    QImage result(width, height, QImage::Format_ARGB32);
    QImage temp(width, height, QImage::Format_ARGB32);

    horizontalBlur(bits, (QRgb *)temp.bits(), width, height, radius);
    verticalBlur((const QRgb *)temp.bits(), (QRgb *)result.bits(), width, height, radius);

    return result;
}

void GlassMorphismEffect::horizontalBlur(const QRgb *source, QRgb *target, int width, int height, int radius)
{
    const int diamond = radius * 2 + 1;
    const float scale = 1.0f / diamond;

    for (int y = 0; y < height; ++y) {
        int sumR = 0, sumG = 0, sumB = 0;

        for (int x = 0; x < diamond && x < width; ++x) {
            QRgb pixel = source[y * width + x];
            sumR += qRed(pixel);
            sumG += qGreen(pixel);
            sumB += qBlue(pixel);
        }

        for (int x = 0; x < width; ++x) {
            int left = x - radius;
            int right = x + radius + 1;

            if (left >= 0) {
                QRgb pixel = source[y * width + left];
                sumR -= qRed(pixel);
                sumG -= qGreen(pixel);
                sumB -= qBlue(pixel);
            }

            if (right < width) {
                QRgb pixel = source[y * width + right];
                sumR += qRed(pixel);
                sumG += qGreen(pixel);
                sumB += qBlue(pixel);
            }

            target[y * width + x] = qRgba(
                static_cast<int>(sumR * scale),
                static_cast<int>(sumG * scale),
                static_cast<int>(sumB * scale),
                255
            );
        }
    }
}

void GlassMorphismEffect::verticalBlur(const QRgb *source, QRgb *target, int width, int height, int radius)
{
    const int diamond = radius * 2 + 1;
    const float scale = 1.0f / diamond;

    for (int x = 0; x < width; ++x) {
        int sumR = 0, sumG = 0, sumB = 0;

        for (int y = 0; y < diamond && y < height; ++y) {
            QRgb pixel = source[y * width + x];
            sumR += qRed(pixel);
            sumG += qGreen(pixel);
            sumB += qBlue(pixel);
        }

        for (int y = 0; y < height; ++y) {
            int top = y - radius;
            int bottom = y + radius + 1;

            if (top >= 0) {
                QRgb pixel = source[top * width + x];
                sumR -= qRed(pixel);
                sumG -= qGreen(pixel);
                sumB -= qBlue(pixel);
            }

            if (bottom < height) {
                QRgb pixel = source[bottom * width + x];
                sumR += qRed(pixel);
                sumG += qGreen(pixel);
                sumB += qBlue(pixel);
            }

            target[y * width + x] = qRgba(
                static_cast<int>(sumR * scale),
                static_cast<int>(sumG * scale),
                static_cast<int>(sumB * scale),
                255
            );
        }
    }
}
EOL

cat <<EOL > ~/src/quickshell/system/QuickShellSystem.h
#ifndef QUICKSHELLSYSTEM_H
#define QUICKSHELLSYSTEM_H

#include <QObject>
#include <QVariant>
#include <QMap>
#include <QVector>
#include <QTimer>
#include <QProcess>
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QStandardPaths>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

class QuickShellSystem: public QObject {
    Q_OBJECT
    Q_PROPERTY(qint64 totalMemory READ totalMemory NOTIFY systemInfoChanged)
    Q_PROPERTY(qint64 usedMemory READ usedMemory NOTIFY systemInfoChanged)
    Q_PROPERTY(qint64 freeMemory READ freeMemory NOTIFY systemInfoChanged)
    Q_PROPERTY(int cpuUsage READ cpuUsage NOTIFY systemInfoChanged)
    Q_PROPERTY(int batteryLevel READ batteryLevel NOTIFY systemInfoChanged)
    Q_PROPERTY(bool batteryCharging READ batteryCharging NOTIFY systemInfoChanged)
    Q_PROPERTY(QString systemName READ systemName NOTIFY systemInfoChanged)
    Q_PROPERTY(QString kernelVersion READ kernelVersion NOTIFY systemInfoChanged)
    Q_PROPERTY(QString architecture READ architecture NOTIFY systemInfoChanged)
    
public:
    explicit QuickShellSystem(QObject *parent = nullptr);
    ~QuickShellSystem();
    
    // System information
    qint64 totalMemory() const;
    qint64 usedMemory() const;
    qint64 freeMemory() const;
    int cpuUsage() const;
    int batteryLevel() const;
    bool batteryCharging() const;
    QString systemName() const;
    QString kernelVersion() const;
    QString architecture() const;
    
    // System functions
    Q_INVOKABLE void restartSystem();
    Q_INVOKABLE void shutdownSystem();
    Q_INVOKABLE void suspensionSystem();
    Q_INVOKABLE void lockScreen();
    
    // File management
    Q_INVOKABLE bool fileExists(const QString &path) const;
    Q_INVOKABLE bool directoryExists(const QString &path) const;
    Q_INVOKABLE bool createDirectory(const QString &path) const;
    Q_INVOKABLE bool removeFile(const QString &path) const;
    Q_INVOKABLE bool copyFile(const QString &source, const QString &destination) const;
    Q_INVOKABLE bool moveFile(const QString &source, const QString &destination) const;
    
    // Execute commands
    Q_INVOKABLE QString executeCommand(const QString &command, const QStringList &arguments = QStringList(), int timeout = 5000);
    Q_INVOKABLE bool executeTerminalCommand(const QString &command);
    
    // Manage settings
    Q_INVOKABLE QVariant getSetting(const QString &group, const QString &key, const QVariant &defaultValue = QVariant());
    Q_INVOKABLE void setSetting(const QString &group, const QString &key, const QVariant &value);
    Q_INVOKABLE void removeSetting(const QString &group, const QString &key);
    
    // Network Management
    Q_INVOKABLE QString getIpAddress() const;
    Q_INVOKABLE QString getHostName() const;
    Q_INVOKABLE bool isNetworkConnected() const;
    
signals:
    void systemInfoChanged();
    void commandExecuted(const QString &output);
    void errorOccurred(const QString &error);
    
private slots:
    void updateSystemInfo();
    
private:
    struct SystemInfo {
        qint64 totalMemory;
        qint64 usedMemory;
        qint64 freeMemory;
        int cpuUsage;
        int batteryLevel;
        bool batteryCharging;
        QString systemName;
        QString kernelVersion;
        QString architecture;
    };
    
    SystemInfo m_systemInfo;
    QTimer m_updateTimer;
    QProcess *m_process;
};

#endif // QUICKSHELLSYSTEM_H
EOL

cat <<EOL > ~/src/quickshell/system/QuickShellSystem.cpp
#include "QuickShellSystem.h"
#include <QProcess>
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QStandardPaths>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QThread>
#include <QElapsedTimer>
#include <QTimer>
#include <QDirIterator>
#include <QFileInfo>
#include <QDateTime>
#include <QNetworkInterface>
#include <QHostInfo>
#include <QNetworkConfigurationManager>

QuickShellSystem::QuickShellSystem(QObject *parent)
    : QObject(parent),
      m_process(nullptr)
{
    // Initial information configuration
    m_systemInfo.totalMemory = 0;
    m_systemInfo.usedMemory = 0;
    m_systemInfo.freeMemory = 0;
    m_systemInfo.cpuUsage = 0;
    m_systemInfo.batteryLevel = 100;
    m_systemInfo.batteryCharging = false;
    m_systemInfo.systemName = "Desind OS";
    m_systemInfo.kernelVersion = "Unknown";
    m_systemInfo.architecture = "Unknown";
    
    // Update system information immediately
    updateSystemInfo();
    
    // Update system information every 2 seconds
    m_updateTimer.setInterval(2000);
    m_updateTimer.setSingleShot(false);
    connect(&m_updateTimer, &QTimer::timeout, this, &QuickShellSystem::updateSystemInfo);
    m_updateTimer.start();
}

QuickShellSystem::~QuickShellSystem() {
    if(m_process) {
        m_process->kill();
        m_process->waitForFinished();
        delete m_process;
    }
}

qint64 QuickShellSystem::totalMemory() const {
    return m_systemInfo.totalMemory;
}

qint64 QuickShellSystem::usedMemory() const {
    return m_systemInfo.usedMemory;
}

qint64 QuickShellSystem::freeMemory() const {
    return m_systemInfo.freeMemory;
}

int QuickShellSystem::cpuUsage() const {
    return m_systemInfo.cpuUsage;
}

int QuickShellSystem::batteryLevel() const {
    return m_systemInfo.batteryLevel;
}

bool QuickShellSystem::batteryCharging() const {
    return m_systemInfo.batteryCharging;
}

QString QuickShellSystem::systemName() const {
    return m_systemInfo.systemName;
}

QString QuickShellSystem::kernelVersion() const {
    return m_systemInfo.kernelVersion;
}

QString QuickShellSystem::architecture() const {
    return m_systemInfo.architecture;
}

void QuickShellSystem::restartSystem() {
    executeCommand("systemctl", QStringList() << "reboot");
}

void QuickShellSystem::shutdownSystem() {
    executeCommand("systemctl", QStringList() << "poweroff");
}

void QuickShellSystem::suspendSystem() {
    executeCommand("systemctl", QStringList() << "suspend");
}

void QuickShellSystem::lockScreen() {
    executeCommand("loginctl", QStringList() << "lock-session");
}

bool QuickShellSystem::fileExists(const QString &path) const {
    return QFile::exists(path);
}

bool QuickShellSystem::directoryExists(const QString &path) const {
    return QDir(path).exists();
}

bool QuickShellSystem::createDirectory(const QString &path) const {
    return QDir().mkpath(path);
}

bool QuickShellSystem::removeFile(const QString &path) const {
    return QFile::remove(path);
}

bool QuickShellSystem::copyFile(const QString &source, const QString &destination) const {
    return QFile::copy(source, destination);
}

bool QuickShellSystem::moveFile(const QString &source, const QString &destination) const {
    return QFile::rename(source, destination);
}

QString QuickShellSystem::executeCommand(const QString&command, const QStringList&arguments, inttimeout) {
    QProcess process;
    process.start(command, arguments);
    
    if(!process.waitForStarted()) {
        emit errorOccurred("Failed to start process: " + command);
        return QString();
    }
    
    if(!process.waitForFinished(timeout)) {
        process.kill();
        emit errorOccurred("Process timed out: " + command);
        return QString();
    }
    
    QString output = QString::fromUtf8(process.readAllStandardOutput());
    QString error = QString::fromUtf8(process.readAllStandardError());
    
    if(!error.isEmpty()) {
        emit errorOccurred(error);
    }
    
    emit commandExecuted(output);
    return output;
}

bool QuickShellSystem::executeTerminalCommand(const QString &command) {
    return executeCommand("alacritty", QStringList() << "-e" << command) != QString();
}

QVariant QuickShellSystem::getSetting(const QString&group, const QString&key, const QVariant&defaultValue) {
    QSettings settings("Desind", "DesindOS");
    settings.beginGroup(group);
    QVariant value = settings.value(key, defaultValue);
    settings.endGroup();
    return value;
}

void QuickShellSystem::setSetting(const QString&group, const QString&key, const QVariant&value) {
    QSettings settings("Desind", "DesindOS");
    settings.beginGroup(group);
    settings.setValue(key, value);
    settings.endGroup();
}

void QuickShellSystem::removeSetting(const QString&group, const QString&key) {
    QSettings settings("Desind", "DesindOS");
    settings.beginGroup(group);
    settings.remove(key);
    settings.endGroup();
}

QString QuickShellSystem::getIpAddress() const {
    foreach (const QNetworkInterface &networkInterface, QNetworkInterface::allInterfaces()) {
        if (networkInterface.flags().testFlag(QNetworkInterface::IsUp) &&
            !networkInterface.flags().testFlag(QNetworkInterface::IsLoopBack)) {
            
            foreach (const QNetworkAddressEntry &addressEntry, networkInterface.addressEntries()) {
                if (addressEntry.ip().protocol() == QAbstractSocket::IPv4Protocol &&
                    !addressEntry.ip().isLoopback()) {
                    return addressEntry.ip().toString();
                }
            }
        }
    }
    
    return QString();
}

QString QuickShellSystem::getHostName() const {
    return QHostInfo::localHostName();
}

bool QuickShellSystem::isNetworkConnected() const {
    QNetworkConfigurationManager manager;
    return manager.isOnline();
}

void QuickShellSystem::updateSystemInfo() {
    // Update memory information
    QFile memInfo("/proc/meminfo");
    if (memInfo.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&memInfo);
        while (!in.atEnd()) {
            QString line = in.readLine();
            if (line.startsWith("MemTotal:")) {
                m_systemInfo.totalMemory = line.split(":").at(1).simplified().split(" ").at(0).toLongLong();
            } else if (line.startsWith("MemFree:")) {
                m_systemInfo.freeMemory = line.split(":").at(1).simplified().split(" ").at(0).toLongLong();
            } else if (line.startsWith("Buffers:")) {
                qint64 buffers = line.split(":").at(1).simplified().split(" ").at(0).toLongLong();
                m_systemInfo.freeMemory += buffers;
            } else if (line.startsWith("Cached:")) {
                qint64 cached = line.split(":").at(1).simplified().split(" ").at(0).toLongLong();
                m_systemInfo.freeMemory += cached;
            }
        }
        memInfo.close();
        
        m_systemInfo.usedMemory = m_systemInfo.totalMemory - m_systemInfo.freeMemory;
    }
    
    // Processor usage update
    static qint64 prevIdleTime = 0;
    static qint64 prevTotalTime = 0;
    
    QFile statFile("/proc/stat");
    if (statFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&statFile);
        QString line = in.readLine();
        if (line.startsWith("cpu")) {
            QStringList values = line.split(" ", Qt::SkipEmptyParts);
            if (values.size() >= 5) {
                qint64 user = values[1].toLongLong();
                qint64 nice = values[2].toLongLong();
                qint64 system = values[3].toLongLong();
                qint64 idle = values[4].toLongLong();
                
                qint64 idleTime = idle;
                qint64 totalTime = user + nice + system + idle;
                
                if (prevTotalTime > 0) {
                    qint64 totalDelta = totalTime - prevTotalTime;
                    qint64 idleDelta = idleTime - prevIdleTime;
                    
                    if (totalDelta > 0) {
                        m_systemInfo.cpuUsage = 100 * (totalDelta - idleDelta) / totalDelta;
                    }
                }
                
                prevIdleTime = idleTime;
                prevTotalTime = totalTime;
            }
        }
        statFile.close();
    }
    
    // Update battery level
    QDir batteryDir("/sys/class/power_supply");
    if (batteryDir.exists()) {
        QStringList batteries = batteryDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
        for (const QString &battery:batteries) {
            QFile statusFile(batteryDir.absoluteFilePath(battery + "/status"));
            QFile capacityFile(batteryDir.absoluteFilePath(battery + "/capacity"));
            
            if (statusFile.open(QIODevice::ReadOnly | QIODevice::Text) &&
                capacityFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
                
                QTextStream statusStream(&statusFile);
                QTextStream capacityStream(&capacityFile);
                
                QString status = statusStream.readLine();
                QString capacity = capacityStream.readLine();
                
                m_systemInfo.batteryCharging = (status == "Charging");
                m_systemInfo.batteryLevel = capacity.toInt();
                
                statusFile.close();
                capacityFile.close();
                break;
            }
        }
    }
    
    // System Information Update
    QFile osRelease("/etc/os-release");
    if (osRelease.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&osRelease);
        while (!in.atEnd()) {
            QString line = in.readLine();
            if (line.startsWith("PRETTY_NAME=")) {
                m_systemInfo.systemName = line.mid(13).remove('"');
            }
        }
        osRelease.close();
    }
    
    // Kernel version update
    QFile kernelVersion("/proc/version");
    if (kernelVersion.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&kernelVersion);
        QString line = in.readLine();
        if(!line.isEmpty()) {
            QStringList parts = line.split(" ");
            if (parts.size() > 2) {
                m_systemInfo.kernelVersion = parts[2];
            }
        }
        kernelVersion.close();
    }
    
    // Update structure
    m_systemInfo.architecture = QSysInfo::buildCpuArchitecture();
    
    // Send a signal to change system information
    emit systemInfoChanged();
}
EOL

cat <<EOL > ~/src/quickshell/QuickShellPlugin.cpp
#include <qqml.h>
#include "QuickShellAnimation.h"
#include "QuickShellEffects.h"
#include "QuickShellSystem.h"

static void registerQuickShellTypes() {
    qmlRegisterType<QuickShellAnimation>("QuickShell.Animation", 1, 0, "Animation");
    qmlRegisterType<QuickShellEffects>("QuickShell.Effects", 1, 0, "Effects");
    qmlRegisterType<QuickShellSystem>("QuickShell.System", 1, 0, "System");
}

Q_COREAPP_STARTUP_FUNCTION(registerQuickShellTypes)
EOL

# ============================
# Install additional settings
# ============================
# -------
# 1. Install Snapd if it is not installed
# -------
echo "=================
echo "Install Snapd..."
echo "=================
if! command -v snap &> /dev/null; then
    sudo pacman -Sy --noconfirm snapd
    sudo systemctl enable --now snapd.socket
fi

echo "Install desktop applications..."
echo "==============================
echo "(1/7) Install YouTube..."
cat <<EOL > ~/.local/share/applications/youtube.desktop
[Desktop Entry]
Name=YouTube
Comment=Your favorite videos anytime, anywhere!
Exec=chromium --app=https://www.youtube.com/
Icon=youtube
Terminal=false
Type=Application
Categories=Multimedia;Video;Network;
StartupWMClass=youtube-pwa
EOL

echo "(2/7) Install Gmail..."
cat <<EOL > ~/.local/share/applications/gmail.desktop
[Desktop Entry]
Name=Gmail
Comment=Everyone's favorite email app!
Exec=chromium --app=https://mail.google.com/mail/u/0/
Icon=gmail
Terminal=false
Type=Application
Categories=Network;Email;
StartupWMClass=gmail-pwa
MimeType=x-scheme-handler/mailto;
EOL

echo "(3/7) Install Google Drive..."
cat <<EOL > ~/.local/share/applications/google-drive.desktop
[Desktop Entry]
Name=Google Drive
Comment=Your files are synced on your devices.
Exec=chromium --app=https://drive.google.com/drive/my-drive
Icon=google-drive
Terminal=false
Type=Application
Categories=Network;Office;Utility;
StartupWMClass=google-drive-pwa
EOL

echo "(4/7) Install Google Photos..."
cat <<EOL > ~/.local/share/applications/google-photos.desktop
[Desktop Entry]
Name=Google Photos
Comment=Share your photos with all your devices wherever you are!
Exec=chromium --app=https://photos.google.com/
Icon=google-photos
Terminal=false
Type=Application
Categories=Multimedia;Graphics;Photography;Network;
StartupWMClass=google-photos-pwa
EOL

echo "(5/7) Install GitHub..."
cat <<EOL > ~/.local/share/applications/github.desktop
[Desktop Entry]
Name=GitHub
Comment=Your warehouses are with you all the time!
Exec=chromium --app=https://github.com/
Icon=github
Terminal=false
Type=Application
Categories=Development;Network;
StartupWMClass=github-pwa
EOL

echo "(6/7) Install Reddit..."
cat <<EOL > ~/.local/share/applications/reddit.desktop
[Desktop Entry]
Name=Reddit
Comment=Open Reddit as a desktop application interface
Exec=chromium --app=https://www.reddit.com/
Icon=reddit
Terminal=false
Type=Application
Categories=Network;Social;
StartupWMClass=reddit-pwa
EOL

echo "(7/7) Install Pinterest..."
cat <<EOL > ~/.local/share/applications/pinterest.desktop
[Desktop Entry]
Name=Pinterest
Comment=The best app to steal other people's ideas!
Exec=chromium --app=https://www.pinterest.com/
Icon=pinterest
Terminal=false
Type=Application
Categories=Graphics;Network;
StartupWMClass=pinterest-pwa
EOL

update-desktop-database ~/.local/share/applications/

# ========================
# QuickShell service file
# ========================
echo "System setup finished, please wait..."
cat <<EOL > ~/etc/systemd/system/desind.service
[Unit]
Description=Desind Shell Desktop (DSD)
After=graphical.target

[Service]
Type=simple
ExecStart=/usr/bin/quickshell -p/home/$USER/.config/quickshell/shell.qml
Restart=always
User=$USER
Environment=DISPLAY=:0
Environment=XAUTHORITY=/home/$USER/.Xauthority

[Install]
WantedBy=graphical.target
EOL

PROJECT_ROOT=$(pwd)
SYSTEM_CONFIG_DIR="/etc/desind"
IMAGE_DIR="/usr/share/desind/images"
DOC_DIR="/usr/share/doc/desind"

# Create folders if they don't exist
mkdir -p "$SYSTEM_CONFIG_DIR"
mkdir -p "$IMAGE_DIR"

# Transfer photos
echo "Transfer images..."
cp "$PROJECT_ROOT/resources/images/"* "$IMAGE_DIR/"

# Transfer JSON files (Settings)
echo "Move settings files..."
cp "$PROJECT_ROOT/resources/data/"*.json "$SYSTEM_CONFIG_DIR/"

# Document transfer
cp "$PROJECT_ROOT/docs/"*.{md, LICENSE} "$DOC_DIR/"

# ==========================
# Finishing the preparation
# ==========================
echo "----------"
echo "==============
echo "Done!"
echo "==============
echo "----------"

systemctl enable desind.service
systemctl start desind.service
