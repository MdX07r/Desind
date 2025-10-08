#!/bin/bash
                                                                                                                    
echo "                      @@@@@@@@@@@@                         
                       @@@@@@@@@@@@@@@@@@@@@                    
                    @@@@@@@@                @@@                 
                   @@@@@       @@@@@@@@@@@     @@               
               @           @@@@@@@@@@@@@@@@@     @@             
             @@         @@@@@@@@@@@@@@@@@@@@      @@@           
            @@       @@@@@@@@@@@@@@@@@@@@@@@       @@@          
           @@@     @@@@@@@@@@@@@@@@@@@@@@@@         @@@         
          @@@@   @@@@@@@@@         @@@@@@           @@@@        
          @@@@@@@@@@@@@@          @@@@@              @@@        
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
                       @@@@@@@@@@@@@@@@@@@@@@@@@@               
                       @@@@@@@@@@@@@@@@@@@@@@@@                 
                        @@@@@@@@@@@@@@@@@@@@                    
                           @@@@@@@@@@@@"                                                                                  

echo "التحضير للتثبيت..."
echo "=========================="
sudo pacman -Syu --noconficonf
sudo pacman -S --noconfirm base-devel git

if ! command -v yay &> /dev/null; then
    git clone https:
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

echo "تثبيت الحزم..."
echo "========================="
sudo pacman -S --noconfirm hyprland quickshell fastfetch grim slurp wl-copy swappy cmake qt6 nvim playerctl wtype hyprcursor nautilus chromium noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-nerd-fonts-symbols ttf-ibm-plex ttf-jetbrains-mono networkmanager pavucontrol brightnessctl wpctl pactl python-pywal arabic-indic-digit-utils telegram-desktop discord code vs-code libreoffice-fresh bottles gimp steam lutris audacity kdenlive obs-studio flatpak

yay -S alacritty-smooth-cursor-git heroic-games-launcher waydroid

sudo pacman -S --noconfirm otf-font-awesome awesome-terminal-fonts papirus-icon-theme

sudo pacman -S --noconfirm ttf-dejavu ttf-liberation

echo " بدء إعداد النظام..."
echo "======================="

echo "-------------------------"
echo "(1/3) تثبيت الخط..."
sudo pacman -S --needed --noconfirm ttf-ibm-plex otf-ibm-plex
fc-cache -fv

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

sudo pacman -S --needed --noconfirm xkeyboard-config

echo "-------------------"
echo "(2/3) اعداد Alactritty..."
cat <<EOL > ~/.config/alactritty/alactritty.toml
import = [
    "~/.cache/wal/alacritty.toml"
]

[window]


padding = { x = 10, y = 10 }

decorations = "full"

opacity = 0.95 # Simple transparency (95%). You can adjust it between 0.0 and 1.0.
blur = true   # Enable blur. Requires a compositor like picom.

[scrolling]
history = 10000
multiplier = 3

[font]
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }
bold = { family = "JetBrainsMono Nerd Font", style = "Bold" }
italic = { family = "JetBrainsMono Nerd Font", style = "Italic" }
bold_italic = { family = "JetBrainsMono Nerd Font", style = "Bold Italic" }

size = 11.0

glyph_offset = { x = 0, y = 0 }

[bell]
animation = "EaseOutExpo"
duration = 100 # in ms
color = "#ffffff"

[selection]
save_to_clipboard = true

[cursor]
style = { shape = "Block", blinking = "On" }

smooth_cursor = true

[keyboard]

[mouse]
hide_when_typing = true

bindings = [
  { mouse = "ScrollUp", mods = "Control", action = "IncreaseFontSize" },
  { mouse = "ScrollDown", mods = "Control", action = "DecreaseFontSize" },
]

[colors]

primary = { background = "#000000", foreground = "#ffffff" }

cursor = { text = "CellBackground", cursor = "CellForeground" }
vi_mode_cursor = { text = "CellBackground", cursor = "CellForeground" }

selection = { text = "CellBackground", background = "#b3b3b3" }

normal = { black = "#1d1f21", red = "#cc6666", green = "#b5bd68", yellow = "#f0c674", blue = "#81a2be", magenta = "#b294bb", cyan = "#8abeb7", white = "#c5c8c6" }

bright = { black = "#666666", red = "#d54e53", green = "#b9ca4a", yellow = "#e7c547", blue = "#7aa6da", magenta = "#c397d8", cyan = "#70c0b1", white = "#eaeaea" }


draw_bold_text_with_bright_colors = true

[terminal.shell]
program = "/bin/bash"
args = [
  "-c",
  "fastfetch && exec bash",
]
EOL

cat <<EOL > ~/.config/fastfetch/config.jsonc
{
    
    "logo": {
        
        "type": "file",
        
        "key": "~/.config/fastfetch/desind.txt",
        
        
        
        "color": {
            
            "0": "$color0", 
            
            "1": "$color1",
            "2": "$color2", 
            "3": "$color3", 
            "4": "$color4",
            "5": "$color5", 
            "6": "$color6", 
            "7": "$color7",
            
            "8": "$color8",
            "9": "$color9",
            "A": "$colorA",
            "B": "$colorB",
            "C": "$colorC",
            "D": "$colorD",
            "E": "$colorE",
            "F": "$colorF"
        },
        
        
        "padding": {
            "top": 0,
            "right": 4, 
            "bottom": 0,
            "left": 0
        },
        "side": "left"
    },

    
    
    "modules": [
        "os",             
        "host",           
        "kernel",         
        "uptime",         
        "packages",       
        "shell",          
        "display",        
        "wm",             
        "cpu",            
        "gpu",            
        "memory",         
        "disk",           
        "terminal"        
    ],

    
    
    "display-header": true,
    "header": {
        "format": "$user@$hostname"
    },
    
    
    
    "key-color": "$color4",   
    
    
    
    "text-color": "$colorF", 
    
    
    "separator-color": "default", 
    
    
    "separator": ": "
}
EOL

cat <<EOL > ~/.config/fastfetch/desind.txt
                 *@@@@@@@@@@@@@                   
              @@@@@@@           :@@               
             @@@@      @@@@@@@@    -@+            
         =         @@@@@@@@@@@@@@    *@           
        @       @@@@@@@@@@@@@@@@@+     @@         
      -@      @@@@@@@@@@@@@@@@@@@       @@        
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

echo "===================="
echo "تكوين Hyprland..."
echo "===================="
cat <<EOL > ~/.config/hypr/hyprland.conf

input {
    kb_layout = ar,us
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


general {
    gaps_in = 10
    gaps_out = 25
    border_size = 2
    col.active_border = rgba(4169E1FF)
    col.inactive_border = rgba(00000000)
    rounding = 15
    layout = dwindle
    border_size = 2
    full_no_gaps = true
    allow_tearing = false
    resize_on_border = true
    resize_on_border_only = true
    mouse_move_enables_hyprland_drag = true
    new_window = default
    focus_on_activate = true
    swallow = true
    cursor_inactive_timeout = 0
    initial_workspace = 1
}

decoration {
    rounding = 15
    active_opacity = 1.0
    inactive_opacity = 1.0
    fullscreen_opacity = 1.0
    dim_special = false
    dim_strength = 0.0
    blur = true
    blur_size = 4
    blur_passes = 1
    blur_new_optimizations = true
    drop_shadow = true
    shadow_range = 10
    shadow_render_power = 2
    col.shadow = rgba(000000AA)
    no_vfr = false
    no_rdr = false
    no_maps = false
}


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
    initial_workspace = 1
    debug {
        enable_rendering = true
        enable_debug_marks = false
    }
}

monitor = ,preferred,auto,auto,1


$mainMod = SUPER

env = TERMINAL,alacritty-smooth-cursor-git
env = BROWSER,chromium
env = EDITOR,nvim

bind = $mainMod, RETURN, exec, $TERMINAL
bind = $mainMod, T, exec, $TERMINAL -e $EDITOR 
bind = $mainMod, K, killactive,
bind = $mainMod, F, fullscreen,
bind = $mainMod, P, pseudo,
bind = $mainMod, X, exec, $BROWSER
bind = $mainMod, Z, togglefloating,
bind = $mainMod, J, toggleopaque,
bind = $mainMod, B, toggleborder,

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

bind = $mainMod, LEFT, movefocus, l
bind = $mainMod, RIGHT, movefocus, r
bind = $mainMod, UP, movefocus, u
bind = $mainMod, DOWN, movefocus, d

bind = $mainMod SHIFT, LEFT, resizeactive, -10 0
bind = $mainMod SHIFT, RIGHT, resizeactive, 10 0
bind = $mainMod SHIFT, UP, resizeactive, 0 -10
bind = $mainMod SHIFT, DOWN, resizeactive, 0 10
bind = $mainMod SHIFT, J, resizeactive, -10 0
bind = $mainMod SHIFT, L, resizeactive, 10 0
bind = $mainMod SHIFT, I, resizeactive, 0 -10
bind = $mainMod SHIFT, K, resizeactive, 0 10

bind = $mainMod, H, togglesplit,

bind = SUPER, F12, exec, grim ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
bind = SUPER, F11, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png
bind = SUPER, F10, exec, grim -g "$(hyprctl activewindow | grep 'at: ' | cut -d' ' -f3 | sed 's/,.*
bind = SUPER, F9, exec, sleep 5 && grim ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png && swappy -f ~/Pictures/Screenshots/screenshot_$(date '+%Y-%m-%d_%H-%M-%S').png

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

exec-once = dbus-update-activation-environment --systemd DISPLAY
exec-once = systemctl --user import-environment DISPLAY
exec-once = wal
exec-once = quickshell
exec-once = xdg-desktop-portal-hyprland
exec-once = xdg-desktop-portal
exec-once = alactritty
exec-once = mpd
exec-once = mpd-mpris


env = HYPRCURSOR_THEME,Bibata-Modern-Ice
env = HYPRCURSOR_SIZE,12

env = QT_QPA_PLATFORM, wayland
env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
env = XDG_CURRENT_DESKTOP, Hyprland
env = XDG_SESSION_DESKTOP, Hyprland
env = MOZ_ENABLE_WAYLAND, 1
env = QT_QPA_PLATFORMTHEME, qt6ct
env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
env = SDL_VIDEODRIVER, wayland

env = LANG, ar_IQ.UTF-8
env = LC_ALL, ar_IQ.UTF-8
env = LC_CTYPE, ar_IQ.UTF-8
env = LC_MESSAGES, ar_IQ.UTF-8
env = LC_TIME, ar_IQ.UTF-8
env = LC_NUMERIC, ar_IQ.UTF-8
env = LC_MONETARY, ar_IQ.UTF-8
env = LC_PAPER, ar_IQ.UTF-8
env = LC_NAME, ar_IQ.UTF-8
env = LC_ADDRESS, ar_IQ.UTF-8
env = LC_TELEPHONE, ar_IQ.UTF-8
env = LC_MEASUREMENT, ar_IQ.UTF-8
env = LC_IDENTIFICATION, ar_IQ.UTF-8

env = QUICKSHELL_THEME, pure-black
env = QUICKSHELL_LAYOUT_DIRECTION, rtl
env = QUICKSHELL_BLUR_EFFECT, true
env = QUICKSHELL_ANIMATIONS, smooth
env = QUICKSHELL_FONT, "IBM Plex Sans Thin"

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
    color: isDarkTheme ? "#000000" : "#FFFFFF"

    
    property var pywalColors: {
        "colors": [
            "#000000", 
            "#BC412B", 
            "#568C3B", 
            "#F7D000", 
            "#4169E1", 
            "#A020F0", 
            "#00CED1", 
            "#F5F5F5"  
        ],
        "special": {
            "background": "#000000",
            "foreground": "#F5F5F5",
            "cursor": "#F5F5F5"
        }
    }

    
    property bool isDarkTheme: true
    property int currentPage: 0
    property var keyboardLayouts: ["US", "AR"]
    property var notificationMessages: ["Welcome to Desind OS", "نظام تشغيل مبتكر يجمع بين السرعة والجمال"]

    
    Settings {
        property bool isFirstRun: true
    }

    
    Component.onCompleted: {
        if (!settings.isFirstRun) {
            rootLoader.source = "shell.qml" 
        } else {
            settings.isFirstRun = false 
        }
    }

    
    Rectangle {
        id: welcomeScreen
        anchors.fill: parent
        color: pywalColors.special.background
        visible: currentPage === 0

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Welcome to Desind OS"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 36
                color: pywalColors.special.foreground
            }

            Text {
                text: "An innovative OS combining speed, simplicity, and beauty."
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 18
                color: pywalColors.colors[5]
                horizontalAlignment: Text.AlignHCenter
                width: parent.width * 0.8
                wrapMode: Text.Wrap
            }

            Button {
                text: "Let's begin >"
                width: 150
                height: 50
                radius: 25
                color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2)
                border.color: pywalColors.colors[6]
                border.width: 1

                onClicked: {
                    currentPage = 1 
                }
            }
        }
    }

    
    StackView {
        id: featurePages
        anchors.fill: parent
        visible: currentPage > 0
        initialItem: FeaturePage { featureIndex: 0 }

        onCurrentIndexChanged: {
            if (featurePages.depth === 0) {
                currentPage = 0
            }
        }
    }

    
    Component {
        id: featurePageComponent
        Item {
            id: featurePage
            property int featureIndex: 0
            width: parent.width
            height: parent.height

            Column {
                anchors.centerIn: parent
                spacing: 20

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
                    spacing: 10

                    Button {
                        text: "< السابق"
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
                        text: "التالي >"
                        width: 100
                        height: 40
                        radius: 20
                        visible: featureIndex < 2

                        onClicked: {
                            featureIndex += 1
                            featurePages.push(FeaturePage { featureIndex: featureIndex })
                        }
                    }
                }
            }
        }
    }

    
    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Text {
            text: isDarkTheme ? "Light mode" : "Dark mode"
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
        visible: currentPage === 3

        Column {
            anchors.fill: parent
            spacing: 10

            Text {
                text: "Manage keyboard layouts"
                font.family: "IBM Plex Sans Bold"
                font.pixelSize: 20
                color: pywalColors.special.foreground
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ListView {
                width: parent.width
                height: 100
                model: keyboardLayouts
                delegate: Item {
                    width: parent.width
                    height: 30

                    Row {
                        anchors.fill: parent
                        spacing: 10

                        Text {
                            text: modelData
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.special.foreground
                        }

                        Button {
                            text: "حذف"
                            width: 60
                            height: 25
                            radius: 10
                            visible: model.index !== 0

                            onClicked: {
                                keyboardLayouts.splice(model.index, 1)
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
                    keyboardLayouts.push("New Layout")
                }
            }
        }
    }

    
    function getFeatureTitle(index) {
        switch (index) {
        case 0: return "Drile: Lightweight file manager"
        case 1: return "Crosire: AI engine"
        case 2: return "ArchStart: App launcher"
        default: return ""
        }
    }

    function getFeatureDescription(index) {
        switch (index) {
        case 0: return "Drile اخف مدير ملفات على الاطلاق!"
        case 1: return "Crosire هو محرك الذكاء الاصطناعي الذي يتعلم منك ويتكيف."
        case 2: return "ArchStart هو مدير التطبيقات المدمج الذي يوفر السرعة والمرونة."
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

echo "تكوين QuickShell..."
echo "========================="
echo "(1/5) تكوين النظام..."
cat <<EOL > ~/.config/quickshell/shell.qml



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




ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    color: "#000000"
    title: "Desind"
    
    locale: Qt.locale("ar_IQ")
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    
    
    
    QuickShellAnimation {
        id: animationEngine
        animationduration: 50
        animationEasing: 8 
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

    
    
    
    Capsule {
        id: settingsCapsule
        icon: "\uf013" 
        colorIndex: 4
        capsuleId: "settings"
        width: 50
        height: 50
        property bool isExpanded: false
        property bool isRightClicked: false
        
        
        Rectangle {
            id: capsuleBase
            anchors.fill: parent
            radius: width / 2
            color: "#000000"
            border.width: 0
            
            
            Text {
                anchors.centerIn: parent
                text: settingsCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
        }
        
        
        MouseArea {
            id: settingsMouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            
            onEntered: {
                
                animationEngine.startAnimation(capsuleBase, "scale", 1.0, 1.05, 80);
            }
            
            onExited: {
                
                animationEngine.startAnimation(capsuleBase, "scale", 1.05, 1.0, 80);
            }
            
            
            onClicked: {
                if (mouse.button === Qt.LeftButton) {
                    
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded && child.capsuleId !== "settings") {
                            animationEngine.startAnimation(child, "width", child.width, 100, 100);
                            child.isExpanded = false;
                        }
                    }
                    
                    
                    animationEngine.startAnimation(settingsCapsule, "width", 50, 100, 100);
                    isExpanded = true;
                    activeCapsule = capsuleId;
                    
                    
                    openSettingsApp();
                    
                    
                    setTimeout(function() {
                        animationEngine.startAnimation(settingsCapsule, "width", 100, 50, 100);
                        isExpanded = false;
                        activeCapsule = "";
                    }, 200);
                }
            }
            
            
            onPressAndHold: {
                if (!isExpanded) {
                    
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded && child.capsuleId !== "settings") {
                            animationEngine.startAnimation(child, "width", child.width, 100, 100);
                            child.isExpanded = false;
                        }
                    }
                    
                    
                    animationEngine.startAnimation(settingsCapsule, "width", 50, 200, 100);
                    isExpanded = true;
                    isRightClicked = true;
                    activeCapsule = capsuleId;
                    
                    
                    visualEffects.applySmoothBlur(editOptions, 16, 0.7);
                    
                    
                    editOptions.visible = true;
                    animationEngine.startAnimation(editOptions, "opacity", 0, 1, 50);
                } else if (isRightClicked) {
                    
                    animationEngine.startAnimation(settingsCapsule, "width", 200, 50, 100);
                    isExpanded = false;
                    isRightClicked = false;
                    activeCapsule = "";
                    
                    
                    animationEngine.startAnimation(editOptions, "opacity", 1, 0, 50);
                    setTimeout(function() {
                        editOptions.visible = false;
                    }, 50);
                }
            }
        }
        
        
        Item {
            id: editOptions
            anchors.fill: parent
            visible: false
            opacity: 0
            
            
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
                    text: "Hyprland file"
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: pywalColors.colors[2]
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        
                        visualEffects.startPulseAnimation(hyprlandOption, pywalColors.colors[2], 300, 600);
                        openHyprlandConfig();
                    }
                    onEntered: {
                        
                        animationEngine.startAnimation(parent, "scale", 1.0, 1.05, 50);
                    }
                    onExited: {
                        animationEngine.startAnimation(parent, "scale", 1.05, 1.0, 50);
                    }
                }
            }
            
            
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
                        
                        visualEffects.startPulseAnimation(quickshellOption, pywalColors.colors[5], 300, 600);
                        openQuickShellConfig();
                    }
                    onEntered: {
                        
                        animationEngine.startAnimation(parent, "scale", 1.0, 1.05, 50);
                    }
                    onExited: {
                        animationEngine.startAnimation(parent, "scale", 1.05, 1.0, 50);
                    }
                }
            }
        }
        
        
        
        
        
        function openSettingsApp() {
            try {
                
                systemInfo.executeTerminalCommand("qmlscene qrc:/SettingsApp/SettingsApp.qml");
            } catch (e) {
                console.error("فشل فتح تطبيق الإعدادات:", e);
            }
        }
        
        
        function openHyprlandConfig() {
            try {
                
                const homeDir = systemInfo.executeCommand("echo", ["$HOME"]).trim();
                const configPath = homeDir + "/.config/hypr/hyprland.conf";
                
                
                systemInfo.executeTerminalCommand("nvim " + configPath);
                
                
                visualEffects.startBreathingAnimation(settingsCapsule, 0.95, 1.05, 3000);
            } catch (e) {
                console.error("فشل فتح ملف Hyprland:", e);
            }
        }
        
        
        function openQuickShellConfig() {
            try {
                
                const homeDir = systemInfo.executeCommand("echo", ["$HOME"]).trim();
                const configPath = homeDir + "/.config/quickshell/config.json";
                
                
                systemInfo.executeTerminalCommand("nvim " + configPath);
                
                
                visualEffects.startBreathingAnimation(settingsCapsule, 0.95, 1.05, 3000);
            } catch (e) {
                console.error("فشل فتح ملف QuickShell:", e);
            }
        }
    }

    
    
    
    property var productivityData: {
        daily: [],
        weekly: [],
        monthly: []
    }

    
    
    
    SmartDeviceManager {
        id: smartDeviceManager
        enabled: true
        
        onDeviceDetected: {
            
            notificationSystem.notificationReceived("Smart devices", "جهاز جديد", 
                "تم اكتشاف جهاز " + deviceName, "\uf108");
            
            
            crosireChatMessages.push({
                message: "تم اكتشاف جهاز " + deviceName + 
                        ". هل تريد دمجه مع نظام QuickShell؟",
                isUser: false
            });
        }
        
        onDeviceInteractionRequested: {
            
            interactWithSmartDevice(deviceId, interactionType);
        }
        
        onDeviceStatusChanged: {
            
            updateDeviceStatus(deviceId, status);
        }
    }

    
    function interactWithSmartDevice(deviceId, interactionType) {
        try {
            smartDeviceManager.interact(deviceId, interactionType);
        } catch (e) {
            console.error("Failed to interact with smart device:", e);
            showToast("فشل التفاعل مع الجهاز", "\uf071");
        }
    }

    
    function integrateSmartDevice(deviceId) {
        try {
            smartDeviceManager.integrate(deviceId);
            showToast("Device integrated with the system", "\uf108");
        } catch (e) {
            console.error("Failed to integrate smart device:", e);
            showToast("فشل دمج الجهاز", "\uf071");
        }
    }

    
    function updateDeviceStatus(deviceId, status) {
        
        console.log(`حالة الجهاز ${deviceId} تم تحديثها إلى: ${status}`);
    }

    
    function discoverSmartDevices() {
        try {
            smartDeviceManager.discover();
            showToast("Started searching for smart devices", "\uf108");
        } catch (e) {
            console.error("Failed to search for devices الذكية:", e);
            showToast("Failed to search for devices", "\uf071");
        }
    }

    
    Timer {
        id: deviceDiscoveryTimer
        interval: 300000 
        repeat: true
        running: true
        onTriggered: discoverSmartDevices()
    }

    
    function collectUsageData() {
        const now = new Date();
        const hour = now.getHours();
        
        productivityData.daily.push({
            timestamp: now.toISOString(),
            activeApps: getActiveApplications(),
            cpuUsage: systemMonitor.cpuUsage,
            memoryUsage: systemMonitor.memoryUsage,
            focused: isUserFocused()
        });
        
        
        saveProductivityData();
    }

    
    function analyzeProductivity() {
        const now = new Date();
        const today = new Date(now.getFullYear(), now.getMonth(), now.getDate());
        
        
        const todayData = productivityData.daily.filter(entry => 
            new Date(entry.timestamp).toDateString() === today.toDateString());
        
        if (todayData.length === 0) return null;
        
        
        const avgCpu = todayData.reduce((sum, entry) => sum + entry.cpuUsage, 0) / todayData.length;
        const avgMemory = todayData.reduce((sum, entry) => sum + entry.memoryUsage, 0) / todayData.length;
        
        
        const focusPeriods = detectFocusPeriods(todayData);
        const distractionPeriods = detectDistractionPeriods(todayData);
        
        return {
            productiveHours: focusPeriods.length,
            distractionHours: distractionPeriods.length,
            avgCpu: avgCpu,
            avgMemory: avgMemory,
            focusPeriods: focusPeriods,
            distractionPeriods: distractionPeriods,
            productivityScore: calculateProductivityScore(focusPeriods, distractionPeriods)
        };
    }

    
    function detectFocusPeriods(data) {
        const focusPeriods = [];
        let currentPeriod = null;
        
        for (let i = 0; i < data.length; i++) {
            if (data[i].focused) {
                if (!currentPeriod) {
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
                if (currentPeriod && currentPeriod.duration >= 5) { 
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

    
    function detectDistractionPeriods(data) {
        const distractionPeriods = [];
        let currentPeriod = null;
        
        for (let i = 0; i < data.length; i++) {
            if (!data[i].focused) {
                if (!currentPeriod) {
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
                    distractionPeriods.push(currentPeriod);
                }
                currentPeriod = null;
            }
        }
        
        if (currentPeriod && currentPeriod.duration >= 5) {
            distractionPeriods.push(currentPeriod);
        }
        
        return distractionPeriods;
    }

    
    function calculateProductivityScore(focusPeriods, distractionPeriods) {
        const totalFocusMinutes = focusPeriods.reduce((sum, period) => sum + period.duration, 0) * 5; 
        const totalDistractionMinutes = distractionPeriods.reduce((sum, period) => sum + period.duration, 0) * 5;
        
        if (totalFocusMinutes + totalDistractionMinutes === 0) return 0;
        
        return Math.round((totalFocusMinutes / (totalFocusMinutes + totalDistractionMinutes)) * 100);
    }

    
    function generateProductivityReport() {
        const analysis = analyzeProductivity();
        if (!analysis) return "Not enough data to generate a report.";
        
        return `Your productivity report:\n` +
            `- ساعات التركيز: ${analysis.productiveHours}\n` +
            `- ساعات التشتيت: ${analysis.distractionHours}\n` +
            `- متوسط استخدام وحدة المعالجة المركزية: ${analysis.avgCpu.toFixed(1)}%\n` +
            `- متوسط استخدام الذاكرة: ${analysis.avgMemory.toFixed(1)}%\n` +
            `- درجة الإنتاجية: ${analysis.productivityScore}%\n\n` +
            `نصائح لتحسين إنتاجيتك:\n` +
            `- ${getProductivityRecommendation(analysis)}`;
    }

    
    function getProductivityRecommendation(analysis) {
        if (analysis.productivityScore < 50) {
            return "إليك بعض التوصيات لتحسين إنتاجيتك:\n" +
                "- حاول تقليل استخدام التطبيقات المسببة للتشتت مثل وسائل التواصل الاجتماعي\n" +
                "- خصص أوقاتًا محددة للتركيز على المهام المهمة\n" +
                "- استخدم وضع التركيز عند العمل على المهام الحرجة";
        } else if (analysis.productivityScore < 75) {
            return "إليك بعض التوصيات لتحسين إنتاجيتك:\n" +
                "- حاول تحسين فترات التركيز الخاصة بك\n" +
                "- قلل من التبديل بين التطبيقات بشكل متكرر\n" +
                "- خصص وقتًا كافيًا للراحة بين فترات العمل";
        } else {
            return "أداء إنتاجيتك ممتاز! إليك بعض النصائح للحفاظ على هذا المستوى:\n" +
                "- استمر في استخدام أوقات التركيز بكفاءة\n" +
                "- تأكد من أخذ فترات راحة كافية\n" +
                "- حاول تحسين جودة العمل بدلًا من الكمية";
        }
    }

    
    Timer {
        id: usageDataCollector
        interval: 300000 
        repeat: true
        running: true
        onTriggered: collectUsageData()
    }

    
    Timer {
        id: productivityAnalyzer
        interval: 3600000 
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

    
    function saveProductivityData() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/home/user/.crosire/productivity.json";
            fs.write(JSON.stringify(productivityData));
        } catch (e) {
            console.error("فشل حفظ بيانات الإنتاجية:", e);
        }
    }

    
    function loadProductivityData() {
        try {
            const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            fs.source = "/home/user/.crosire/productivity.json";
            const data = fs.read();
            if (data) {
                productivityData = JSON.parse(data);
            }
        } catch (e) {
            console.error("فشل تحميل بيانات الإنتاجية:", e);
        }
    }

    
    Component.onCompleted: {
        loadProductivityData();
    }

    
    
    
    property var tasks: []
    property var taskCategories: ["عامة", "عمل", "دراسة", "شخصية"]

    
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
        
        
        scheduleTaskReminder(task);
        
        return task;
    }

    
    function deleteTask(taskId) {
        tasks = tasks.filter(task => task.id !== taskId);
        saveTasks();
    }

    
    function updateTask(taskId, updates) {
        const index = tasks.findIndex(task => task.id === taskId);
        if (index !== -1) {
            tasks[index] = {...tasks[index], ...updates};
            saveTasks();
            
            
            if (updates.dueDate) {
                scheduleTaskReminder(tasks[index]);
            }
        }
    }

    
    function completeTask(taskId, completed = true) {
        const index = tasks.findIndex(task => task.id === taskId);
        if (index !== -1) {
            tasks[index].completed = completed;
            tasks[index].completedAt = completed ? new Date().toISOString() : null;
            saveTasks();
        }
    }

    
    function scheduleTaskReminder(task) {
        const timeUntilDue = new Date(task.dueDate) - new Date();
        if (timeUntilDue > 0) {
            setTimeout(() => {
                notificationSystem.notificationReceived("Tasks", "تذكير بمهمة", 
                    "موعد انتهاء المهمة: " + task.description, "\uf021");
                
                
                crosireChatMessages.push({
                    message: "تذكير: موعد انتهاء المهمة '" + task.description + "' هو الآن!",
                    isUser: false
                });
            }, timeUntilDue - 3600000); 
        }
    }

    
    function saveTasks() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/home/user/.crosire/tasks.json";
            fs.write(JSON.stringify(tasks));
        } catch (e) {
            console.error("فشل حفظ المهام:", e);
        }
    }

    
    function loadTasks() {
        try {
            const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            fs.source = "/home/user/.crosire/tasks.json";
            const data = fs.read();
            if (data) {
                tasks = JSON.parse(data);
                
                
                tasks.forEach(task => {
                    if (!task.completed) {
                        scheduleTaskReminder(task);
                    }
                });
            }
        } catch (e) {
            console.error("فشل تحميل المهام:", e);
        }
    }

    
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

    
    function generateTaskReport() {
        const analysis = analyzeTasks();
        
        return `Task report:\n` +
            `- المهام المتأخرة: ${analysis.overdue}\n` +
            `- المهام اليوم: ${analysis.today}\n` +
            `- المهام غدًا: ${analysis.tomorrow}\n` +
            `- المهام الإجمالية: ${analysis.total}\n` +
            `- المهام المكتملة: ${analysis.completed}`;
    }

    
    Timer {
        id: taskAnalysisTimer
        interval: 3600000 
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

    
    Component.onCompleted: {
        loadTasks();
    }

    
    
    
    property var lightThemeColors: {
        "colors": [
            "#FFFFFF", "#C50F1F", "#00C214", "#C19C00", "#00A1F1", "#BB0099", "#00C2C2", "#333333",
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
        
        
        notificationSystem.notificationReceived("System", "تم تغيير الثيم", 
            "تم تطبيق ثيم " + themeName, "\uf042");
    }

    
    function applyContextualTheme() {
        const hour = new Date().getHours();
        
        
        if (hour >= 6 && hour < 18) {
            applyTheme("light");
        } else {
            applyTheme("dark");
        }
        
        
        if (systemMonitor.cpuUsage > 70) {
            applyTheme("performance");
        }
        
        
        const activeApps = getActiveApplications();
        if (activeApps.includes("video-editor")) {
            applyTheme("creative");
        }
    }

    
    Timer {
        id: contextualThemeTimer
        interval: 300000 
        repeat: true
        running: true
        onTriggered: applyContextualTheme()
    }

    
    property string openRouterApiKey: "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"

    
    FontLoader { id: faSolid; source: "qrc:/fonts/fa-solid-900.otf" }
    FontLoader { id: faRegular; source: "qrc:/fonts/fa-regular-400.otf" }
    FontLoader { id: faBrands; source: "qrc:/fonts/fa-brands-400.0tf" }
    
    
    FontLoader { id: ibmPlex; source: "qrc:/fonts/IBM-Plex-Sans-Thin.ttf" }
    
    
    property var pywalColors: {
        try {
            const fs = Qt.createQmlObject('import QtQuick 6.8; FileIO', root, "FileIO")
            fs.source = "qrc:/data/pywal.js"
            return JSON.parse(fs.read())
        } catch (e) {
            console.warn("لم يتم العثور على ألوان Pywal، يتم استخدام القيم الافتراضية")
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
    
    
    
    
    
    property bool isLocked: true                  
    property bool isAppLauncherOpen: false        
    property bool isPowerMenuOpen: false          
    property bool isNotificationCenterOpen: false 
    property bool isWakingUp: false               
    property string activeCapsule: ""             
    property int activeWorkspace: 1               
    property int totalWorkspaces: 10              
    property int visibleStart: 1                  
    property int maxVisible: 5                    
    property bool isDarkTheme: true               
    property int maxResults: 8                    
    property int debounceTime: 50                 

    
    
    
    property var conversationHistory: []
    property var userBehaviorPatterns: {}

    
    function saveConversation() {
        const db = LocalStorage.openDatabaseSync("Crosire", "1.0", "Conversation History", 100000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS conversations (id INTEGER PRIMARY KEY, timestamp TEXT, message TEXT, isUser BOOLEAN)');
            
            for (let i = 0; i < crosireChatMessages.length; i++) {
                tx.executeSql('INSERT INTO conversations (timestamp, message, isUser) VALUES (?, ?, ?)', 
                [new Date().toISOString(), crosireChatMessages[i].message, crosireChatMessages[i].isUser]);
            }
        });
    }

    
    
    
    
    property var notificationColors: [4, 5, 3, 2, 1, 5, 6, 4, 3, 2]
    
    
    property list<var> activeNotifications: []
    property int maxVisibleNotifications: 3
    property int notificationHeight: 70
    property int notificationSpacing: 10
    
    
    property var notificationTitles: [
        "System",
        "الرسائل",
        "البريد الإلكتروني",
        "التحديثات",
        "التقويم",
        "المنبه",
        "التنبيهات",
        "الرسائل",
        "البطارية"
    ]
    
    
    
    
    
    property var controlItems: [
        {icon: "\uf1eb", label: "الواي فاي", colorIndex: 5, active: true},
        {icon: "\uf293", label: "البلوتوث", colorIndex: 4, active: false},
        {icon: "\uf185", label: "الوضع المظلم", colorIndex: 6, active: true}
    ]
    
    
    property var appList: [
        {name: "Files", icon: "\uf15b", colorIndex: 4},
        {name: "Editor", icon: "\uf58d", colorIndex: 5},
        {name: "Browser", icon: "\uf268", colorIndex: 3},
        {name: "البريد", icon: "\uf0e0", colorIndex: 2},
        {name: "Music", icon: "\uf001", colorIndex: 1},
        {name: "الصور", icon: "\uf03e", colorIndex: 6},
        {name: "الفيديو", icon: "\uf03d", colorIndex: 4},
        {name: "Notes", icon: "\uf0f6", colorIndex: 5},
        {name: "الرسوم", icon: "\uf58d", colorIndex: 3},
        {name: "Projects", icon: "\uf187", colorIndex: 2}
    ]
    
    
    
    
    
    
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            
            if (clockCapsule) clockCapsule.label = Qt.formatTime(new Date(), "hh:mm")
        }
    }
    
    
    Timer {
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            getActiveWorkspace();
        }
    }
    
    
    NumberAnimation on x {
        id: workspaceScrollAnimation
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
    OpacityAnimation on opacity {
        id: fadeIn
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
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

    
    
    
    Component {
        id: islandComponent
        
        Item {
            id: islandBase
            property real islandHeight: 50
            property color islandColor: Qt.rgba(0, 0, 0, 0.8)
            property bool isFullRounded: true
            property real blurRadius: 32
            property real blurOpacity: 0.8
            
            
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: isFullRounded ? islandHeight / 2 : 15
                color: islandColor
                border.width: 0
                
                
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
            
            
            property real dynamicOpacity: 0.8
            
            
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
        
        fadeIn.target = root
        fadeIn.restart()
        statusBar.y = Screen.height
    }

    Item {
        Component.onCompleted: {
            
            var alacrittyConfig = fileIO.readFile("qrc:/config/alacritty.toml");
            console.log("Alacritty Config:", alacrittyConfig);

            
            var fastfetchConfig = fileIO.readFile("qrc:/config/config.jsonc");
            console.log("FastFetch Config:", fastfetchConfig);

            
            var hyprlandConfig = fileIO.readFile("qrc:/config/hyprland.conf");
            console.log("Hyprland Config:", hyprlandConfig);
        }
    }

    
    
    
    
    function getActiveWorkspace() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["activeworkspace"]);
            process.waitForFinished();
            const output = process.readAllStandardOutput().trim();
            
            if (output && output.includes("workspace ID")) {
                const workspaceId = output.split("workspace ID")[1].split(":")[0].trim();
                activeWorkspace = parseInt(workspaceId);
            }
        } catch (e) {
            console.error("فشل جلب مساحة العمل النشطة:", e);
        }
    }
    
    
    function switchWorkspace(workspaceId) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
        } catch (e) {
            console.error("فشل تغيير مساحة العمل:", e);
        }
    }
    
    
    
    
    property var currentUIContext: "default"

    
    function adaptUIContext() {
        const activeApp = getActiveApplication();
        
        
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
        
        
        const hour = new Date().getHours();
        if (hour >= 22 || hour < 6) {
            enableNightMode();
        }
    }

    
    function adaptVideoEditingUI() {
        
        statusBar.visible = false;
        
        videoEditingTools.visible = true;
        
        workspaceArea.scale = 1.1;
        
        applyTheme("creative");
        
        showToast("تم تفعيل وضع تحرير الفيديو", "\uf03d");
    }

    
    function adaptCodingUI() {
        
        ibmPlex.source = "qrc:/fonts/IBM-Plex-Mono-Thin.ttf";
        
        statusBar.height = 55;
        
        applyTheme("dark");
        
        showToast("تم تفعيل وضع البرمجة", "\uf121");
    }

    
    function adaptBrowsingUI() {
        
        statusBar.height = 65;
        
        applyTheme("light");
        
        showToast("تم تفعيل وضع التصفح", "\uf268");
    }

    
    function resetToDefaultUI() {
        
        statusBar.height = 50;
        
        ibmPlex.source = "qrc:/fonts/IBM-Plex-Sans-Thin.ttf";
        
        applyContextualTheme();
        
        statusBar.visible = true;
        videoEditingTools.visible = false;
    }

    
    Timer {
        id: uiContextTimer
        interval: 10000 
        repeat: true
        running: true
        onTriggered: adaptUIContext()
    }

    
    
    
    SecurityMonitor {
        id: securityMonitor
        updateInterval: 30000 
        
        onSuspiciousActivityDetected: {
            
            crosireSecurityAlert("نشاط مشبوه تم اكتشافه: " + activityDescription);
            
            
            crosireChatMessages.push({
                message: "تم اكتشاف نشاط مشبوه: " + activityDescription + 
                        ". هل تريد اتخاذ الإجراءات الأمنية التالية: " + recommendedActions.join(", "),
                isUser: false
            });
        }
    }

    
    function crosireSecurityAlert(message) {
        notificationSystem.notificationReceived("الأمان", "تنبيه أمني", message, "\uf023");
        logSecurityEvent(message);
    }

    
    function logSecurityEvent(message) {
        const timestamp = new Date().toISOString();
        const logEntry = `[${timestamp}] ${message}`;
        
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/var/log/crosire-security.log";
            fs.append(logEntry + "\n");
        } catch (e) {
            console.error("فشل تسجيل الحدث الأمني:", e);
        }
    }

    
    function checkForSuspiciousActivities() {
        try {
            
            const suspiciousPatterns = [
                /failed login/i,
                /unauthorized access/i,
                /suspicious port scan/i
            ];
            
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
            fs.source = "/var/log/auth.log";
            const logContent = fs.read();
        
            for (const pattern of suspiciousPatterns) {
                if (pattern.test(logContent)) {
                    securityMonitor.suspiciousActivityDetected("تم اكتشاف نمط مشبوه في سجلات النظام");
                    break;
                }
            }
            
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ps", ["aux"]);
            process.waitForFinished();
            const processOutput = process.readAllStandardOutput().trim();
            
            if (processOutput.includes("suspicious-process")) {
                securityMonitor.suspiciousActivityDetected("تم اكتشاف عملية مشبوهة");
            }
        } catch (e) {
            console.error("فشل فحص الأنشطة المشبوهة:", e);
        }
    }

    
    Timer {
        id: securityCheckTimer
        interval: 300000 
        repeat: true
        running: true
        onTriggered: checkForSuspiciousActivities()
    }

    
    
    
    Item {
        id: lockScreen
        anchors.fill: parent
        visible: isLocked
        color: "#000000"

        
        property bool isAODActive: false
        property bool isWakingUp: false
        property int aodDelay: 5000 
        property int largeClockSize: parent.height * 0.28
        property int smallClockSize: parent.height * 0.08

        
        Timer {
            id: aodTimer
            interval: aodDelay
            onTriggered: {
                if (isLocked && !isAODActive && !isWakingUp) {
                    enterAODMode()
                }
            }
        }

        
        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                clockDisplay.text = Qt.formatTime(new Date(), "hh:mm")
                if (!isAODActive && !isWakingUp) {
                    clockAnimation.to = largeClockSize
                    clockAnimation.restart()
                }
            }
        }

        
        
        

        
        Rectangle {
            id: aodIndicator
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: 10
            height: 10
            radius: 5
            color: isAODActive ? pywalColors.colors[6] : "#333333"
            opacity: isAODActive ? 1.0 : 0.3
            visible: isLocked
        }

        
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
            opacity: 0 

            
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
                text: "مرحباً، " + userName
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[5]
                horizontalAlignment: Text.AlignHCenter
                width: parent.width * 0.8
            }
        }

        
        property bool isUnlocking: false
        property real unlockProgress: 0.0

        
        NumberAnimation {
            id: unlockAnimation
            target: lockScreen
            property: "unlockProgress"
            from: 1.0
            to: 0.0
            duration: 450
            easing.type: Easing.OutCubic
            onRunningChanged: {
                if (!running && to == 0.0) {
                    
                }
            }
        }

        
        NumberAnimation {
            id: statusBarAnimation
            target: statusBar
            property: "y"
            from: Screen.height
            to: Screen.height - statusBar.height - 20
            duration: 350
            easing.type: Easing.OutBack
            onRunningChanged: {
                if (!running && to == Screen.height - statusBar.height - 20) {
                    
                }
            }
        }

        
            id: unlockEffect
            width: 0
            height: 0
            radius: width / 2
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
                to: Math.max(Screen.width, Screen.height) * 2
                easing.type: Easing.OutCubic
            }

            NumberAnimation on height {
                duration: 500
                from: 0
                to: Math.max(Screen.width, Screen.height) * 2
                easing.type: Easing.OutCubic
            }
        }

        
        
        

        
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
            opacity: 0 

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

        
        Rectangle {
            anchors.fill: parent
            radius: parent.height * 0.04
            color: "transparent"
            border.color: pywalColors.colors[7]
            border.width: 1
            visible: lockScreen.isAODActive
        }

        
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

        
        
        
        
        function enterAODModeMCX() {
            if (isLocked && !isWakingUp) {
                isAODActive = true;
                aodTimer.stop();

                
                largeClockFade.to = 0;
                largeClockFade.duration = 4; 
                largeClockFade.restart();

                userInfo.visible = false;
                userInfoFade.to = 0;
                userInfoFade.duration = 4;
                userInfoFade.restart();

                
                smallClockDisplay.visible = true;
                smallClockFade.to = 1;
                smallClockFade.duration = 4;
                smallClockFade.restart();

                
                aodLightEffect.start();
            }
        }

        function wakeUpFromAOD() {
            if (isAODActive) {
                isWakingUp = true;
                isAODActive = false;

                
                smallClockFade.to = 0;
                smallClockFade.restart();

                
                clockDisplay.visible = true;
                clockAnimation.to = largeClockSize;
                clockAnimation.restart();

                userInfo.visible = true;
                userInfoFade.to = 1;
                userInfoFade.restart();

                
                aodTimer.start();
                isWakingUp = false;
            }
        }

        
        
        
        
        MouseArea {
            anchors.fill: parent
            enabled: isAODActive
            onPressed: {
                wakeUpFromAOD()
            }
        }

        
        Keys.onPressed: {
            if (isAODActive) {
                wakeUpFromAOD()
            }
        }

        
        Component.onCompleted: {
            if (isLocked) {
                aodTimer.start()
            }
        }

        
            anchors.fill: parent
            color: "#000000"
        }

        
        
        
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (isLocked && !isAODActive) {
                    launcherCloseAnimation.onCompleted = function() {
                        isAppLauncherOpen = false
                    }
                    launcherCloseAnimation.restart()

                    
                    parent.children[0].scale = 0.95
                    setTimeout(function() {
                        parent.children[0].scale = 1.0
                    }, 100)
                }
            }
        }

        
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
                    
                    unlockAnimation.restart()
                }
            }

            
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

    
    
    
    Timer {
        id: autoOptimizeTimer
        interval: 600000 
        repeat: true
        running: true
        onTriggered: autoOptimizeSystem()
    }

    
    function cleanTemporaryFiles() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("rm", ["-rf", "/tmp/*"]);
            process.start("journalctl", ["--vacuum-size=100M"]);
            showToast("تم تنظيف الملفات المؤقتة", "\uf014");
        } catch (e) {
            console.error("فشل تنظيف الملفات المؤقتة:", e);
        }
    }

    
    function optimizeSystemPerformance() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("sysctl", ["vm.swappiness=10"]);
            process.start("sysctl", ["vm.vfs_cache_pressure=50"]);
            showToast("تم تحسين أداء النظام", "\uf085");
        } catch (e) {
            console.error("فشل تحسين أداء النظام:", e);
        }
    }

    
    
    
    
    Item {
        id: statusBar
        width: parent.width
        height: 50
        anchors.top: parent.top
        z: 999
        
        
        Rectangle {
            id: statusBarBackground
            anchors.fill: parent
            color: "#000000"
            opacity: 0.7
            
            
            GlassMorphismEffect {
                radius: 20
                intensity: 0.7
                enabled: true
            }
        }
        
        
        RowLayout {
            id: capsuleLayout
            anchors.fill: parent
            anchors.margins: 5
            spacing: 10

        Item {
            id: capsuleLayout
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.7
            height: 60
            spacing: 10 

            
            Repeater {
                model: ["arch", "activeWindow", "workspaces", "music", "keyboard", "network", "volume", "battery", "clock", "crosire", "notifire", "settings", "power"]
                delegate: Capsule {
                    id: capsule
                    icon: "\uf017" 
                    label: modelData === "clock" ? "الساعة" : ""
                    colorIndex: index % 6
                    capsuleId: modelData
                    width: 100
                    height: 50
                    x: index * (100 + 10) 

                    
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

                        
                        ScriptAction {
                            script: {
                                for (let i = 0; i < capsuleLayout.children.length; i++) {
                                    let child = capsuleLayout.children[i];
                                    if (child !== capsule && child.x > capsule.x) {
                                        moveCapsule(child, child.x, child.x + 350);
                                    }
                                }
                            }
                        }
                    }

                    
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

                        
                        ScriptAction {
                            script: {
                                for (let i = 0; i < capsuleLayout.children.length; i++) {
                                    let child = capsuleLayout.children[i];
                                    if (child !== capsule && child.x > capsule.x) {
                                        moveCapsule(child, child.x, child.x - 350);
                                    }
                                }
                            }
                        }
                    }

                    
                    onClicked: {
                        if (!isExpanded) {
                            
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }

                            
                            expandAnimation.restart();
                            isExpanded = true;
                        } else {
                            
                            collapseAnimation.restart();
                            isExpanded = false;
                        }
                    }
                }
            }

            
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
            
            
            property int debounceTime: 50 
            property int maxResults: 8
            property var searchTimer: null
            property bool isProcessing: false
            
            
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
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2
                color: "#000000"
                border.width: 0
                
                
                Text {
                    anchors.centerIn: parent
                    text: archCapsule.icon
                    font.family: faBrands.name
                    font.pixelSize: 20
                    color: pywalColors.colors[colorIndex]
                }
            }
            
            
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
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                
                onEntered: {
                    if (!isExpanded) {
                        hoverAnimation.running = true;
                    }
                }
                
                onExited: {
                    hoverAnimation.to = 1.0;
                    hoverAnimation.running = true;
                    if (!isExpanded) capsuleBase.scale = 1.0;
                }
                
                onClicked: {
                    if (!isExpanded) {
                        
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        
                        expandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        
                        archContent.visible = true;
                        archContent.opacity = 0;
                        fadeInAnimation.target = archContent;
                        fadeInAnimation.restart();
                        
                        
                        searchInput.forceActiveFocus();
                    } else {
                        
                        archCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        
                        fadeOutAnimation.target = archContent;
                        fadeOutAnimation.onCompleted = function() {
                            archContent.visible = false;
                        };
                        fadeOutAnimation.restart();
                    }
                }
            }
            
            
            
            
            Item {
                id: archContent
                anchors.fill: parent
                visible: false
                opacity: 0
                
                
                Item {
                    id: islandContainer
                    width: parent.width * 0.9
                    height: 50
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    
                    
                    Rectangle {
                        id: islandBackground
                        anchors.fill: parent
                        radius: 25
                        color: Qt.rgba(0, 0, 0, 0.85)
                        border.width: 0
                        
                        
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
                            placeholderText: "البحث عن التطبيقات، الملفات، الإعدادات..."
                            placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                            selectByMouse: true
                            focus: false
                            maximumLength: 100
                            
                            
                            onTextChanged: {
                                if (isProcessing) return;
                                
                                searchQuery = text;
                                activeResultIndex = -1;
                                
                                if (searchTimer) {
                                    clearTimeout(searchTimer);
                                }
                                
                                if (text.length > 0) {
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
                            
                            
                            Keys.onReturnPressed: {
                                event.accepted = true;
                                if (activeResultIndex >= 0 && activeResultIndex < searchResults.length) {
                                    executeResult(searchResults[activeResultIndex]);
                                }
                            }
                            
                            
                            Keys.onEscapePressed: {
                                event.accepted = true;
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        }
                    }
                }
                
                
                ListView {
                    id: resultsList
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width * 0.85
                    height: Math.min(maxResults * 50, searchResults.length * 50)
                    model: searchResults.length > 0 && showResults ? searchResults : null
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
                    
                    
                    OpacityAnimation on opacity {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 0
                        to: 1
                    }
                }
            }
            
            
            OpacityAnimation {
                id: fadeInAnimation
                from: 0
                to: 1
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            
            OpacityAnimation {
                id: fadeOutAnimation
                from: 1
                to: 0
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            
            
            
            
            
            function performSearch(query) {
                if (query.length === 0) {
                    searchResults = [];
                    showResults = false;
                    return;
                }
                
                const startTime = performance.now();
                
                
                searchResults = [];
                showResults = true;
                
                
                const apps = searchApplications(query);
                searchResults = searchResults.concat(apps.map(app => ({
                    type: "app",
                    title: app.name,
                    subtitle: "تطبيق",
                    icon: app.icon,
                    action: function() {
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("exec", [app.exec]);
                        } catch (e) {
                            console.error("فشل تشغيل التطبيق:", e);
                        }
                    }
                })));
                
                
                property var apps: loadDesktopApps("/usr/share/applications");

                function loadDesktopApps(path) {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("ls", [path]);
                    process.waitForFinished();
                    const files = process.readAllStandardOutput().trim().split("\n");
                    
                    const appList = [];
                    for (const file of files) {
                        if (file.endsWith(".desktop")) {
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

                
                function loadDesktopApps() {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("depender", ["list", "-j"]);
                    process.waitForFinished();
                    
                    if (process.exitCode() === 0) {
                        const output = process.readAllStandardOutput().trim();
                        try {
                            return JSON.parse(output);
                        } catch (e) {
                            console.error("فشل تحليل مخرجات Depender:", e);
                        }
                    }
                    return [];
                }

                
                function runApp(appName) {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("depender", ["run", appName]);
                }

                
                const files = searchFiles(query);
                searchResults = searchResults.concat(files.map(file => ({
                    type: "file",
                    title: file.name,
                    subtitle: file.path,
                    icon: "\uf15b",
                    action: function() {
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xdg-open", [file.path]);
                        } catch (e) {
                            console.error("فشل فتح الملف:", e);
                        }
                    }
                })));
                
                
                const settings = searchSettings(query);
                searchResults = searchResults.concat(settings.map(setting => ({
                    type: "setting",
                    title: setting.title,
                    subtitle: setting.section,
                    icon: "\uf013",
                    action: function() {
                        
                        try {
                            loader.source = "qrc:/SettingsApp/SettingsApp.qml";
                            settingsApp.activeTab = setting.tab;
                            isAppLauncherOpen = false;
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        } catch (e) {
                            console.error("فشل فتح الإعدادات:", e);
                        }
                    }
                })));
                
                
                if (query.length >= 3) { 
                    searchPackages(query);
                }
                
                
                const commands = processCommands(query);
                if (commands) {
                    searchResults.unshift({
                        type: "command",
                        title: commands.title,
                        subtitle: commands.description,
                        icon: "\uf120",
                        action: commands.action
                    });
                }
                
                
                searchResults = searchResults.slice(0, maxResults);
                
                
                const endTime = performance.now();
                const duration = endTime - startTime;
                console.log(`البحث استغرق ${duration.toFixed(2)}ms`);
                
                
                if (duration > 5) {
                    console.warn(`تحذير: وقت البحث تجاوز 5ms (${duration.toFixed(2)}ms)`);
                }
            }
            
            
            function searchApplications(query) {
                try {
                    const apps = [];
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    
                    
                    process.start("find", ["/usr/share/applications", "-name", "*.desktop"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput().trim();
                    
                    const desktopFiles = output.split('\n');
                    for (const file of desktopFiles) {
                        if (!file) continue;
                        
                        
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
                            apps.push({ name, exec, icon });
                        }
                    }
                    
                    return apps;
                } catch (e) {
                    console.error("فشل البحث عن التطبيقات:", e);
                    return [];
                }
            }
            
            
            function searchFiles(query) {
                try {
                    const files = [];
                    const homeDir = "/home/" + Qt.application.arguments[2];
                    
                    
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
                            process.waitForFinished(500); 
                            
                            if (process.running) {
                                process.kill();
                                continue;
                            }
                            
                            const output = process.readAllStandardOutput().trim();
                            const foundFiles = output.split('\n');
                            
                            for (const file of foundFiles) {
                                if (!file) continue;
                                
                                const fileName = file.split('/').pop();
                                files.push({
                                    name: fileName,
                                    path: file
                                });
                                
                                
                                if (files.length >= maxResults) break;
                            }
                            
                            
                            if (files.length >= maxResults) break;
                        } catch (e) {
                            console.error("فشل البحث في المجلد:", dir, e);
                        }
                    }
                    
                    return files;
                } catch (e) {
                    console.error("فشل البحث عن الملفات:", e);
                    return [];
                }
            }
            
            
            function searchSettings(query) {
                const settings = [];
                const lowerQuery = query.toLowerCase();
                
                
                if ("شاشة".includes(lowerQuery) || "display".includes(lowerQuery) || 
                    "سطوع".includes(lowerQuery) || "brightness".includes(lowerQuery) ||
                    "دقة".includes(lowerQuery) || "resolution".includes(lowerQuery)) {
                    settings.push({
                        title: "إعدادات الشاشة",
                        section: "الشاشة والعرض",
                        tab: "display"
                    });
                }
                
                
                if ("صوت".includes(lowerQuery) || "volume".includes(lowerQuery) || 
                    "ميكروفون".includes(lowerQuery) || "microphone".includes(lowerQuery)) {
                    settings.push({
                        title: "إعدادات الصوت",
                        section: "الصوت والصورة",
                        tab: "audio"
                    });
                }
                
                
                if ("شبكة".includes(lowerQuery) || "network".includes(lowerQuery) || 
                    "واي فاي".includes(lowerQuery) || "wifi".includes(lowerQuery) ||
                    "بلوتوث".includes(lowerQuery) || "bluetooth".includes(lowerQuery)) {
                    settings.push({
                        title: "إعدادات الشبكة",
                        section: "الاتصال",
                        tab: "network"
                    });
                }
                
                
                if ("بطارية".includes(lowerQuery) || "battery".includes(lowerQuery) || 
                    "طاقة".includes(lowerQuery) || "power".includes(lowerQuery)) {
                    settings.push({
                        title: "إعدادات البطارية",
                        section: "الطاقة",
                        tab: "power"
                    });
                }
                
                
                if ("أنميشن".includes(lowerQuery) || "animation".includes(lowerQuery) || 
                    "حركة".includes(lowerQuery) || "motion".includes(lowerQuery)) {
                    settings.push({
                        title: "إعدادات الأنميشنات",
                        section: "التجربة البصرية",
                        tab: "animations"
                    });
                }
                
                return settings;
            }
            
            
            function searchPackages(query) {
                try {
                    
                    const pacmanProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    pacmanProcess.start("pacman", ["-Ss", query]);
                    pacmanProcess.waitForFinished(1000); 
                    
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
                                    subtitle: "حزمة Pacman - " + pkgDesc,
                                    icon: "\uf17c",
                                    action: function() {
                                        try {
                                            const termProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                            termProcess.start("alacritty", ["-e", "sudo", "pacman", "-S", "--noconfirm", pkgName]);
                                        } catch (e) {
                                            console.error("فشل فتح الطرفية:", e);
                                        }
                                    }
                                });
                                
                                
                                if (searchResults.length >= maxResults) return;
                            }
                        }
                    }
                    
                    
                    const aurProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    aurProcess.start("yay", ["-Ss", query]);
                    aurProcess.waitForFinished(1000); 
                    
                    if (aurProcess.exitCode() === 0) {
                        const output = aurProcess.readAllStandardOutput().trim();
                        const lines = output.split('\n');
                        
                        for (const line of lines) {
                            if (line.startsWith("aur/")) {
                                const parts = line.split(' ');
                                const pkgName = parts[0].replace("aur/", "");
                                const pkgDesc = parts.slice(1).join(' ');
                                
                                searchResults.push({
                                    type: "package",
                                    title: pkgName,
                                    subtitle: "حزمة AUR - " + pkgDesc,
                                    icon: "\uf17c",
                                    action: function() {
                                        try {
                                            const termProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                            termProcess.start("alacritty", ["-e", "yay", "-S", "--noconfirm", pkgName]);
                                        } catch (e) {
                                            console.error("فشل فتح الطرفية:", e);
                                        }
                                    }
                                });
                                
                                
                                if (searchResults.length >= maxResults) return;
                            }
                        }
                    }
                } catch (e) {
                    console.error("فشل البحث عن الحزم:", e);
                }
            }
            
            
            function processCommands(query) {
                const lowerQuery = query.toLowerCase();
                
                
                const timerMatch = lowerQuery.match(/^(ضبط|اضافة|انشاء|start)\s+(\d+)\s*(ثانية|دقيقة|ساعة|second|minute|hour)/);
                if (timerMatch) {
                    const amount = parseInt(timerMatch[2]);
                    const unit = timerMatch[3];
                    let seconds = 0;
                    
                    if (unit.includes("ثانية") || unit === "second") {
                        seconds = amount;
                    } else if (unit.includes("دقيقة") || unit === "minute") {
                        seconds = amount * 60;
                    } else if (unit.includes("ساعة") || unit === "hour") {
                        seconds = amount * 3600;
                    }
                    
                    if (seconds > 0) {
                        return {
                            title: `مؤقت ${amount} ${unit}`,
                            description: `سيتم تنبيهك بعد ${amount} ${unit}`,
                            action: function() {
                                
                                clockExpanded.activeTimer = {
                                    id: Date.now(),
                                    endTime: Date.now() + (seconds * 1000),
                                    isActive: true,
                                    paused: false,
                                    soundPath: "/usr/share/sounds/classic-alarm.wav"
                                };
                                clockExpanded.checkDynamicIsland();
                                
                                
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        };
                    }
                }
                
                
                const alarmMatch = lowerQuery.match(/^(ضبط|اضافة|انشاء|set)\s+المنبه\s+ل\s+(\d{1,2}):(\d{2})/);
                if (alarmMatch) {
                    const hour = parseInt(alarmMatch[2]);
                    const minute = parseInt(alarmMatch[3]);
                    
                    if (hour >= 0 && hour <= 23 && minute >= 0 && minute <= 59) {
                        return {
                            title: `منبه ${hour}:${minute}`,
                            description: `سيتم تنبيهك عند الساعة ${hour}:${minute}`,
                            action: function() {
                                
                                clockExpanded.alarms.push({
                                    id: Date.now(),
                                    time: `${hour < 10 ? '0' : ''}${hour}:${minute < 10 ? '0' : ''}${minute}`,
                                    label: "منبه مخصص",
                                    days: [true, true, true, true, true, true, true],
                                    isActive: true,
                                    soundPath: "/usr/share/sounds/classic-alarm.wav"
                                });
                                
                                
                                archCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }
                        };
                    }
                }
                
                
                if (lowerQuery.includes("Pause التشغيل") || lowerQuery.includes("shutdown")) {
                    return {
                        title: "Pause التشغيل",
                        description: "Pause تشغيل الجهاز",
                        action: function() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("systemctl", ["poweroff"]);
                            } catch (e) {
                                console.error("فشل إيقاف التشغيل:", e);
                            }
                            
                            
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        }
                    };
                }
                
                
                if (lowerQuery.includes("إعادة التشغيل") || lowerQuery.includes("reboot")) {
                    return {
                        title: "إعادة التشغيل",
                        description: "إعادة تشغيل الجهاز",
                        action: function() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("systemctl", ["reboot"]);
                            } catch (e) {
                                console.error("فشل إعادة التشغيل:", e);
                            }
                            
                            
                            archCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                        }
                    };
                }
                
                return null;
            }
            
            
            function executeResult(result) {
                if (result && result.action) {
                    result.action();
                }
            }
            
            
            
            
            
            
            Component {
                id: searchResultComponent
                
                Item {
                    id: searchResult
                    property var result
                    property bool isActive: false
                    width: parent.width
                    height: 50
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        radius: 15
                        color: searchResult.isActive ? 
                            Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1) : 
                            "#000000"
                        border.width: 0
                    }
                    
                    
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: searchResult.result.icon
                        font.family: searchResult.result.type === "package" ? faBrands.name : faSolid.name
                        font.pixelSize: 18
                        color: pywalColors.colors[5]
                    }
                    
                    
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

        
        
        
        Keys.onPressed: {
            
            if (event.key === Qt.Key_Meta && !isExpanded && activeCapsule === "") {
                archCapsule.onClicked();
                event.accepted = true;
            }
            
            
            if (event.key === Qt.Key_Escape && isExpanded) {
                archCollapseAnimation.restart();
                isExpanded = false;
                activeCapsule = "";
                event.accepted = true;
            }
        }
            
        
        
        
        Capsule {
            id: activeWindowCapsule
            icon: "\uf2d2" 
            label: activeWindowName || "سطح المكتب"
            colorIndex: 3
            capsuleId: "activeWindow"
            width: activeWindowCapsule.implicitWidth + 20
            
            property string activeWindowName: "سطح المكتب"
            property string activeWindowIcon: "\uf10c" 
            
            
            function getActiveWindowInfo() {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("hyprctl", ["activewindow"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput().trim();
                    
                    if (output && output.includes("class:")) {
                        const className = output.split("class:")[1].split("\n")[0].trim();
                        activeWindowName = className;
                        
                        
                        console.log("تفاصيل النافذة النشطة:", activeWindowName);
                    }
                } catch (e) {
                    console.error("فشل جلب معلومات النافذة النشطة:", e);
                }
            }
            
            
            Timer {
                interval: 1000
                repeat: true
                running: true
                onTriggered: getActiveWindowInfo()
            }
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: 25
                color: "#000000"
                border.width: 0
                layer.enabled: isExpanded || isAnimating
                layer.smooth: isExpanded
                layer.effect: isExpanded ? dropShadowEffect : null

                onVisibleChanged: {
                    if (!visible) {
                        layer.enabled = false;
                    }
                }

                
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

            
            
            
            Capsule {
                icon: "\uf001"  
                label: musicPlayer.isPlaying ? "يُشغّل" : "متوقف"
                colorIndex: 6
                capsuleId: "music"
                width: 120
                height: 50
                property bool isExpanded: false

                
                property bool isPlaying: false
                property string currentTitle: "لا توجد موسيقى قيد التشغيل"
                property string currentArtist: ""
                property double progress: 0.0
                property double duration: 180.0 
                property double position: 0.0

                
                ScaleAnimation on scale {
                    id: musicHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
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

                
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }

                
                onClicked: {
                    if (!isExpanded) {
                        
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }

                        
                        musicExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;

                        
                        musicPlayerExpanded.visible = true;
                        musicPlayerExpanded.z = 100;
                        
                        
                        musicPlayerExpanded.musicDataTimer.running = true;
                        musicPlayerExpanded.updateMusicDisplay();
                    } else {
                        
                        musicCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";

                        
                        musicPlayerExpanded.visible = false;
                        musicPlayerExpanded.musicDataTimer.running = false;
                    }
                }

                
                
                
                Item {
                    id: musicPlayerExpanded
                    anchors.fill: parent
                    visible: false
                    z: 100

                    
                    Timer {
                        id: musicDataTimer
                        interval: 1000
                        repeat: true
                        running: false
                        onTriggered: {
                            updateMusicData();
                        }
                    }

                    
                    function updateMusicData() {
                        try {
                            
                            const dbus = Qt.createQmlObject('import Qt.labs.dbus 6.8; DBus', root, "DBus");
                            const players = getAvailablePlayers();
                            
                            if (players.length > 0) {
                                const player = players[0];
                                
                                
                                currentTitle = getTrackTitle(player);
                                currentArtist = getArtist(player);
                                duration = getDuration(player);
                                position = getPosition(player);
                                progress = duration > 0 ? position / duration : 0;
                                isPlaying = isPlaying(player);
                                
                                
                                musicCapsule.label = isPlaying ? "يُشغّل" : "متوقف";
                                
                                
                                if (visible) {
                                    updateMusicDisplay();
                                }
                            } else {
                                
                                currentTitle = "لا توجد موسيقى قيد التشغيل";
                                currentArtist = "";
                                progress = 0.0;
                                isPlaying = false;
                                musicCapsule.label = "متوقف";
                                
                                if (visible) {
                                    updateMusicDisplay();
                                }
                            }
                        } catch (e) {
                            console.error("فشل تحديث بيانات الموسيقى:", e);
                        }
                    }

                    
                    function updateMusicDisplay() {
                        if (!visible) return;
                        
                        
                        musicTitle.text = currentTitle;
                        musicArtist.text = currentArtist;
                        
                        
                        progressBar.width = musicProgressContainer.width * progress;
                        
                        
                        playPauseButton.icon = isPlaying ? "\uf04c" : "\uf04b"; 
                    }

                    
                    
                    
                    Rectangle {
                        id: musicContainer
                        anchors.fill: parent
                        color: "#000000"
                        visible: false
                        z: 100

                        
                        FastBlur {
                            anchors.fill: parent
                            source: parent
                            radius: 32
                            opacity: 0.8
                        }

                        
                        ColumnLayout {
                            anchors.centerIn: parent
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 20
                            width: parent.width * 0.8

                            
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
                                    width: musicProgressContainer.width * progress
                                }

                                
                                RowLayout {
                                    anchors.top: musicProgressContainer.bottom
                                    anchors.topMargin: 5
                                    width: parent.width
                                    spacing: 20

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

                            
                            RowLayout {
                                spacing: 25
                                Layout.alignment: Qt.AlignHCenter

                                
                                MusicButton {
                                    icon: "\uf048"
                                    tooltip: "Previous track"
                                    onClicked: {
                                        previousTrack();
                                        updateMusicData();
                                    }
                                }

                                
                                MusicButton {
                                    id: playPauseButton
                                    icon: isPlaying ? "\uf04c" : "\uf04b"
                                    tooltip: isPlaying ? "Pause" : "Play"
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

                                
                                MusicButton {
                                    icon: "\uf051"
                                    tooltip: "Next track"
                                    onClicked: {
                                        nextTrack();
                                        updateMusicData();
                                    }
                                }
                            }
                        }
                    }

                    
                    
                    
                    
                    function formatTime(seconds) {
                        if (!seconds || isNaN(seconds)) return "0:00";
                        let minutes = Math.floor(seconds / 60);
                        let remainingSeconds = Math.floor(seconds % 60);
                        return minutes + ":" + (remainingSeconds < 10 ? "0" : "") + remainingSeconds;
                    }

                    
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
                        } catch (e) {
                            console.error("فشل جلب مشغلات الموسيقى:", e);
                            return [];
                        }
                    }

                    
                    function getTrackTitle(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            
                            const metadata = parseMetadata(output);
                            return metadata["xesam:title"] || "عنوان غير معروف";
                        } catch (e) {
                            console.error("فشل جلب عنوان المسار:", e);
                            return "عنوان غير معروف";
                        }
                    }

                    
                    function getArtist(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            
                            const metadata = parseMetadata(output);
                            const artist = metadata["xesam:artist"] || "فنان غير معروف";
                            return Array.isArray(artist) ? artist[0] : artist;
                        } catch (e) {
                            console.error("فشل جلب اسم الفنان:", e);
                            return "فنان غير معروف";
                        }
                    }

                    
                    function getDuration(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Metadata"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            
                            const metadata = parseMetadata(output);
                            const durationMicroseconds = metadata["mpris:length"] || 0;
                            return durationMicroseconds / 1000000; 
                        } catch (e) {
                            console.error("فشل جلب مدة المسار:", e);
                            return 180; 
                        }
                    }

                    
                    function getPosition(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "Position"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            
                            const positionMicroseconds = parseInt(output);
                            return positionMicroseconds / 1000000;
                        } catch (e) {
                            console.error("فشل جلب الموقع الحالي:", e);
                            return 0;
                        }
                    }

                    
                    function isPlaying(player) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [player, "/org/mpris/MediaPlayer2", "org.freedesktop.DBus.Properties.Get", "org.mpris.MediaPlayer2.Player", "PlaybackStatus"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            return output.includes("Playing");
                        } catch (e) {
                            console.error("فشل جلب حالة التشغيل:", e);
                            return false;
                        }
                    }

                    
                    function playTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if (players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Play"]);
                            process.waitForFinished();
                        } catch (e) {
                            console.error("فشل تشغيل المسار:", e);
                        }
                    }

                    
                    function pauseTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if (players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Pause"]);
                            process.waitForFinished();
                        } catch (e) {
                            console.error("فشل إيقاف المسار:", e);
                        }
                    }

                    
                    function previousTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if (players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Previous"]);
                            process.waitForFinished();
                        } catch (e) {
                            console.error("فشل الانتقال للمسار السابق:", e);
                        }
                    }

                    
                    function nextTrack() {
                        try {
                            const players = getAvailablePlayers();
                            if (players.length === 0) return;
                            
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("qdbus", [players[0], "/org/mpris/MediaPlayer2", "org.mpris.MediaPlayer2.Player.Next"]);
                            process.waitForFinished();
                        } catch (e) {
                            console.error("فشل الانتقال للمسار التالي:", e);
                        }
                    }

                    
                    function parseMetadata(metadataOutput) {
                        try {
                            const result = {};
                            const lines = metadataOutput.split('\n');
                            
                            for (let i = 0; i < lines.length; i++) {
                                if (lines[i].includes("variant")) {
                                    const key = lines[i - 1].trim();
                                    const value = lines[i + 1].trim();
                                    
                                    if (key.includes("xesam:") || key.includes("mpris:")) {
                                        
                                        let cleanValue = value.replace(/"/g, '').trim();
                                        
                                        
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
                        } catch (e) {
                            console.error("فشل تحليل بيانات الميتا:", e);
                            return {};
                        }
                    }
                }
            }

            
            
            
            Item {
                id: MusicButton
                property string icon
                property string tooltip
                width: 35
                height: 35
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 17
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: MusicButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                    
                    
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            parent.scale = 1.05
                        }
                        onReleased: {
                            parent.scale = 1.0
                        }
                        onClicked: {
                            if (MusicButton.onClicked) {
                                MusicButton.onClicked()
                            }
                        }
                        onEntered: {
                            if (MusicButton.tooltip) {
                                showTooltip(MusicButton.tooltip, mouseX, mouseY)
                            }
                        }
                        onExited: {
                            hideTooltip()
                        }
                    }
                }
            }

            
            
            
            function showTooltip(text, x, y) {
                tooltipText.text = text
                tooltip.visible = true
                tooltip.x = x + 10
                tooltip.y = y - 30
            }

            function hideTooltip() {
                tooltip.visible = false
            }

            
            
            
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

            
            
            
            Capsule {
                icon: "\uf111" 
                label: activeWorkspace.toString()
                colorIndex: 6
                capsuleId: "workspaces"
                width: 180
                height: 50
                property int activeWorkspace: 1
                property int visibleStart: 1
                property int maxVisible: 5
                property int totalWorkspaces: 10
                
                
                property bool isDragging: false
                property var draggingWindow: null
                property var currentWorkspace: null
                property var windowUnderDrag: null
                
                
                ScaleAnimation on scale {
                    id: workspacesHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }
                
                
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

                
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
                
                
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    hoverEnabled: true
                    onClicked: {
                        workspacesOverlay.showWorkspaces();
                    }
                }
                
                
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        if (!isExpanded) {
                            
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            
                            workspacesExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            
                            workspacesExpanded.visible = true;
                            workspacesExpanded.z = 100;
                        } else {
                            
                            workspacesCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                            
                            
                            workspacesExpanded.visible = false;
                        }
                    }
                }
                
                
                
                
                Item {
                    id: workspacesExpanded
                    anchors.fill: parent
                    visible: false
                    z: 100
                    
                    
                    Timer {
                        id: workspaceTimer
                        interval: 500
                        repeat: true
                        running: false
                        onTriggered: {
                            getActiveWorkspace();
                            updateWorkspacesDisplay();
                        }
                    }
                    
                    
                    function getActiveWorkspace() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["activeworkspace"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            if (output && output.includes("workspace ID")) {
                                const workspaceId = parseInt(output.split("workspace ID")[1].trim().split(" ")[0]);
                                if (!isNaN(workspaceId)) {
                                    activeWorkspace = workspaceId;
                                    return workspaceId;
                                }
                            }
                        } catch (e) {
                            console.error("فشل جلب مساحة العمل النشطة:", e);
                        }
                        return 1;
                    }
                    
                    
                    function getWorkspacesInfo() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["workspaces"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            
                            const workspaces = [];
                            const lines = output.split('\n');
                            
                            for (let i = 0; i < lines.length; i++) {
                                if (lines[i].includes("workspace ID")) {
                                    const workspaceId = parseInt(lines[i].split("workspace ID")[1].trim().split(" ")[0]);
                                    const windows = [];
                                    
                                    
                                    for (let j = i + 1; j < lines.length; j++) {
                                        if (lines[j].includes("workspace ID")) break;
                                        if (lines[j].includes("class:")) {
                                            const className = lines[j].split("class:")[1].trim().split(" ")[0];
                                            const title = lines[j].split("title:")[1].trim();
                                            windows.push({ className, title });
                                        }
                                    }
                                    
                                    workspaces.push({
                                        id: workspaceId,
                                        windows: windows,
                                        active: lines[i].includes("active")
                                    });
                                }
                            }
                            
                            
                            workspaces.sort((a, b) => a.id - b.id);
                            
                            return workspaces;
                        } catch (e) {
                            console.error("فشل جلب معلومات مساحات العمل:", e);
                            return Array.from({length: totalWorkspaces}, (_, i) => ({
                                id: i + 1,
                                windows: i === 0 ? [{ className: "Shell", title: "Desind" }] : [],
                                active: i === 0
                            }));
                        }
                    }
                    
                    
                    function updateWorkspacesDisplay() {
                        const workspaces = getWorkspacesInfo();
                        
                        
                        workspacesGrid.model = workspaces;
                        
                        
                        workspacesCapsule.activeWorkspace = getActiveWorkspace();
                        workspacesCapsule.label = workspacesCapsule.activeWorkspace.toString();
                    }
                    
                    
                    function switchWorkspace(workspaceId) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
                            process.waitForFinished();
                            
                            
                            activeWorkspace = workspaceId;
                            workspacesCapsule.activeWorkspace = workspaceId;
                            workspacesCapsule.label = workspaceId.toString();
                            
                            
                            workspacesCollapseAnimation.restart();
                            workspacesCapsule.isExpanded = false;
                            activeCapsule = "";
                            workspacesExpanded.visible = false;
                        } catch (e) {
                            console.error("فشل تغيير مساحة العمل:", e);
                        }
                    }
                    
                    
                    function moveWindowToWorkspace(windowClass, workspaceId) {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["dispatch", "movetoworkspace", workspaceId.toString(), windowClass]);
                            process.waitForFinished();
                            
                            
                            updateWorkspacesDisplay();
                        } catch (e) {
                            console.error("فشل تحريك النافذة إلى مساحة العمل:", e);
                        }
                    }
                    
                    
                    function startDragging(windowItem) {
                        isDragging = true;
                        draggingWindow = windowItem;
                        windowUnderDrag = windowItem.parent.parent;
                        
                        
                        windowItem.parent.scale = 1.1;
                        windowItem.parent.z = 100;
                    }
                    
                    
                    function stopDragging() {
                        isDragging = false;
                        if (draggingWindow) {
                            draggingWindow.parent.scale = 1;
                            draggingWindow.parent.z = 0;
                            draggingWindow = null;
                            windowUnderDrag = null;
                        }
                    }
                    
                    
                    
                    
                    Rectangle {
                        id: workspacesContainer
                        anchors.fill: parent
                        color: "#000000"
                        visible: false
                        z: 100
                        
                        
                        FastBlur {
                            anchors.fill: parent
                            source: parent
                            radius: 32
                            opacity: 0.8
                        }
                        
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 20
                            
                            
                            Text {
                                text: "مساحات العمل"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                                Layout.alignment: Qt.AlignHCenter
                            }
                            
                            
                            RowLayout {
                                spacing: 10
                                Layout.alignment: Qt.AlignHCenter
                                
                                
                                WorkspaceButton {
                                    icon: "\uf060" 
                                    onClicked: {
                                        if (visibleStart > 1) {
                                            visibleStart = Math.max(1, visibleStart - 1);
                                            workspaceScrollAnimation.to = -((visibleStart - 1) * 80);
                                            workspaceScrollAnimation.restart();
                                        }
                                    }
                                }
                                
                                
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
                                
                                
                                WorkspaceButton {
                                    icon: "\uf061" 
                                    onClicked: {
                                        if (visibleStart < totalWorkspaces - maxVisible + 1) {
                                            visibleStart = Math.min(totalWorkspaces - maxVisible + 1, visibleStart + 1);
                                            workspaceScrollAnimation.to = -((visibleStart - 1) * 80);
                                            workspaceScrollAnimation.restart();
                                        }
                                    }
                                }
                            }
                            
                            
                            Item {
                                id: workspacesScroller
                                width: parent.width
                                height: 120
                                clip: true
                                
                                GridView {
                                    id: workspacesGrid
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
                                        opacity: workspacesExpanded.isDragging && windowUnderDrag === parent ? 0.5 : 1
                                    }
                                }
                                
                                
                                NumberAnimation on x {
                                    id: workspaceScrollAnimation
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                }
                            }
                        }
                    }
                }
            }

            
            
            
            Component {
                id: workspaceItemComponent
                
                Item {
                    id: workspaceItem
                    property int index: 0
                    property bool active: false
                    property var windows: []
                    width: parent.width
                    height: parent.height
                    
                    
                    Rectangle {
                        id: workspaceCircle
                        anchors.centerIn: parent
                        width: 25
                        height: 25
                        radius: 12.5
                        color: index + 1 === workspacesCapsule.activeWorkspace ? 
                            Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2) : 
                            Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        border.width: 0
                        
                        
                        Text {
                            anchors.centerIn: parent
                            text: (index + 1).toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 12
                            color: index + 1 === workspacesCapsule.activeWorkspace ? 
                                pywalColors.colors[6] : 
                                Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                        }
                    }
                    
                    
                    Item {
                        id: windowsArea
                        anchors.top: workspaceCircle.bottom
                        anchors.topMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 40
                        height: 40
                        
                        
                        Repeater {
                            model: parent.parent.windows || []
                            delegate: WindowItem {
                                index: modelIndex
                                totalWindows: parent.parent.windows.length
                                windowData: modelData
                                width: 30
                                height: 30
                                visible: modelIndex < 4 
                                onDragStart: {
                                    workspacesExpanded.startDragging(parent)
                                }
                                onDragEnd: {
                                    workspacesExpanded.stopDragging()
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
                    
                    
                    Rectangle {
                        id: dragOverlay
                        anchors.fill: parent
                        color: "#000000"
                        opacity: 0.4
                        visible: workspacesExpanded.isDragging && windowUnderDrag === parent
                        radius: 15
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "إسقاط هنا"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            workspacesExpanded.switchWorkspace(index + 1);
                        }
                        onDoubleClicked: {
                            workspacesExpanded.switchWorkspace(index + 1);
                        }
                        onEntered: {
                            if (index + 1 !== workspacesCapsule.activeWorkspace) {
                                workspaceCircle.scale = 1.2;
                            }
                        }
                        onExited: {
                            if (index + 1 !== workspacesCapsule.activeWorkspace) {
                                workspaceCircle.scale = 1.0;
                            }
                        }
                    }
                }
            }

            
            
            
            Component {
                id: windowItemComponent
                
                Item {
                    id: windowItem
                    property int index: 0
                    property int totalWindows: 0
                    property var windowData: null
                    width: parent.width
                    height: parent.height
                    
                    
                    property real positionX: {
                        const angle = (index / totalWindows) * 2 * Math.PI - Math.PI / 2;
                        return Math.cos(angle) * 15;
                    }
                    property real positionY: {
                        const angle = (index / totalWindows) * 2 * Math.PI - Math.PI / 2;
                        return Math.sin(angle) * 15;
                    }
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        anchors.horizontalCenter: parent.positionX
                        anchors.verticalCenter: parent.positionY
                        width: 20
                        height: 20
                        radius: 10
                        color: "#000000"
                        border.width: 0
                        
                        
                        Text {
                            anchors.centerIn: parent
                            text: "\uf10c" 
                            font.family: faSolid.name
                            font.pixelSize: 12
                            color: pywalColors.colors[7]
                        }
                    }
                    
                    
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            
                            windowItem.scale = 1.05
                            windowItem.parent.parent.parent.parent.startDragging(windowItem)
                        }
                        onReleased: {
                            windowItem.scale = 1.0
                            windowItem.parent.parent.parent.parent.stopDragging()
                        }
                        onPositionChanged: {
                            if (windowItem.parent.parent.parent.parent.isDragging) {
                                
                                x = mouse.x - width / 2
                                y = mouse.y - height / 2
                            }
                        }
                    }
                }
            }

            
            
            
            Component {
                id: workspaceButtonComponent
                
                Item {
                    id: workspaceButton
                    property string icon
                    width: 40
                    height: 40
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        radius: 20
                        color: "#000000"
                        border.width: 0
                        
                        
                        Text {
                            anchors.centerIn: parent
                            text: workspaceButton.icon
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        
                        ScaleAnimation on scale {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 1.0
                            to: 1.05
                            running: false
                        }
                        
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onPressed: {
                                parent.scale = 1.05
                            }
                            onReleased: {
                                parent.scale = 1.0
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

            
            
            
            Item {
                id: workspacesOverlay
                anchors.fill: parent
                visible: false
                z: 998
                property bool isDragging: false
                property var draggingWindow: null
                property var currentWorkspace: null
                property var windowUnderDrag: null

                
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                    opacity: 0.7
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            workspacesOverlay.visible = false;
                            
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

                
                Rectangle {
                    id: workspacesContent
                    width: parent.width * 0.9
                    height: parent.height * 0.6
                    radius: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    color: "#000000"
                    border.width: 0
                    opacity: 0.92

                    
                    FastBlur {
                        anchors.fill: parent
                        source: parent
                        radius: 25
                        opacity: 0.7
                    }

                    
                    Rectangle {
                        width: parent.width
                        height: 60
                        color: "#000000"
                        border.width: 0

                        Text {
                            anchors.centerIn: parent
                            text: "مساحات العمل"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 20
                            color: pywalColors.colors[6]
                        }

                        
                        MouseArea {
                            anchors.right: parent.right
                            anchors.rightMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            width: 40
                            height: 40
                            onClicked: {
                                workspacesOverlay.visible = false;
                                
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
                                    text: "\uf00d" 
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[6]
                                }
                            }
                        }
                    }

                    
                    GridView {
                        id: workspacesGrid
                        anchors.top: titleBar.bottom
                        anchors.topMargin: 15
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        cellWidth: (parent.width * 0.85) / 5
                        cellHeight: (parent.height * 0.6 - 85) / 2
                        model: 10
                        delegate: WorkspaceItemOverlay {
                            index: modelData
                            width: parent.cellWidth
                            height: parent.cellHeight
                            opacity: isDragging ? (modelData === currentIndex ? 1 : 0.5) : 1
                        }
                    }
                }

                
                function loadWorkspacesInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["workspaces"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        
                        const workspaces = [];
                        const lines = output.split('\n');
                        
                        for (let i = 0; i < lines.length; i++) {
                            if (lines[i].includes("workspace ID")) {
                                const workspaceId = parseInt(lines[i].split("workspace ID")[1].trim().split(" ")[0]);
                                const windows = [];
                                
                                
                                for (let j = i + 1; j < lines.length; j++) {
                                    if (lines[j].includes("workspace ID")) break;
                                    if (lines[j].includes("class:")) {
                                        const className = lines[j].split("class:")[1].trim().split(" ")[0];
                                        const title = lines[j].split("title:")[1].trim();
                                        windows.push({ className, title });
                                    }
                                }
                                
                                workspaces.push({
                                    id: workspaceId,
                                    windows: windows,
                                    active: lines[i].includes("active")
                                });
                            }
                        }
                        
                        
                        workspacesGrid.model = workspaces;
                        
                    } catch (e) {
                        console.error("فشل جلب معلومات مساحات العمل:", e);
                        
                        workspacesGrid.model = Array.from({length: 10}, (_, i) => ({
                            id: i + 1,
                            windows: i % 2 === 0 ? [{ className: "Code", title: "main.qml" }] : [],
                            active: i === 0
                        }));
                    }
                }

                
                function updateWorkspaceWindow(workspaceId, windowClass, windowTitle) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["dispatch", "movetoworkspace", workspaceId.toString(), windowClass]);
                        process.waitForFinished();
                        
                        
                        loadWorkspacesInfo();
                    } catch (e) {
                        console.error("فشل تحديث مساحة العمل:", e);
                    }
                }

                
                function activateWorkspace(workspaceId) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["dispatch", "workspace", workspaceId.toString()]);
                        process.waitForFinished();
                        
                        
                        workspacesOverlay.visible = false;
                    } catch (e) {
                        console.error("فشل تنشيط مساحة العمل:", e);
                    }
                }

                
                function showWorkspaces() {
                    
                    for (let i = 0; i < capsuleLayout.children.length; i++) {
                        let child = capsuleLayout.children[i];
                        if (child.isExpanded) {
                            child.collapseAnimation.restart();
                            child.isExpanded = false;
                        }
                    }
                    
                    
                    loadWorkspacesInfo();
                    
                    
                    visible = true;
                }

                
                function startDragging(windowItem) {
                    isDragging = true;
                    draggingWindow = windowItem;
                    windowUnderDrag = windowItem.parent.parent;
                    
                    
                    windowItem.parent.scale = 1.1;
                    windowItem.parent.z = 100;
                }

                
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

            
            
            
            Component {
                id: workspaceItemOverlayComponent
                
                Item {
                    id: workspaceItem
                    property int index: 0
                    property bool active: false
                    property var windows: []
                    width: parent.width
                    height: parent.height
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        radius: 15
                        color: active ? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1) : "#000000"
                        border.width: 0
                        
                        
                        Text {
                            anchors.top: parent.top
                            anchors.topMargin: 15
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: (index + 1).toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 24
                            color: active ? pywalColors.colors[6] : pywalColors.colors[7]
                        }
                        
                        
                        ColumnLayout {
                            anchors.top: titleText.bottom
                            anchors.topMargin: 15
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            spacing: 10
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
                    
                    
                    Rectangle {
                        id: dragOverlay
                        anchors.fill: parent
                        color: "#000000"
                        opacity: 0.4
                        visible: workspacesOverlay.isDragging && parent.parent.index === workspacesOverlay.currentIndex
                        radius: 15
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "إسقاط هنا"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                        }
                    }
                    
                    
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

            
            
            
            Component {
                id: windowItemOverlayComponent
                
                Item {
                    id: windowItem
                    property var windowData: null
                    width: parent.width
                    height: parent.height
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        radius: 10
                        color: "#000000"
                        border.width: 0
                        
                        
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                            text: "\uf10c" 
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        
                        Text {
                            anchors.left: iconText.right
                            anchors.leftMargin: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text: windowData ? windowData.title : "نافذة"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 14
                            color: pywalColors.colors[7]
                            width: parent.width * 0.7
                            elide: Text.ElideRight
                        }
                        
                        
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
                    
                    
                    ScaleAnimation on scale {
                        duration: 50
                        easing.type: Easing.OutQuart
                        from: 1.0
                        to: 1.05
                        running: false
                    }
                    
                    
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onPressed: {
                            
                            windowItem.scale = 1.05
                            workspacesOverlay.startDragging(windowItem)
                        }
                        onReleased: {
                            windowItem.scale = 1.0
                            workspacesOverlay.stopDragging()
                        }
                        onPositionChanged: {
                            if (workspacesOverlay.isDragging) {
                                
                                x = mouse.x - width / 2
                                y = mouse.y - height / 2
                            }
                        }
                    }
                }
            }

            
            
            
            Capsule {
                id: keyboardCapsule
                icon: "\uf11c" 
                label: "EN" "AR"
                colorIndex: 5
                capsuleId: "keyboard"
                width: 80
                
                property var layouts: ["EN", "AR"]
                property int currentLayoutIndex: 0
                
                
                function getCurrentLayout() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("hyprctl", ["devices"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        if (output && output.includes("keyboard:")) {
                            const keyboardInfo = output.split("keyboard:")[1].split("================================")[0];
                            if (keyboardInfo.includes("active keymap:")) {
                                const keymap = keyboardInfo.split("active keymap:")[1].split("\n")[0].trim();
                                currentLayoutIndex = layouts.indexOf(keymap.toUpperCase()) !== -1 ? 
                                                   layouts.indexOf(keymap.toUpperCase()) : 0;
                                label = layouts[currentLayoutIndex];
                            }
                        }
                    } catch (e) {
                        console.error("فشل جلب تخطيط لوحة المفاتيح:", e);
                    }
                }
                
                
                Timer {
                    interval: 2000
                    repeat: true
                    running: true
                    onTriggered: {
                        getCurrentLayout();
                        keyboardCapsule.label = layouts[currentLayoutIndex];
                    }
                }
                
                
                ScaleAnimation on scale {
                    target: parent
                    from: 1
                    to: 1.02
                    duration: 50
                    easing.type: Easing.OutQuart
                    running: false
                }
            }
            
            
            function changeKeyboardLayout(index) {
                try {
                    
                    cppIntegration.asyncCall("keyboard.changeLayout", index, function(success) {
                        if (success) {
                            currentLayout = index === 0 ? "EN" : "AR";
                            label = currentLayout;
                            console.log("تم تغيير تخطيط لوحة المفاتيح بنجاح");
                        }
                    });
                } catch (e) {
                    console.error("فشل تغيير تخطيط لوحة المفاتيح:", e);
                }
            }
            
            
            
            
            Capsule {
                icon: "\uf017"  
                label: Qt.formatTime(new Date(), "hh:mm")
                colorIndex: 4
                capsuleId: "clock"
                width: 180
                height: 50
                property bool isExpanded: false
                property bool isDynamicIslandActive: false
                property string dynamicIslandSource: ""  
                property var activeTimer: null
                property var activeStopwatch: null
                
                
                ScaleAnimation on scale {
                    id: clockHoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }
                
                
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
                
                
                Timer {
                    id: dynamicIslandTimer
                    interval: 5000
                    repeat: true
                    running: false
                    onTriggered: {
                        if (isDynamicIslandActive) {
                            activeTab = dynamicIslandSource === "timer" ? "timer" : "stopwatch";
                        } else {
                            activeTab = "clock";
                        }
                    }
                }
                
                
                onClicked: {
                    if (!isExpanded) {
                        
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        
                        clockExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        
                        clockExpanded.visible = true;
                        clockExpanded.z = 100;
                        
                        
                        checkDynamicIsland();
                        
                        
                        clockExpanded.timeUpdateTimer.running = true;
                    } else {
                        
                        clockCollapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        
                        clockExpanded.visible = false;
                        clockExpanded.timeUpdateTimer.running = false;
                        dynamicIslandTimer.running = false;
                    }
                }
                
                
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
                    
                    
                    clockCapsule.icon = isDynamicIslandActive ? 
                                        (dynamicIslandSource === "timer" ? "\uf2f2" : "\uf2f8") : 
                                        "\uf017";
                }

                
                Timer {
                    id: timeUpdateTimer
                    interval: 1000
                    repeat: true
                    running: false
                    onTriggered: {
                        updateTimeDisplay();
                        checkDynamicIsland();
                    }
                    
                    
                    property var activeTimer: null
                    
                    
                    property var activeStopwatch: {
                        isRunning: false,
                        startTime: 0,
                        elapsedTime: 0,
                        laps: []
                    }
                    
                    
                    function updateTimeDisplay() {
                        
                        mainClockText.text = Qt.formatTime(new Date(), "hh:mm");
                        dateText.text = Qt.formatDate(new Date(), "dd MMMM yyyy");
                        
                        
                        if (activeTimer && activeTimer.isActive) {
                            const remainingTime = activeTimer.endTime - Date.now();
                            if (remainingTime > 0) {
                                const hours = Math.floor(remainingTime / 3600000);
                                const minutes = Math.floor((remainingTime % 3600000) / 60000);
                                const seconds = Math.floor((remainingTime % 60000) / 1000);
                                
                                timerDisplayText.text = 
                                    (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                                    (minutes < 10 ? "0" + minutes : minutes) + ":" +
                                    (seconds < 10 ? "0" + seconds : seconds);
                            } else {
                                timerDisplayText.text = "00:00:00";
                                activeTimer.isActive = false;
                                playAlarm();
                            }
                        }
                        
                        
                        if (activeStopwatch.isRunning) {
                            const currentTime = Date.now();
                            activeStopwatch.elapsedTime = currentTime - activeStopwatch.startTime;
                            updateStopwatchDisplay();
                        }
                    }
                    
                    
                    function playAlarm() {
                        try {
                            const alarmSound = activeTimer.soundPath || "/usr/share/sounds/classic-alarm.wav";
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("aplay", [alarmSound]);
                        } catch (e) {
                            console.error("فشل تشغيل صوت المنبه:", e);
                        }
                    }
                    
                    
                    function updateStopwatchDisplay() {
                        const totalMs = activeStopwatch.elapsedTime;
                        const hours = Math.floor(totalMs / 3600000);
                        const minutes = Math.floor((totalMs % 3600000) / 60000);
                        const seconds = Math.floor((totalMs % 60000) / 1000);
                        const milliseconds = Math.floor((totalMs % 1000) / 10);
                        
                        stopwatchDisplayText.text = 
                            (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                            (minutes < 10 ? "0" + minutes : minutes) + ":" +
                            (seconds < 10 ? "0" + seconds : seconds) + "." +
                            (milliseconds < 10 ? "0" + milliseconds : milliseconds);
                    }
                    
                    
                    function getHijriDate(date) {
                        
                        
                        const hijriYear = date.getFullYear() - 584;
                        const hijriMonth = date.getMonth() + 1;
                        const hijriDay = date.getDate();
                        
                        return hijriDay + " " + getHijriMonthName(hijriMonth) + " " + hijriYear;
                    }
                    
                    
                    function getHijriMonthName(month) {
                        const months = [
                            "محرم", "صفر", "ربيع الأول", "ربيع الثاني",
                            "جمادى الأولى", "جمادى الآخرة", "رجب", "شعبان",
                            "رمضان", "شوال", "ذو القعدة", "ذو الحجة"
                        ];
                        return months[month - 1] || "";
                    }
                }

                
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 20
                    width: parent.width * 0.8
                            
                    
                    Item {
                        width: parent.width
                        height: 80
                                
                        
                        Text {
                            id: mainClockText
                            text: Qt.formatTime(new Date(), "hh:mm")
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 40
                            color: pywalColors.colors[4]
                            Layout.alignment: Qt.AlignHCenter
                        }
                                
                        
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

                    
                    
                    
                    Item {
                        id: clockExpanded
                        anchors.fill: parent
                        visible: false
                        z: 100

                    
                    Item {
                        id: islandContainer
                        width: parent.width * 0.9
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        
                        Rectangle {
                            id: islandBackground
                            anchors.fill: parent
                            radius: 25
                            color: Qt.rgba(0, 0, 0, 0.85)
                            border.width: 0
                            
                            
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

                        
                        RowLayout {
                            id: tabBar
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 20
                            height: 50
                            
                            
                            TabButton {
                                icon: "\uf017"
                                active: activeTab === "clock"
                                onClicked: activeTab = "clock"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf0f3"
                                active: activeTab === "alarms"
                                onClicked: activeTab = "alarms"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf2f2"
                                active: activeTab === "timer"
                                onClicked: activeTab = "timer"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf2f8"
                                active: activeTab === "stopwatch"
                                onClicked: activeTab = "stopwatch"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf133"
                                active: activeTab === "calendar"
                                onClicked: activeTab = "calendar"
                                height: 50
                                width: 50
                            }
                        }
                        
                        
                        Item {
                            id: tabContent
                            Layout.fillWidth: true
                            height: 200
                            
                            
                            Item {
                                id: clockTab
                                anchors.fill: parent
                                visible: activeTab === "clock"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 15
                                    
                                    
                                    Rectangle {
                                        id: timeZoneInfo
                                        width: parent.width
                                        height: 60
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: "المنطقة الزمنية: " + Intl.DateTimeFormat().resolvedOptions().timeZone
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[4]
                                        }
                                        
                                        
                                        RowLayout {
                                            spacing: 10
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            TimeZoneButton {
                                                timeZone: "Asia/Riyadh"
                                                label: "الرياض"
                                            }
                                            
                                            TimeZoneButton {
                                                timeZone: "Europe/London"
                                                label: "لندن"
                                            }
                                            
                                            TimeZoneButton {
                                                timeZone: "America/New_York"
                                                label: "نيويورك"
                                            }
                                        }
                                        
                                        
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
                                
                                
                                Item {
                                    id: alarmsTab
                                    anchors.fill: parent
                                    visible: activeTab === "alarms"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 15
                                        
                                        
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
                                        
                                        
                                        Button {
                                            text: "إضافة منبه"
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
                                
                                
                                Item {
                                    id: timerTab
                                    anchors.fill: parent
                                    visible: activeTab === "timer"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 20
                                        
                                        
                                        Text {
                                            id: timerDisplayText
                                            text: "00:00:00"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 40
                                            color: pywalColors.colors[4]
                                            Layout.alignment: Qt.AlignHCenter
                                            Layout.fillWidth: true
                                        }
                                        
                                        
                                        RowLayout {
                                            spacing: 10
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            TimerButton {
                                                text: "ساعة"
                                                value: 3600000
                                            }
                                            
                                            TimerButton {
                                                text: "دقيقة"
                                                value: 60000
                                            }
                                            
                                            TimerButton {
                                                text: "ثانية"
                                                value: 1000
                                            }
                                        }
                                        
                                        
                                        RowLayout {
                                            spacing: 15
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            ControlButton {
                                                icon: "\uf04b" 
                                                enabled: clockExpanded.activeTimer && clockExpanded.activeTimer.isActive
                                                onClicked: {
                                                    stopTimer();
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: activeTimer && activeTimer.isActive ? "\uf04c" : "\uf04b" 
                                                onClicked: {
                                                    if (activeTimer && activeTimer.isActive) {
                                                        pauseTimer();
                                                    } else {
                                                        startTimer();
                                                    }
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: "\uf01e" 
                                                enabled: clockExpanded.activeTimer && (clockExpanded.activeTimer.isActive || clockExpanded.activeTimer.paused)
                                                onClicked: {
                                                    resetTimer();
                                                }
                                            }
                                        }
                                        
                                        
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
                                                text: "صوت المنبه:"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[4]
                                            }
                                            
                                            Text {
                                                id: alarmSoundText
                                                anchors.right: parent.right
                                                anchors.rightMargin: 15
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: activeTimer ? (activeTimer.soundPath || "كلاسيكي") : "كلاسيكي"
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
                                
                                
                                Item {
                                    id: stopwatchTab
                                    anchors.fill: parent
                                    visible: activeTab === "stopwatch"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 20
                                        
                                        
                                        Text {
                                            id: stopwatchDisplayText
                                            text: "00:00:00.00"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 40
                                            color: pywalColors.colors[4]
                                            Layout.alignment: Qt.AlignHCenter
                                            Layout.fillWidth: true
                                        }
                                        
                                        
                                        RowLayout {
                                            spacing: 15
                                            Layout.alignment: Qt.AlignHCenter
                                            
                                            ControlButton {
                                                icon: "\uf0e2" 
                                                enabled: activeStopwatch.isRunning
                                                onClicked: {
                                                    addLap();
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: activeStopwatch.isRunning ? "\uf04c" : "\uf04b" 
                                                onClicked: {
                                                    if (activeStopwatch.isRunning) {
                                                        stopStopwatch();
                                                    } else {
                                                        startStopwatch();
                                                    }
                                                }
                                            }
                                            
                                            ControlButton {
                                                icon: "\uf01e" 
                                                enabled: activeStopwatch.elapsedTime > 0
                                                onClicked: {
                                                    resetStopwatch();
                                                }
                                            }
                                        }
                                        
                                        
                                        ListView {
                                            id: lapsList
                                            width: parent.width
                                            height: 120
                                            model: activeStopwatch.laps
                                            delegate: LapItem {
                                                lapNumber: index + 1
                                                lapTime: modelData
                                            }
                                            clip: true
                                            visible: activeStopwatch.laps.length > 0
                                        }
                                    }
                                }
                                
                                
                                Item {
                                    id: calendarTab
                                    anchors.fill: parent
                                    visible: activeTab === "calendar"
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 20
                                        
                                        
                                        Rectangle {
                                            id: gregorianDate
                                            width: parent.width
                                            height: 60
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "التاريخ الميلادي: " + Qt.formatDate(new Date(), "dd MMMM yyyy")
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[4]
                                            }
                                        }
                                        
                                        
                                        Rectangle {
                                            id: hijriDate
                                            width: parent.width
                                            height: 60
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                            
                                            Text {
                                                anchors.centerIn: parent
                                                text: "التاريخ الهجري: " + clockExpanded.getHijriDate(new Date())
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[6]
                                            }
                                        }
                                        
                                        
                                        Rectangle {
                                            id: holidaysInfo
                                            width: parent.width
                                            height: 80
                                            radius: 15
                                            color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                            
                                            Column {
                                                anchors.centerIn: parent
                                                spacing: 5
                                                
                                                Text {
                                                    text: "العيد القريب: عيد الفطر"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[5]
                                                }
                                                
                                                Text {
                                                    text: "بعد 25 يوماً"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 14
                                                    color: pywalColors.colors[5]
                                                }
                                            }
                                        }
                                        
                                        
                                        GridView {
                                            id: calendarGrid
                                            width: parent.width
                                            height: 150
                                            cellWidth: parent.width / 7
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
                    
                    
                    
                    
                    
                    
                    property list<var> timeZones: [
                        {timeZone: "Asia/Riyadh", label: "الرياض"},
                        {timeZone: "Asia/Dubai", label: "دبي"},
                        {timeZone: "Asia/Tokyo", label: "طوكيو"},
                        {timeZone: "Australia/Sydney", label: "سيدني"},
                        {timeZone: "Europe/Berlin", label: "برلين"},
                        {timeZone: "Europe/Paris", label: "باريس"},
                        {timeZone: "Europe/Moscow", label: "موسكو"},
                        {timeZone: "America/Los_Angeles", label: "لوس أنجلوس"},
                        {timeZone: "America/Chicago", label: "شيكاغو"},
                        {timeZone: "Pacific/Honolulu", label: "هونولولو"}
                    ]
                    
                    property list<var> alarms: []
                    property var selectedAlarm: null
                    property var soundPath: ""
                    
                    
                    function addNewAlarm() {
                        selectedAlarm = {
                            id: Date.now(),
                            time: "07:00",
                            label: "منبه الصباح",
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
                        if (index !== -1) {
                            alarms.splice(index, 1);
                        }
                    }
                    
                    function toggleAlarm(alarm) {
                        alarm.isActive = !alarm.isActive;
                    }
                    
                    function saveAlarm() {
                        const index = alarms.findIndex(a => a.id === selectedAlarm.id);
                        if (index !== -1) {
                            alarms[index] = selectedAlarm;
                        } else {
                            alarms.push(selectedAlarm);
                        }
                        selectedAlarm = null;
                    }
                    
                    
                    function startTimer() {
                        if (!activeTimer) {
                            activeTimer = {
                                id: Date.now(),
                                endTime: Date.now() + 60000, 
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
                            activeTimer.endTime = Date.now() + 60000; 
                            activeTimer.isActive = false;
                            activeTimer.paused = false;
                        }
                    }
                    
                    function addTimeToTimer(value) {
                        if (!activeTimer) {
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
                    
                    
                    function startStopwatch() {
                        if (!activeStopwatch.isRunning) {
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
                    
                    
                    function openSoundSelector() {
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("zenity", ["--file-selection", "--title=اختر ملف الصوت", "--file-filter=الصوت (*.mp3 *.wav)"]);
                            process.waitForFinished();
                            const output = process.readAllStandardOutput().trim();
                            
                            if (output) {
                                soundPath = output;
                                if (activeTimer) {
                                    activeTimer.soundPath = output;
                                }
                                alarmSoundText.text = output.split('/').pop();
                            }
                        } catch (e) {
                            console.error("فشل اختيار ملف الصوت:", e);
                            showToast("فشل اختيار ملف الصوت", "\uf071");
                        }
                    }
                    
                    
                    function showAlarmEditor() {
                        alarmEditor.visible = true;
                        alarmEditor.z = 200;
                    }
                    
                    function closeAlarmEditor() {
                        alarmEditor.visible = false;
                    }
                    
                    
                    
                    
                    
                    Component {
                        id: tabButtonComponent
                        
                        Item {
                            id: tabButton
                            property string icon
                            property bool active: false
                            width: 45
                            height: 45
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 22.5
                                color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                                
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: tabButton.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 18
                                    color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                            }
                            
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    if (tabButton.onClicked) {
                                        tabButton.onClicked();
                                    }
                                }
                                onEntered: {
                                    if (!active) {
                                        parent.scale = 1.05;
                                    }
                                }
                                onExited: {
                                    if (!active) {
                                        parent.scale = 1.0;
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Component {
                        id: timeZoneButtonComponent
                        
                        Item {
                            id: timeZoneButton
                            property string timeZone
                            property string label
                            width: 100
                            height: 40
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 20
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: timeZoneButton.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[7]
                                }
                            }
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
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
                                    
                                    if (!timeZoneList.model.some(tz => tz.timeZone === timeZone)) {
                                        timeZoneList.model = [...timeZoneList.model, {timeZone, label}];
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Component {
                        id: timeZoneItemComponent
                        
                        Item {
                            id: timeZoneItem
                            property string timeZone
                            property string label
                            width: parent.width
                            height: 40
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: timeZoneItem.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                }
                                
                                
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
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
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
                                    
                                    const index = timeZoneList.model.findIndex(tz => tz.timeZone === timeZone);
                                    if (index !== -1) {
                                        const newModel = [...timeZoneList.model];
                                        newModel.splice(index, 1);
                                        timeZoneList.model = newModel;
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Component {
                        id: timerButtonComponent
                        
                        Item {
                            id: timerButton
                            property string text
                            property int value
                            width: 80
                            height: 40
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 20
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: timerButton.text
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[4]
                                }
                            }
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
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
                    
                    
                    Component {
                        id: controlButtonComponent
                        
                        Item {
                            id: controlButton
                            property string icon
                            property bool enabled: true
                            width: 50
                            height: 50
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 25
                                color: enabled ? "#000000" : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.1)
                                border.color: enabled ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2) : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: controlButton.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 20
                                    color: enabled ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                }
                            }
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
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
                    
                    
                    Component {
                        id: alarmItemComponent
                        
                        Item {
                            id: alarmItem
                            property var alarm
                            width: parent.width
                            height: 60
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                                border.color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.2) : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: alarm.time
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 20
                                    color: alarm.isActive ? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                                
                                
                                Text {
                                    anchors.left: timeText.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: alarm.label
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: alarm.isActive ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                }
                                
                                
                                Text {
                                    anchors.right: parent.right
                                    anchors.rightMargin: 45
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf044"
                                    font.family: faSolid.name
                                    font.pixelSize: 16
                                    color: pywalColors.colors[6]
                                }
                                
                                
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
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    alarmExpanded.visible = true;
                                    alarmExpanded.alarm = alarm;
                                }
                                
                                
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
                                            if (alarmItem.onEdit) {
                                                alarmItem.onEdit();
                                            }
                                        }
                                    }
                                }
                                
                                
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
                                            if (alarmItem.onDelete) {
                                                alarmItem.onDelete();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    Component {
                        id: lapItemComponent
                    
                        Item {
                            id: lapItem
                            property int lapNumber
                            property int lapTime
                            width: parent.width
                            height: 30
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: "#000000"
                                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.left: parent.left
                                    anchors.leftMargin: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "لفة " + lapNumber
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 14
                                    color: pywalColors.colors[7]
                                }
                                
                                
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
                    
                    
                    Component {
                        id: calendarDayComponent
                        
                        Item {
                            id: calendarDay
                            property int day
                            property bool isToday: false
                            width: parent.cellWidth
                            height: parent.cellHeight
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 15
                                color: isToday ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                                border.color: isToday ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                                border.width: 0
                                
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: day > 0 ? day.toString() : ""
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: isToday ? pywalColors.colors[4] : pywalColors.colors[7]
                                }
                            }
                        }
                    }
                    
                    
                    Item {
                        id: alarmEditor
                        anchors.fill: parent
                        visible: false
                        z: 200
                        
                        
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
                        
                        
                        Rectangle {
                            id: alarmEditorContent
                            width: parent.width * 0.8
                            height: 300
                            radius: 20
                            anchors.centerIn: parent
                            color: "#000000"
                            border.width: 0
                            opacity: 0.92
                            
                            
                            FastBlur {
                                anchors.fill: parent
                                source: parent
                                radius: 25
                                opacity: 0.7
                            }
                            
                            
                            Text {
                                anchors.top: parent.top
                                anchors.topMargin: 20
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: selectedAlarm ? "تعديل المنبه" : "إضافة منبه جديد"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 20
                                color: pywalColors.colors[4]
                            }
                            
                            
                            ColumnLayout {
                                anchors.top: titleText.bottom
                                anchors.topMargin: 30
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.margins: 20
                                spacing: 20
                                
                                
                                RowLayout {
                                    spacing: 10
                                    Layout.alignment: Qt.AlignHCenter
                                    
                                    TimePicker {
                                        id: hourPicker
                                        min: 0
                                        max: 23
                                        value: selectedAlarm ? parseInt(selectedAlarm.time.split(':')[0]) : 7
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
                                        value: selectedAlarm ? parseInt(selectedAlarm.time.split(':')[1]) : 0
                                    }
                                }
                                
                                
                                Rectangle {
                                    height: 40
                                    radius: 20
                                    color: "#000000"
                                    Layout.fillWidth: true
                                    
                                    TextInput {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        text: selectedAlarm ? selectedAlarm.label : "منبه الصباح"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: pywalColors.colors[7]
                                        placeholderText: "اسم المنبه"
                                        selectByMouse: true
                                        onAccepted: {
                                            if (selectedAlarm) {
                                                selectedAlarm.label = text;
                                            }
                                        }
                                    }
                                }
                                
                                
                                Rectangle {
                                    height: 50
                                    radius: 20
                                    color: "#000000"
                                    Layout.fillWidth: true
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 10
                                        spacing: 5
                                        
                                        Repeater {
                                            model: ["ح", "ن", "ث", "ر", "خ", "ج", "س"]
                                            delegate: DaySelector {
                                                dayIndex: index
                                                label: modelData
                                                active: selectedAlarm ? selectedAlarm.days[index] : (index < 5)
                                            }
                                        }
                                    }
                                }
                                
                                
                                RowLayout {
                                    spacing: 20
                                    Layout.alignment: Qt.AlignHCenter
                                    
                                    Button {
                                        text: "إلغاء"
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
                                        text: "حفظ"
                                        width: 100
                                        height: 40
                                        radius: 20
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        border.color: pywalColors.colors[4]
                                        border.width: 0
                                        onClicked: {
                                            if (!selectedAlarm) {
                                                selectedAlarm = {
                                                    id: Date.now(),
                                                    time: hourPicker.value + ":" + (minutePicker.value < 10 ? "0" : "") + minutePicker.value,
                                                    label: alarmNameInput.text || "منبه جديد",
                                                    days: daySelectors.map(d => d.active),
                                                    isActive: true,
                                                    soundPath: soundPath || "/usr/share/sounds/classic-alarm.wav"
                                                };
                                            } else {
                                                selectedAlarm.time = hourPicker.value + ":" + (minutePicker.value < 10 ? "0" : "") + minutePicker.value;
                                                selectedAlarm.label = alarmNameInput.text || "منبه جديد";
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

            
            
            
            Item {
                id: TabButton
                property string icon
                property bool active: false
                width: 45
                height: 45
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 22.5
                    color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: TabButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 18
                        color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
                
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        if (TabButton.onClicked) {
                            TabButton.onClicked();
                        }
                    }
                    onEntered: {
                        if (!active) {
                            parent.scale = 1.05;
                        }
                    }
                    onExited: {
                        if (!active) {
                            parent.scale = 1.0;
                        }
                    }
                }
            }

            
            
            
            Item {
                id: TimeZoneButton
                property string timeZone
                property string label
                width: 100
                height: 40
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: TimeZoneButton.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                    }
                }
                
                
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                
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
                        
                        if (!clockExpanded.timeZoneList.model.some(tz => tz.timeZone === timeZone)) {
                            clockExpanded.timeZoneList.model = [...clockExpanded.timeZoneList.model, {timeZone, label}];
                        }
                    }
                }
            }

            
            
            
            Item {
                id: TimeZoneItem
                property string timeZone
                property string label
                width: parent.width
                height: 40
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: TimeZoneItem.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                    
                    
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
                
                
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                
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
                        
                        const index = clockExpanded.timeZoneList.model.findIndex(tz => tz.timeZone === timeZone);
                        if (index !== -1) {
                            const newModel = [...clockExpanded.timeZoneList.model];
                            newModel.splice(index, 1);
                            clockExpanded.timeZoneList.model = newModel;
                        }
                    }
                }
            }

            
            
            
            Item {
                id: TimerButton
                property string text
                property int value
                width: 80
                height: 40
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: TimerButton.text
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[4]
                    }
                }
                
                
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                
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

            
            
            
            Item {
                id: ControlButton
                property string icon
                property bool enabled: true
                width: 50
                height: 50
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 25
                    color: enabled ? "#000000" : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.1)
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: ControlButton.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: enabled ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    }
                }
                
                
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                
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

            
            
            
            Item {
                id: AlarmItem
                property var alarm
                width: parent.width
                height: 60
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: alarm.isActive ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: alarm.time
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 20
                        color: alarm.isActive ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                    
                    
                    Text {
                        anchors.left: timeText.right
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        text: alarm.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: alarm.isActive ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    
                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 45
                        anchors.verticalCenter: parent.verticalCenter
                        text: "\uf044"
                        font.family: faSolid.name
                        font.pixelSize: 16
                        color: pywalColors.colors[6]
                    }
                    
                    
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
                
                
                ScaleAnimation on scale {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1.0
                    to: 1.05
                    running: false
                }
                
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        clockExpanded.alarmExpanded.visible = true;
                        clockExpanded.alarmExpanded.alarm = alarm;
                    }
                    
                    
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
                                if (AlarmItem.onEdit) {
                                    AlarmItem.onEdit();
                                }
                            }
                        }
                    }
                    
                    
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
                                if (AlarmItem.onDelete) {
                                    AlarmItem.onDelete();
                                }
                            }
                        }
                    }
                }
            }

            
            
            
            Item {
                id: LapItem
                property int lapNumber
                property int lapTime
                width: parent.width
                height: 30
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "لفة " + lapNumber
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                    }
                    
                    
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

            
            
            
            Item {
                id: CalendarDay
                property int day
                property bool isToday: false
                width: parent.cellWidth
                height: parent.cellHeight
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: isToday ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: day > 0 ? day.toString() : ""
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: isToday ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
            }

            
            
            
            Item {
                id: TimePicker
                property int min: 0
                property int max: 59
                property int value: 0
                width: 50
                height: 40
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: value < 10 ? "0" + value : value.toString()
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 18
                        color: pywalColors.colors[4]
                    }
                }
                
                
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
                        
                    }
                }
            }

            
            
            
            Item {
                id: DaySelector
                property int dayIndex
                property string label
                property bool active: false
                width: 30
                height: 30
                
                
                Rectangle {
                    anchors.fill: parent
                    radius: 15
                    color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                    border.color: active ? pywalColors.colors[4] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: DaySelector.label
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                    }
                }
                
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        active = !active;
                    }
                }
            }

            
            
            
            
            function formatTime(ms) {
                const totalSeconds = Math.floor(ms / 1000);
                const hours = Math.floor(totalSeconds / 3600);
                const minutes = Math.floor((totalSeconds % 3600) / 60);
                const seconds = totalSeconds % 60;
                
                return (hours > 0 ? (hours < 10 ? "0" + hours : hours) + ":" : "") +
                    (minutes < 10 ? "0" + minutes : minutes) + ":" +
                    (seconds < 10 ? "0" + seconds : seconds);
            }

            
            function getCurrentTime(timeZone) {
                try {
                    const options = { timeZone, hour: '2-digit', minute: '2-digit', hour12: true };
                    return new Date().toLocaleTimeString('ar-EG', options);
                } catch (e) {
                    console.error("فشل الحصول على الوقت للمنطقة الزمنية:", timeZone, e);
                    return "--:--";
                }
            }
            
            
            
            
            Capsule {
                icon: "\uf240"
                colorIndex: 2
                capsuleId: "battery"
                width: 50
                height: 50
                
                
                property int batteryLevel: 100
                property bool isCharging: false
                
                
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width / 2
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: batteryLevel > 20 ? "\uf240" : "\uf244"
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: batteryLevel > 20 ? 
                            pywalColors.colors[colorIndex] : 
                            pywalColors.colors[1] 
                    }
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        radius: width / 2
                        color: "transparent"
                        border.color: pywalColors.colors[2]
                        border.width: 2
                        visible: isCharging
                        
                        
                        ScaleAnimation on scale {
                            duration: 500
                            from: 1.0
                            to: 1.1
                            loops: Animation.Infinite
                            easing.type: Easing.OutInQuad
                        }
                    }
                }
                
                
                Timer {
                    id: batteryUpdateTimer
                    interval: 5000 
                    repeat: true
                    running: true
                    onTriggered: {
                        updateBatteryLevel();
                    }
                }
                
                
                function updateBatteryLevel() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("upower", ["-i", "/org/freedesktop/UPower/devices/battery_BAT0"]);
                        process.waitForFinished(500); 
                        
                        if (process.exitCode() === 0) {
                            const output = process.readAllStandardOutput().trim();
                            const match = output.match(/percentage:\s*(\d+)%/);
                            if (match) {
                                batteryLevel = parseInt(match[1]);
                                
                                
                                const chargingMatch = output.match(/state:\s*(\w+)/);
                                isCharging = chargingMatch && chargingMatch[1] === "charging";
                            }
                        }
                    } catch (e) {
                        console.error("فشل جلب مستوى البطارية:", e);
                    }
                }
            }
            
            
            
            
            Item {
                id: batteryModes
                anchors.fill: parent
                visible: false
                z: 100
                
                
                property string powerMode: "balanced" 
                property int batteryLevel: 100
                property bool isCharging: false
                
                
                Timer {
                    id: batteryTimer
                    interval: 5000
                    repeat: true
                    running: true
                    onTriggered: {
                        updateBatteryStatus()
                    }
                }
                
                
                function updateBatteryStatus() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("upower", ["-i", "/org/freedesktop/UPower/devices/battery_BAT0"]);
                        process.waitForFinished();
                        const output = process.readAllStandardOutput().trim();
                        
                        
                        const match = output.match(/percentage:\s+(\d+)%/);
                        if (match) {
                            batteryLevel = parseInt(match[1]);
                            batteryCapsule.label = batteryLevel + "%";
                        }
                        
                        
                        isCharging = output.includes("state:              charging");
                    } catch (e) {
                        console.error("فشل جلب حالة البطارية:", e);
                        batteryLevel = 75; 
                    }
                }
                
                
                function setPowerMode(mode) {
                    powerMode = mode;
                    
                    
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
                    
                    
                    savePowerSettings();
                }
                
                
                function applyPerformanceMode() {
                    
                    enableAllAnimations();
                    
                    
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "performance"]);
                    } catch (e) {
                        console.error("فشل تطبيق وضع الأداء:", e);
                    }
                }
                
                
                function applyBalancedMode() {
                    
                    enableAllAnimations();
                    
                    
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "ondemand"]);
                    } catch (e) {
                        console.error("فشل تطبيق وضع التوازن:", e);
                    }
                }
                
                
                function applyPowerSaverMode() {
                    
                    disableNonEssentialAnimations();
                    
                    
                    if (indicatorPopup.brightnessLevel > 50) {
                        indicatorPopup.setBrightnessLevel(50);
                    }
                    
                    
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("sudo", ["cpupower", "frequency-set", "--governor", "powersave"]);
                    } catch (e) {
                        console.error("فشل تطبيق وضع توفير البطارية:", e);
                    }
                }
                
                
                function enableAllAnimations() {
                    
                    animationDuration = 100;
                    animationEasing = Easing.OutQuart;
                    
                    
                    opacityAnimationsEnabled = true;
                    scaleAnimationsEnabled = true;
                    slideAnimationsEnabled = true;
                    rippleAnimationsEnabled = true;
                    
                    
                    updateBatteryModesUI();
                }
                
                
                function disableNonEssentialAnimations() {
                    
                    animationDuration = 50;
                    animationEasing = Easing.Linear;
                    
                    
                    opacityAnimationsEnabled = false;
                    scaleAnimationsEnabled = false;
                    rippleAnimationsEnabled = false;
                    
                    
                    slideAnimationsEnabled = true;
                    
                    
                    updateBatteryModesUI();
                }
                
                
                function updateBatteryModesUI() {
                    
                    performanceModeItem.active = (powerMode === "performance");
                    balancedModeItem.active = (powerMode === "balanced");
                    powerSaverModeItem.active = (powerMode === "power_saver");
                }
                
                
                function savePowerSettings() {
                    try {
                        const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO");
                        fs.source = "/home/user/.config/quickshell/power-settings.json";
                        fs.write(JSON.stringify({
                            powerMode: powerMode,
                            batteryLevel: batteryLevel,
                            isCharging: isCharging
                        }));
                    } catch (e) {
                        console.error("فشل حفظ إعدادات الطاقة:", e);
                    }
                }
                
                
                function loadPowerSettings() {
                    try {
                        const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        fs.source = "/home/user/.config/quickshell/power-settings.json";
                        const data = fs.read();
                        if (data) {
                            const settings = JSON.parse(data);
                            powerMode = settings.powerMode || "balanced";
                            batteryLevel = settings.batteryLevel || 100;
                            isCharging = settings.isCharging || false;
                            
                            
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
                    } catch (e) {
                        console.error("فشل تحميل إعدادات الطاقة:", e);
                    }
                }
                
                
                
                
                Rectangle {
                    id: batteryModesContainer
                    anchors.fill: parent
                    radius: 20
                    color: "#000000"
                    [2]
                    border.width: 0
                    opacity: 0.92
                    
                    
                    Rectangle {
                        anchors.fill: parent
                        color: "rgba(0, 0, 0, 0.7)"
                        visible: !powerSaverModeActive
                    }

                    
                    Rectangle {
                        anchors.fill: parent
                        color: "rgba(0, 0, 0, 0.92)"
                        visible: powerSaverModeActive
                    }
                    
                    
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
                    
                    
                    Text {
                        id: chargingStatus
                        anchors.top: largeBatteryPercentage.bottom
                        anchors.topMargin: 5
                        anchors.right: largeBatteryPercentage.right
                        visible: isCharging
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[4]
                        text: "\uf1e6  يُشحن"
                    }
                    
                    
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
                        
                        
                        Rectangle {
                            id: batteryProgressThumb
                            width: batteryProgressTrack.width * batteryLevel / 100
                            height: batteryProgressTrack.height
                            radius: 4
                            color: pywalColors.colors[2]
                            anchors.top: parent.top
                            anchors.left: parent.left
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 3
                                color: "transparent"
                                )
                                border.width: 0
                            }
                        }
                    }
                    
                    
                    Text {
                        anchors.top: batteryProgressTrack.bottom
                        anchors.topMargin: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 18
                        color: pywalColors.colors[7]
                        text: "أوضاع النظام"
                    }
                    
                    
                    RowLayout {
                        anchors.top: powerModesTitle.bottom
                        anchors.topMargin: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 15
                        
                        
                        PowerModeItem {
                            id: performanceModeItem
                            mode: "performance"
                            icon: "\uf085"
                            label: "الأداء"
                            description: "أقصى سرعة مع استهلاك عالي للطاقة"
                            colorIndex: 4
                            active: powerMode === "performance"
                        }
                        
                        
                        PowerModeItem {
                            id: balancedModeItem
                            mode: "balanced"
                            icon: "\uf1d3"
                            label: "التوازن"
                            description: "توازن بين الأداء واستهلاك الطاقة"
                            colorIndex: 5
                            active: powerMode === "balanced"
                        }
                        
                        
                        PowerModeItem {
                            id: powerSaverModeItem
                            mode: "power_saver"
                            icon: "\uf187"
                            label: "توفير البطارية"
                            description: "أقل استهلاك للطاقة مع أداء محدود"
                            colorIndex: 3
                            active: powerMode === "power_saver"
                        }
                    }
                    
                    
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
                
                
                property int modeInfoColorIndex: {
                    switch(powerMode) {
                        case "performance": return 4
                        case "power_saver": return 3
                        default: return 5
                    }
                }
                
                property string modeInfoText: {
                    switch(powerMode) {
                        case "performance": return "يستخدم أقصى أداء للنظام مع زيادة استهلاك البطارية"
                        case "power_saver": return "يقلل استهلاك البطارية مع تعطيل معظم الأنميشنات"
                        default: return "يوازن بين الأداء واستهلاك البطارية لتحقيق أفضل تجربة"
                    }
                }
                
                
                
                
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
                        
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: active ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2) : "#000000"
                            border.width: 0
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutBack
                                from: 1
                                to: active ? 1.05 : 1
                                running: false
                            }
                            
                            
                            Text {
                                anchors.top: parent.top
                                anchors.topMargin: 15
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: faSolid.name
                                font.pixelSize: 24
                                color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                text: icon
                            }
                            
                            
                            Text {
                                anchors.top: iconRect.bottom
                                anchors.topMargin: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 16
                                color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                text: label
                            }
                            
                            
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
                        
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                
                                batteryModes.setPowerMode(mode)
                                
                                
                                batteryModes.updateBatteryModesUI()
                                
                                
                                notificationSystem.notificationReceived(
                                    "الطاقة", 
                                    "تم تغيير وضع النظام", 
                                    "تم تفعيل وضع " + label, 
                                    "\uf011"
                                )
                            }
                            onEntered: {
                                if (!active) {
                                    parent.scale = 1.05
                                }
                            }
                            onExited: {
                                if (!active) {
                                    parent.scale = 1.0
                                }
                            }
                        }
                    }
                }
                
                
                Component.onCompleted: {
                    loadPowerSettings()
                    updateBatteryStatus()
                }
            }

            
            
            
            Capsule {
                icon: "\uf240"
                label: batteryModes.batteryLevel + "%"
                colorIndex: batteryModes.batteryLevel > 20 ? 2 : 3
                capsuleId: "battery"
                width: 90
                
                
                ScaleAnimation on scale {
                    id: batteryHoverAnimation
                    duration: animationDuration * 0.05
                    easing.type: animationEasing
                    from: 1
                    to: 1.2
                    running: false
                }
                
                
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

                
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
                
                
                onClicked: {
                    if (!isExpanded) {
                        
                        for (let i = 0; i < capsuleLayout.children.length; i++) {
                            let child = capsuleLayout.children[i];
                            if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                child.collapseAnimation.restart();
                                child.isExpanded = false;
                            }
                        }
                        
                        
                        batteryExpandAnimation.restart();
                        isExpanded = true;
                        activeCapsule = capsuleId;
                        
                        
                        batteryModes.visible = true;
                    } else {
                        
                        collapseAnimation.restart();
                        isExpanded = false;
                        activeCapsule = "";
                        
                        
                        batteryModes.visible = false;
                    }
                }
            }

            
            
            
            Capsule {
                icon: "\uf1eb"
                colorIndex: 5
                capsuleId: "network"
                width: 50
                height: 50
                
                
                property string networkName: "غير متصل"
                property int signalStrength: 0
                
                
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width / 2
                    color: "#000000"
                    border.width: 0
                    
                    
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
                
                
                Timer {
                    id: networkUpdateTimer
                    interval: 5000 
                    repeat: true
                    running: true
                    onTriggered: {
                        updateNetworkInfo();
                    }
                }
                
                
                function updateNetworkInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("nmcli", ["-t", "-f", "ACTIVE,SSID,SIGNAL", "dev", "wifi"]);
                        process.waitForFinished(500); 
                        
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
                            
                            networkName = "غير متصل";
                            signalStrength = 0;
                        }
                    } catch (e) {
                        console.error("فشل جلب معلومات الشبكة:", e);
                        networkName = "غير متصل";
                        signalStrength = 0;
                    }
                }
            }

            
            
            
            Capsule {
                id: soundCapsule
                icon: "\uf028" 
                label: "مستوى الصوت: " + volumeLevel + "%"
                colorIndex: 3
                capsuleId: "sound"
                width: 150
                height: 50

                property bool isMicrophoneActive: false
                property bool isMicrophoneAndSoundActive: false
                property int volumeLevel: 50
                property var activeMicrophoneApps: []
                property var playlistsModel: []

                
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: 25
                    color: "#000000"
                    border.color: pywalColors.colors[colorIndex]
                    border.width: 2

                    
                    Text {
                        id: capsuleIcon
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: {
                            if (isMicrophoneAndSoundActive) return "\uf130"; 
                            if (isMicrophoneActive) return "\uf130"; 
                            return "\uf028"; 
                        }
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }

                    
                    Text {
                        id: capsuleLabel
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "مستوى الصوت: " + volumeLevel + "%"
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 16
                        color: pywalColors.colors[colorIndex]
                    }
                }

                
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

                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    
                    onEntered: {
                        if (!soundCapsule.isExpanded) {
                            capsuleBase.scale = 1.05;
                        }
                    }

                    
                    onExited: {
                        if (!soundCapsule.isExpanded) {
                            capsuleBase.scale = 1;
                        }
                    }

                    
                    onClicked: {
                        if (!soundCapsule.isExpanded) {
                            
                            expandAnimation.restart();
                            soundCapsule.isExpanded = true;

                            
                            soundSettings.visible = true;
                        } else {
                            
                            collapseAnimation.restart();
                            soundCapsule.isExpanded = false;
                            soundSettings.visible = false;
                        }
                    }

                    
                    onPressed: {
                        if (mouse.button === Qt.RightButton && (isMicrophoneActive || isMicrophoneAndSoundActive)) {
                            
                            expandAnimation.restart();
                            soundCapsule.isExpanded = true;
                            microphoneUsage.visible = true;
                        }
                    }
                }

                
                Item {
                    id: soundSettings
                    visible: false
                    anchors.fill: parent

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 10

                        
                        GroupBox {
                            title: "مستويات الصوت"
                            Layout.fillWidth: true
                            height: 150
                            background: Rectangle { color: "#1E1E1E"; radius: 10 }

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 10

                                RowLayout {
                                    Label { text: "العام" }
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: volumeLevel
                                        onValueChanged: setVolumeLevel(value)
                                    }
                                }

                                RowLayout {
                                    Label { text: "الإشعارات" }
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: notificationVolume
                                        onValueChanged: setNotificationVolume(value)
                                    }
                                }

                                RowLayout {
                                    Label { text: "المنبهات" }
                                    Slider {
                                        from: 0
                                        to: 100
                                        value: alarmVolume
                                        onValueChanged: setAlarmVolume(value)
                                    }
                                }
                            }
                        }

                        
                        GroupBox {
                            title: "إدارة الأصوات"
                            Layout.fillWidth: true
                            height: 200
                            background: Rectangle { color: "#1E1E1E"; radius: 10 }

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 10

                                Button {
                                    text: "اختيار ملف محلي"
                                    onClicked: openFilePicker()
                                }

                                Button {
                                    text: "تنزيل من Zedge"
                                    onClicked: openZedgeSearch()
                                }

                                Button {
                                    text: "استيراد الأصوات"
                                    onClicked: importSounds()
                                }
                            }
                        }

                        
                        GroupBox {
                            title: "تصنيف الأصوات"
                            Layout.fillWidth: true
                            height: 250
                            background: Rectangle { color: "#1E1E1E"; radius: 10 }

                            ListView {
                                anchors.fill: parent
                                model: [
                                    { type: "إشعارات", sounds: ["sound1.mp3", "sound2.mp3"] },
                                    { type: "منبهات", sounds: ["alarm1.mp3", "alarm2.mp3"] },
                                    { type: "رسائل", sounds: ["message1.mp3", "message2.mp3"] }
                                ]
                                delegate: Item {
                                    width: parent.width
                                    height: 80

                                    ColumnLayout {
                                        anchors.fill: parent
                                        spacing: 10

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

                        
                        GroupBox {
                            title: "قوائم التشغيل"
                            Layout.fillWidth: true
                            height: 200
                            background: Rectangle { color: "#1E1E1E"; radius: 10 }

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 10

                                TextField {
                                    placeholderText: "اسم قائمة التشغيل الجديدة"
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
                                            spacing: 10

                                            Text {
                                                text: modelData.name
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: "#FFFFFF"
                                            }

                                            Button {
                                                text: "حذف"
                                                onClicked: deletePlaylist(modelData.id)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                
                Item {
                    id: microphoneUsage
                    visible: false
                    anchors.fill: parent

                    ListView {
                        anchors.fill: parent
                        model: getActiveMicrophoneApps() 
                        delegate: Item {
                            width: parent.width
                            height: 50

                            RowLayout {
                                anchors.fill: parent
                                spacing: 10

                                Text {
                                    text: modelData.name
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[7]
                                }

                                Button {
                                    text: "Pause"
                                    onClicked: stopMicrophoneUsage(modelData.id)
                                }
                            }
                        }
                    }
                }
            }

            
            
            
            
            function setVolumeLevel(level) {
                soundCapsule.volumeLevel = level;
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("wpctl", ["set-volume", "@DEFAULT_AUDIO_SINK@", level + "%"]);
                } catch (e) {
                    console.error("فشل تعيين مستوى الصوت:", e);
                }
            }

            
            function setNotificationVolume(level) {
                console.log("ضبط مستوى صوت الإشعارات:", level);
            }

            
            function setAlarmVolume(level) {
                console.log("ضبط مستوى صوت المنبهات:", level);
            }

            
            function openFilePicker() {
                console.log("Open اختيار ملف محلي");
            }

            
            function openZedgeSearch() {
                console.log("Open البحث في Zedge");
            }

            
            function importSounds() {
                console.log("استيراد الأصوات");
            }

            
            function selectSound(soundFile) {
                console.log("اختيار الصوت:", soundFile);
            }

            
            function createPlaylist(name) {
                if (!name.trim()) return;
                soundCapsule.playlistsModel.push({ id: Date.now(), name: name });
            }

            
            function deletePlaylist(id) {
                for (let i = 0; i < soundCapsule.playlistsModel.length; i++) {
                    if (soundCapsule.playlistsModel[i].id === id) {
                        soundCapsule.playlistsModel.splice(i, 1);
                        break;
                    }
                }
            }

            
            function stopMicrophoneUsage(appId) {
                console.log("Pause استخدام الميكروفون بواسطة التطبيق:", appId);
                
            }

            
            function getActiveMicrophoneApps() {
                try {
                    const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                    process.start("pactl", ["list", "sources"]);
                    process.waitForFinished();
                    const output = process.readAllStandardOutput();

                    
                    const lines = output.split("\n");
                    let activeApps = [];
                    for (let i = 0; i < lines.length; i++) {
                        if (lines[i].includes("application.name")) {
                            const appName = lines[i].split("=")[1].trim().replace(/"/g, "");
                            const appId = lines[i - 1].split("#")[1].trim(); 
                            activeApps.push({ id: appId, name: appName });
                        }
                    }
                    return activeApps;
                } catch (e) {
                    console.error("فشل جلب التطبيقات التي تستخدم الميكروفون:", e);
                    return [];
                }
            }

            
            
            
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
                
                
                function queryCrosire(query) {
                    currentQuery = query;
                    currentResponse = "جاري التفكير...";
                    
                    try {
                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "https:
                        xhr.setRequestHeader("Authorization", "Bearer " + token);
                        xhr.setRequestHeader("Content-Type", "application/json");
                        
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === 4) {
                                if (xhr.status === 200) {
                                    const response = JSON.parse(xhr.responseText);
                                    currentResponse = response.choices[0].message.content;
                                } else {
                                    currentResponse = "حدث خطأ في الاتصال بـ Crosire";
                                }
                            }
                        };
                        
                        xhr.send(JSON.stringify({
                            "model": "mistralai/mistral-7b-instruct",
                            "messages": [
                                {"role": "user", "content": query}
                            ]
                        }));
                    } catch (e) {
                        console.error("فشل استدعاء Crosire:", e);
                        currentResponse = "فشل الاتصال بـ Crosire";
                    }
                }
                
                
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
                    onExited: parent.scale = 1
                    onClicked: {
                        
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

                
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
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

    
    
    
    Item {
        id: crosireExpanded
        anchors.fill: parent
        visible: false
        z: 994
        
        
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        
        ColumnLayout {
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: parent.height * 0.8
            spacing: 20
            
            
            Text {
                text: "Crosire AI Assistant"
                font.family: ibmPlex.name
                font.pixelSize: 24
                color: pywalColors.colors[7]
                Layout.alignment: Qt.AlignHCenter
            }
            
            
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                ListView {
                    id: crosireChat
                    anchors.fill: parent
                    model: [
                        {role: "system", content: "مرحباً! أنا Crosire، مساعد الذكاء الاصطناعي المدمج في النظام. كيف يمكنني مساعدتك اليوم؟"}
                    ]
                    delegate: Item {
                        width: parent.width
                        height: role === "user" ? 60 : 80
                        
                        Rectangle {
                            anchors.left: role === "user" ? undefined : parent.left
                            anchors.right: role === "user" ? parent.right : undefined
                            width: parent.width * 0.8
                            height: implicitHeight
                            radius: 25
                            color: role === "user" ? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2) : "#000000"
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
            
            
            RowLayout {
                spacing: 10
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
                        placeholderText: "اكتب سؤالك هنا..."
                        
                        onAccepted: {
                            if (text.trim() !== "") {
                                
                                crosireChat.model.append({role: "user", content: text});
                                crosireInput.text = "";
                                
                                
                                crosireChat.model.append({role: "assistant", content: "جاري التفكير..."});
                                
                                
                                crosireCapsule.queryCrosire(text);
                                
                                
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
                        text: "\uf1d8" 
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[6]
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (crosireInput.text.trim() !== "") {
                                
                                crosireChat.model.append({role: "user", content: crosireInput.text});
                                crosireInput.text = "";
                                
                                
                                crosireChat.model.append({role: "assistant", content: "جاري التفكير..."});
                                
                                
                                crosireCapsule.queryCrosire(crosireInput.text);
                                
                                
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
    
    
    Item {
        id: crosireContent
        anchors.fill: parent
        visible: false
        z: 1000
        
        
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        
        Rectangle {
            width: parent.width
            height: 70
            color: "#000000"
            [6]
            border.width: 0
            border.bottomWidth: 0
            
            
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 25
                anchors.verticalCenter: parent.verticalCenter
                text: "Crosire AI Assistant"
                font.family: ibmPlex.name
                font.pixelSize: 20
                color: pywalColors.colors[7]
            }
            
            
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.verticalCenter: parent.verticalCenter
                text: "\ue63d" 
                font.family: faSolid.name
                font.pixelSize: 22
                color: pywalColors.colors[6]
            }
        }
        
        
        RowLayout {
            anchors.top: crosireContent.children[0].bottom
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            spacing: 0
            
            
            Rectangle {
                id: leftPanel
                width: 280
                height: parent.height
                color: "#000000"
                border.width: 0
                
                
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: "الحسابات والنماذج"
                        font.family: ibmPlex.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                }
                
                
                ColumnLayout {
                    anchors.top: parent.children[0].bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    spacing: 10
                    anchors.margins: 10
                    
                    
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
                            spacing: 10
                            
                            Rectangle {
                                width: 30
                                height: 30
                                radius: 15
                                color: pywalColors.colors[6]
                                border.width: 0
                                
                                Text {
                                    anchors.centerIn: parent
                                    text: "\uf007" 
                                    font.family: faSolid.name
                                    font.pixelSize: 14
                                    color: "#000000"
                                }
                            }
                            
                            Text {
                                text: "الحساب الافتراضي"
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
                    
                    
                    Button {
                        id: addAccountButton
                        width: parent.width
                        height: 40
                        radius: 15
                        color: "#000000"
                        border.width: 0
                        
                        Text {
                            anchors.centerIn: parent
                            text: "\uf067 إضافة حساب" 
                            font.family: faSolid.name
                            font.pixelSize: 14
                            color: pywalColors.colors[6]
                        }
                        
                        
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
                                accountFade.to = 1
                            }
                        }
                    }
                    
                    
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
                            text: "النموذج الحالي:"
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
                    
                    
                    ListView {
                        id: modelsList
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: [
                            {text: "النموذج الافتراضي", active: true, colorIndex: 6},
                            {text: "Qwen3-Max", active: false, colorIndex: 4},
                            {text: "Qwen3-Coder", active: false, colorIndex: 5},
                            {text: "Qwen3-Omni-Flash", active: false, colorIndex: 3}
                        ]
                        
                        delegate: Item {
                            width: parent.width
                            height: 40
                            
                            
                            Rectangle {
                                id: modelButton
                                anchors.fill: parent
                                radius: 15
                                color: active ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2) : "#000000"
                                border.width: 0
                                
                                
                                Text {
                                    anchors.left: icon.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelButton.text
                                    font.family: ibmPlex.name
                                    font.pixelSize: 16
                                    color: active ? pywalColors.colors[colorIndex] : pywalColors.colors[7]
                                }
                                
                                
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
                                        if (!active) {
                                            parent.scale = 1.03;
                                        }
                                    }
                                    onExited: {
                                        if (!active) {
                                            parent.scale = 1.0;
                                        }
                                    }
                                    onClicked: {
                                        if (!active) {
                                            
                                            modelsList.currentIndex = index;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            
            Rectangle {
                id: chatPanel
                width: 520
                height: parent.height
                color: "#000000"
                border.width: 0
                border.leftWidth: 0
                
                
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    Text {
                        anchors.centerIn: parent
                        text: "محادثة جديدة"
                        font.family: ibmPlex.name
                        font.pixelSize: 16
                        color: pywalColors.colors[7]
                    }
                }
                
                
                property list<var> crosireChatMessages: [
                    {message: "مرحباً! كيف يمكنني مساعدتك اليوم؟", isUser: false}
                ]
                
                
                Component {
                    id: chatMessageComponent

                Item {
                     id: typingIndicator
                    visible: !isUser && messageIndex === crosireChatMessages.length - 1 && crosireChatMessages[messageIndex].message === "..."
                    anchors.right: parent.right
                    anchors.rightMargin: 10

                      RowLayout {
                           spacing: 5
                           Repeater {
                               model: 3
                               delegate: Rectangle {
                                   width: 8
                                   height: 8
                                   radius: 4
                                   color: pywalColors.colors[7]
                                   opacity: (index + 1) / 4

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
                        
                        
                        Rectangle {
                            id: messageBubble
                            anchors.left: isUser ? undefined : parent.left
                            anchors.right: isUser ? parent.right : undefined
                            width: parent.width
                            height: implicitHeight
                            radius: 20
                            color: isUser ? Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.2) : "#000000"
                            border.width: 0
                            
                            
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
                            
                            
                            Text {
                                anchors.left: isUser ? parent.left : undefined
                                anchors.right: isUser ? undefined : parent.right
                                anchors.leftMargin: 15
                                anchors.rightMargin: 15
                                anchors.top: messageText.bottom
                                anchors.topMargin: 5
                                text: isUser ? "الآن" : "ثانية مضت"
                                font.family: ibmPlex.name
                                font.pixelSize: 12
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                            }
                            
                            
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
                                    text: "\uf142" 
                                    font.family: faSolid.name
                                    font.pixelSize: 14
                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                }
                            }
                        }
                    }
                }
                
                
                ListView {
                    id: chatMessages
                    anchors.top: parent.children[0].bottom
                    anchors.bottom: inputArea.top
                    anchors.bottomMargin: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 10
                    spacing: 15
                    model: crosireChatMessages
                    
                    delegate: chatMessageComponent
                }
                
                
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
                        spacing: 10
                        
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
                                    if (text.trim() !== "") {
                                        crosireChatMessages.push({message: text, isUser: true});
                                        chatMessages.positionViewAtEnd();
                                        chatInput.text = "";
                                        
                                        
                                        const userMessage = text;
                                        Timer {
                                            interval: 500
                                            onTriggered: {
                                                const aiResponse = "أنا أتفهم أنك قلت: " + userMessage + ". هل هناك شيء آخر يمكنني مساعدتك به؟";
                                                crosireChatMessages.push({message: aiResponse, isUser: false});
                                                chatMessages.positionViewAtEnd();
                                            }
                                        }.start()
                                    }
                                }
                            }
                        }
                        
                        
                        Rectangle {
                            width: 50
                            height: 50
                            radius: 25
                            color: "#000000"
                            [6]
                            border.width: 0
                            
                            Text {
                                anchors.centerIn: parent
                                text: "\uf1d8" 
                                font.family: faSolid.name
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                            }
                            
                            
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
                                    if (chatInput.text.trim() !== "") {
                                        crosireChatMessages.push({message: chatInput.text, isUser: true});
                                        chatMessages.positionViewAtEnd();
                                        chatInput.text = "";
                                        
                                        
                                        const userMessage = chatInput.text;
                                        Timer {
                                            interval: 500
                                            onTriggered: {
                                                const aiResponse = "أنا أتفهم أنك قلت: " + userMessage + ". هل هناك شيء آخر يمكنني مساعدتك به؟";
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
            
            
            Rectangle {
                id: rightPanel
                width: 200
                height: parent.height
                color: "#000000"
                border.width: 0
                border.leftWidth: 0
                
                
                Rectangle {
                    width: parent.width
                    height: 50
                    color: "#000000"
                    border.width: 0
                    border.bottomWidth: 0
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10
                        
                        Text {
                            text: "المحادثات"
                            font.family: ibmPlex.name
                            font.pixelSize: 16
                            color: pywalColors.colors[7]
                        }
                        
                        Text {
                            text: "\uf067" 
                            font.family: faSolid.name
                            font.pixelSize: 16
                            color: pywalColors.colors[6]
                            
                            
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
                                    
                                    crosireChatMessages = [{message: "مرحباً! كيف يمكنني مساعدتك اليوم؟", isUser: false}];
                                }
                            }
                        }
                    }
                }
                
                
                ListView {
                    id: conversationsList
                    anchors.top: parent.children[0].bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: 10
                    spacing: 10
                    model: [
                        {title: "محادثة جديدة", lastMessage: "مرحباً", active: true},
                        {title: "الإعدادات", lastMessage: "كيف يمكنني ضبط الصوت؟", active: false},
                        {title: "الدعم الفني", lastMessage: "هل تحتاج مساعدة؟", active: false}
                    ]
                    
                    delegate: Item {
                        width: parent.width
                        height: 60
                        
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: active ? Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.2) : "#000000"
                            border.width: 0
                            
                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 5
                                
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
                                    if (!active) {
                                        parent.scale = 1.03;
                                    }
                                }
                                onExited: {
                                    if (!active) {
                                        parent.scale = 1.0;
                                    }
                                }
                                onClicked: {
                                    if (!active) {
                                        
                                        conversationsList.currentIndex = index;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
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
                text: "\uf00d" 
                font.family: faSolid.name
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            
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

            
            
            
            Capsule {
                id: clipboardCapsule
                icon: "\uf0ea" 
                colorIndex: 2
                capsuleId: "clipboard"
                width: 50
                height: 50
                
                property bool isExpanded: false
                property list<string> clipboardItems: []
                property int maxItems: 50
                
                
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
                    } catch (e) {
                        console.error("فشل جلب محتويات الحافظة:", e);
                    }
                }
                
                
                function setClipboardContent(content) {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("wl-copy", [content]);
                    } catch (e) {
                        console.error("فشل وضع المحتوى في الحافظة:", e);
                    }
                }
                
                
                Timer {
                    interval: 500
                    repeat: true
                    running: true
                    onTriggered: getClipboardContent()
                }
                
                
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
                    onExited: parent.scale = 1
                    onClicked: {
                        
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

                
                ScaleAnimation on scale {
                    id: hoverAnimation
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 1
                    to: 1.05
                    running: false
                }

                
                ScaleAnimation {
                    id: pressAnimation
                    target: capsuleBase
                    property: "scale"
                    duration: 50
                    easing.type: Easing.OutBack
                }
            }

            
            
            
            Item {
                id: clipboardExpanded
                anchors.fill: parent
                visible: false
                z: 995
                
                
                Rectangle {
                    anchors.fill: parent
                    color: "#000000"
                }
                
                
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.7)"
                    visible: !powerSaverModeActive
                }

                
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.92)"
                    visible: powerSaverModeActive
                }
                
                
                ColumnLayout {
                    anchors.centerIn: parent
                    width: parent.width * 0.8
                    spacing: 20
                    
                    
                    Text {
                        text: "الحافظة"
                        font.family: ibmPlex.name
                        font.pixelSize: 24
                        color: pywalColors.colors[7]
                        Layout.alignment: Qt.AlignHCenter
                    }
                    
                    
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
                                        showToast("تم نسخ المحتوى إلى الحافظة", "\uf0ea");
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    RowLayout {
                        spacing: 20
                        Layout.alignment: Qt.AlignHCenter
                        
                        Button {
                            text: "مسح الكل"
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
                            text: "إغلاق"
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
                
                
                property int maxVisibleNotifications: 5
                property int notificationHeight: 80
                property int notificationSpacing: 10
                property int debounceTime: 20

                
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
                
                
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width / 2
                    color: "#000000"
                    border.width: 0
                    
                    
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
                            text: notificationCount > 9 ? "9+" : notificationCount.toString()
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 12
                            color: "#000000"
                        }
                    }
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: notifireCapsule.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }
                }
                
                
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
                
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    
                    onEntered: {
                        if (!isExpanded) {
                            hoverAnimation.running = true;
                        }
                    }
                    
                    onExited: {
                        hoverAnimation.to = 1.0;
                        hoverAnimation.running = true;
                        if (!isExpanded) capsuleBase.scale = 1.0;
                    }
                    
                    onClicked: {
                        if (!isExpanded) {
                            
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId !== capsule.capsuleId) {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            
                            notifireExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            
                            notifireContent.visible = true;
                            notifireContent.opacity = 0;
                            fadeInAnimation.target = notifireContent;
                            fadeInAnimation.restart();
                        } else {
                            
                            notifireCollapseAnimation.restart();
                            isExpanded = false;
                            activeCapsule = "";
                            
                            
                            fadeOutAnimation.target = notifireContent;
                            fadeOutAnimation.onCompleted = function() {
                                notifireContent.visible = false;
                            };
                            fadeOutAnimation.restart();
                        }
                    }
                }
                
                
                
                
                Item {
                    id: notifireContent
                    anchors.fill: parent
                    visible: false
                    opacity: 0
                    
                    
                    Item {
                        id: islandContainer
                        width: parent.width * 0.9
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        
                        Rectangle {
                            id: islandBackground
                            anchors.fill: parent
                            radius: 25
                            color: Qt.rgba(0, 0, 0, 0.85)
                            border.width: 0
                            
                            
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
                        
                        
                        RowLayout {
                            id: tabBar
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 0
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 10
                            height: 50
                            
                            
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
                            
                            
                            TabButton {
                                icon: "\uf013"
                                active: activeTab === "control"
                                onClicked: activeTab = "control"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf121"
                                active: activeTab === "developer"
                                visible: showDeveloperOptions
                                onClicked: activeTab = "developer"
                                height: 50
                                width: 50
                            }
                            
                            
                            TabButton {
                                icon: "\uf067" 
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
                    
                    
                    Item {
                        id: tabContent
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        width: parent.width
                        height: parent.height - 70
                        
                        
                        Item {
                            id: notificationsTab
                            anchors.fill: parent
                            visible: activeTab === "notifications"
                            
                            
                            ListView {
                                id: notificationsList
                                anchors.fill: parent
                                clip: true
                                interactive: false
                                model: activeNotifications.length > 0 ? activeNotifications : null
                                delegate: NotificationItem {
                                    width: parent.width * 0.95
                                    height: notificationHeight
                                    notification: modelData
                                    onDismiss: {
                                        notifireManager.removeNotification(modelData.id);
                                    }
                                    onAction: {
                                        notifireManager.executeNotificationAction(modelData, actionIndex);
                                    }
                                }
                                
                                
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                                
                                
                                ScaleAnimation on scale {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 1.0
                                    to: 1.02
                                    running: false
                                }
                            }
                            
                            
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
                                    text: "مسح الكل"
                                    font.family: "IBM Plex Sans Thin"
                                    font.pixelSize: 16
                                    color: pywalColors.colors[2]
                                }
                                
                                onClicked: {
                                    notifireManager.clearAllNotifications();
                                }
                            }
                            
                            
                            Text {
                                anchors.centerIn: parent
                                text: "لا توجد إشعارات"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                visible: activeNotifications.length === 0
                            }
                        }
                        
                        
                        Item {
                            id: controlTab
                            anchors.fill: parent
                            visible: activeTab === "control"
                            
                            
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
                        
                        
                        Item {
                            id: developerTab
                            anchors.fill: parent
                            visible: activeTab === "developer"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                anchors.margins: 15
                                
                                
                                Rectangle {
                                    id: createNotificationSection
                                    width: parent.width
                                    height: 120
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "إنشاء إشعار تجريبي"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[6]
                                        }
                                        
                                        RowLayout {
                                            spacing: 10
                                            
                                            TextInput {
                                                id: appNameInput
                                                width: 100
                                                height: 40
                                                placeholderText: "التطبيق"
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
                                                placeholderText: "العنوان"
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
                                                placeholderText: "الرسالة"
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
                                            text: "إنشاء"
                                            
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
                                
                                
                                Rectangle {
                                    id: dbusStatusSection
                                    width: parent.width
                                    height: 80
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 5
                                        
                                        Text {
                                            text: "حالة DBus"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[5]
                                        }
                                        
                                        Text {
                                            id: dbusStatusText
                                            text: checkDBusStatus() ? "متصل" : "غير متصل"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: checkDBusStatus() ? pywalColors.colors[2] : pywalColors.colors[1]
                                        }
                                    }
                                }
                                
                                
                                Rectangle {
                                    id: systemInfoSection
                                    width: parent.width
                                    height: 100
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 5
                                        
                                        Text {
                                            text: "معلومات النظام"
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
                                
                                
                                Rectangle {
                                    id: logSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 5
                                        
                                        Text {
                                            text: "سجل الإشعارات"
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
                
                
                OpacityAnimation {
                    id: fadeInAnimation
                    from: 0
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                
                OpacityAnimation {
                    id: fadeOutAnimation
                    from: 1
                    to: 0
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                
                
                
                
                function createNotification(title, message, icon, colorIndex, timeout) {
                    if (timeout === undefined) timeout = 5000; 
                    
                    
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
                    
                    
                    activeNotifications.unshift(notification);
                    notificationCount = activeNotifications.length;
                    
                    
                    updateNotifications();
                    
                    
                    if (timeout > 0) {
                        setTimeout(function() {
                            removeNotification(notification.id);
                        }, timeout);
                    }
                    
                    
                    addToLog(`تم إنشاء إشعار: ${title}`);
                    
                    return notification.id;
                }
                
                
                function createTestNotification(appName, title, message, timeout) {
                    let colorIndex = Math.floor(Math.random() * 6) + 1;
                    let icon = Math.random() > 0.5 ? "\uf0f3" : "\uf0a2";
                    
                    createNotification(title, message, icon, colorIndex, timeout);
                    addToLog(`تم إنشاء إشعار تجريبي من ${appName}`);
                }
                
                
                function removeNotification(id) {
                    for (let i = 0; i < activeNotifications.length; i++) {
                        if (activeNotifications[i].id === id) {
                            
                            activeNotifications[i].opacity = 0.0;
                            updateNotifications();
                            
                            
                            setTimeout(function() {
                                activeNotifications.splice(i, 1);
                                notificationCount = activeNotifications.length;
                                updateNotifications();
                                addToLog(`تم إزالة إشعار (ID: ${id})`);
                            }, 300); 
                            
                            break;
                        }
                    }
                }
                
                
                function clearAllNotifications() {
                    if (activeNotifications.length === 0) return;
                    
                    addToLog("تم مسح جميع الإشعارات");
                    
                    
                    for (let i = 0; i < activeNotifications.length; i++) {
                        activeNotifications[i].opacity = 0.0;
                    }
                    
                    updateNotifications();
                    
                    
                    setTimeout(function() {
                        activeNotifications = [];
                        notificationCount = 0;
                        updateNotifications();
                    }, 300);
                }
                
                
                function executeNotificationAction(notification, actionIndex) {
                    addToLog(`تم تنفيذ الإجراء ${actionIndex} للإشعار: ${notification.title}`);
                    
                }
                
                
                function updateNotifications() {
                    
                    let visibleNotifications = activeNotifications.slice(0, maxVisibleNotifications);
                    
                    
                    for (let i = 0; i < visibleNotifications.length; i++) {
                        let notification = visibleNotifications[i];
                        let yPosition = (notificationSpacing + notificationHeight) * i + notificationSpacing;
                        
                        
                        if (!notification.element) {
                            notification.element = notificationItemComponent.createObject(notificationsList, {
                                "x": (notificationsList.width - notification.width) / 2,
                                "y": yPosition,
                                "width": notification.width,
                                "height": notificationHeight,
                                "notification": notification,
                                "opacity": 0.0
                            });
                            
                            
                            let fadeIn = notification.element.opacityAnimation;
                            fadeIn.to = notification.opacity;
                            fadeIn.restart();
                            
                            
                            notification.element.opacityAnimation.onRunningChanged = function() {
                                if (!fadeIn.running && notification.opacity === 0.0) {
                                    notification.element.destroy();
                                    notification.element = null;
                                }
                            };
                        } else {
                            
                            notification.element.y = yPosition;
                            notification.element.opacity = notification.opacity;
                        }
                    }
                    
                    
                    for (let i = activeNotifications.length - 1; i >= maxVisibleNotifications; i--) {
                        if (activeNotifications[i].element) {
                            activeNotifications[i].element.destroy();
                            activeNotifications[i].element = null;
                        }
                    }
                }
                
                
                function checkDBusStatus() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("dbus-send", ["--session", "--dest=org.freedesktop.DBus", "--type=method_call", "--print-reply", "/org/freedesktop/DBus", "org.freedesktop.DBus.ListNames"]);
                        process.waitForFinished(500); 
                        
                        return process.exitCode() === 0;
                    } catch (e) {
                        console.error("فشل التحقق من حالة DBus:", e);
                        return false;
                    }
                }
                
                
                function getSystemInfo() {
                    try {
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("uname", ["-a"]);
                        process.waitForFinished(500);
                        
                        return process.readAllStandardOutput().trim() || "غير متاح";
                    } catch (e) {
                        console.error("فشل جلب معلومات النظام:", e);
                        return "غير متاح";
                    }
                }
                
                
                property string notificationLog: ""
                
                
                function addToLog(message) {
                    const timestamp = new Date().toLocaleTimeString();
                    notificationLog = `[${timestamp}] ${message}\n${notificationLog}`;
                    
                    
                    const lines = notificationLog.split('\n');
                    if (lines.length > 20) {
                        notificationLog = lines.slice(0, 20).join('\n');
                    }
                    
                    if (logText) {
                        logText.text = notificationLog;
                    }
                }
                
                
                
                
                
                Component {
                    id: notificationItemComponent
                    
                    Item {
                        id: notificationItem
                        property var notification
                        property real opacity: 1.0
                        
                        
                        OpacityAnimation on opacity {
                            id: opacityAnimation
                            duration: 50
                            easing.type: Easing.OutQuart
                        }
                        
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 15
                            color: "#000000"
                            border.width: 0
                            opacity: notificationItem.opacity
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.02
                                running: false
                            }
                            
                            
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
                            
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 15
                                spacing: 15
                                
                                
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: notificationItem.notification.icon
                                    font.family: faSolid.name
                                    font.pixelSize: 20
                                    color: pywalColors.colors[notification.colorIndex]
                                }
                                
                                
                                ColumnLayout {
                                    spacing: 5
                                    
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
                                
                                
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf00d" 
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
                            
                            
                            MouseArea {
                                id: notificationMouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                property bool isTouching: false
                                
                                onEntered: {
                                    parent.scale = 1.02;
                                    parent.children[0].children[0].visible = true; 
                                }
                                
                                onExited: {
                                    parent.scale = 1.0;
                                    parent.children[0].children[0].visible = false; 
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
                
                
                Component {
                    id: controlItemComponent
                    
                    Item {
                        id: controlItem
                        property var item
                        width: parent.width
                        height: parent.height
                        
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 20
                            color: "#000000"
                            border.width: 0
                            
                            
                            Text {
                                anchors.centerIn: parent
                                text: controlItem.item.icon
                                font.family: controlItem.item.icon.startsWith("\\uf") ? faSolid.name : faBrands.name
                                font.pixelSize: 24
                                color: controlItem.item.active ? 
                                    pywalColors.colors[controlItem.item.colorIndex] : 
                                    Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                            }
                            
                            
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
                        
                        
                        ScaleAnimation on scale {
                            duration: 50
                            easing.type: Easing.OutQuart
                            from: 1.0
                            to: 1.05
                            running: false
                        }
                        
                        
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
                
                
                Component {
                    id: tabButtonComponent
                    
                    Item {
                        id: tabButton
                        property string icon
                        property bool active: false
                        width: 50
                        height: 50
                        
                        
                        Rectangle {
                            anchors.fill: parent
                            radius: 25
                            color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                            
                            
                            Text {
                                anchors.centerIn: parent
                                text: tabButton.icon
                                font.family: faSolid.name
                                font.pixelSize: 18
                                color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                            }
                        }
                        
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                if (tabButton.onClicked) {
                                    tabButton.onClicked();
                                }
                            }
                            onEntered: {
                                if (!active) {
                                    parent.scale = 1.05;
                                }
                            }
                            onExited: {
                                if (!active) {
                                    parent.scale = 1.0;
                                }
                            }
                        }
                    }
                }
            }

            
            
            
            QtObject {
                id: notifireManager
                
                
                function createNotification(title, message, icon, colorIndex, timeout) {
                    notifireCapsule.createNotification(title, message, icon, colorIndex, timeout);
                }
                
                
                function createTestNotification(appName, title, message, timeout) {
                    notifireCapsule.createTestNotification(appName, title, message, timeout);
                }
                
                
                function removeNotification(id) {
                    notifireCapsule.removeNotification(id);
                }
                
                
                function clearAllNotifications() {
                    notifireCapsule.clearAllNotifications();
                }
                
                
                Connections {
                    target: notificationSystem
                    onNotificationReceived: {
                        
                        let colorIndex = 4; 
                        if (appName === "Mail") colorIndex = 3; 
                        else if (appName === "Calendar") colorIndex = 5; 
                        else if (appName === "System") colorIndex = 1; 
                        
                        
                        notifireCapsule.createNotification(
                            summary,
                            body,
                            iconPath ? iconPath : "\uf0f3", 
                            colorIndex,
                            5000 
                        );
                    }
                }
            }

            
            
            
            QtObject {
                id: notificationSystem
                signal notificationReceived(string appName, string summary, string body, string iconPath)
                
                Component.onCompleted: {
                    
                    try {
                        const dbus = Qt.createQmlObject('import Qt.labs.dbus 6.8; DBus', root, "DBus");
                        const connection = dbus.sessionBus();
                        
                        if (connection) {
                            
                            connection.connect("org.freedesktop.Notifications", "/org/freedesktop/Notifications", 
                                "org.freedesktop.Notifications", "Notification", function(appName, replacesId, appIcon, summary, body, actions, hints, expireTimeout) {
                                notificationReceived(appName, summary, body, appIcon);
                            });
                        }
                    } catch (e) {
                        console.error("فشل إنشاء اتصال DBus:", e);
                    }
                }
            }

            
            
            
            Keys.onPressed: {
                
                if (event.key === Qt.Key_N && event.modifiers & Qt.MetaModifier) {
                    notifireCapsule.onClicked();
                    event.accepted = true;
                }
                
                
                if (event.key === Qt.Key_Escape && notifireCapsule.isExpanded) {
                    notifireCollapseAnimation.restart();
                    notifireCapsule.isExpanded = false;
                    activeCapsule = "";
                    event.accepted = true;
                }
                
                
                if (event.key === Qt.Key_C && event.modifiers & Qt.MetaModifier && event.modifiers & Qt.ShiftModifier) {
                    notifireCapsule.clearAllNotifications();
                    event.accepted = true;
                }
            }

            
            
            
            Capsule {
                id: settingsCapsule
                icon: "\uf013" 
                colorIndex: 4
                capsuleId: "settings"
                width: 50
                height: 50
                property bool isExpanded: false
                property bool isRightClicked: false
                property int animationduration: 50
                
                
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
                
                
                Rectangle {
                    id: capsuleBase
                    anchors.fill: parent
                    radius: width / 2
                    color: "#000000"
                    border.width: 0
                    
                    
                    Text {
                        anchors.centerIn: parent
                        text: settingsCapsule.icon
                        font.family: faSolid.name
                        font.pixelSize: 20
                        color: pywalColors.colors[colorIndex]
                    }
                }
                
                
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
                
                
                MouseArea {
                    id: settingsMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    
                    onEntered: {
                        if (!isExpanded) {
                            hoverAnimation.running = true;
                        }
                    }
                    
                    onExited: {
                        hoverAnimation.to = 1.0;
                        hoverAnimation.running = true;
                        if (!isExpanded) capsuleBase.scale = 1.0;
                    }
                    
                    
                    onClicked: {
                        if (mouse.button === Qt.LeftButton) {
                            
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId !== "settings") {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            
                            settingsExpandAnimation.restart();
                            isExpanded = true;
                            activeCapsule = capsuleId;
                            
                            
                            openSettingsApp();
                            
                            
                            setTimeout(function() {
                                settingsCollapseAnimation.restart();
                                isExpanded = false;
                                activeCapsule = "";
                            }, 200);
                        }
                    }
                    
                    
                    onPressAndHold: {
                        if (!isExpanded) {
                            
                            for (let i = 0; i < capsuleLayout.children.length; i++) {
                                let child = capsuleLayout.children[i];
                                if (child.isExpanded && child.capsuleId !== "settings") {
                                    child.collapseAnimation.restart();
                                    child.isExpanded = false;
                                }
                            }
                            
                            
                            rightClickExpandAnimation.restart();
                            isExpanded = true;
                            isRightClicked = true;
                            activeCapsule = capsuleId;
                            
                            
                            editOptions.visible = true;
                            editOptions.opacity = 0;
                            fadeInAnimation.target = editOptions;
                            fadeInAnimation.restart();
                        } else if (isRightClicked) {
                            
                            rightClickCollapseAnimation.restart();
                            isExpanded = false;
                            isRightClicked = false;
                            activeCapsule = "";
                            
                            
                            fadeOutAnimation.target = editOptions;
                            fadeOutAnimation.onCompleted = function() {
                                editOptions.visible = false;
                            };
                            fadeOutAnimation.restart();
                        }
                    }
                }
                
                
                Item {
                    id: editOptions
                    anchors.fill: parent
                    visible: false
                    opacity: 0
                    
                    
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
                            text: "Hyprland file"
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
                
                
                OpacityAnimation {
                    id: fadeInAnimation
                    from: 0
                    to: 1
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                
                OpacityAnimation {
                    id: fadeOutAnimation
                    from: 1
                    to: 0
                    duration: 50
                    easing.type: Easing.OutQuart
                }
                
                
                
                
                
                function openSettingsApp() {
                    try {
                        
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        
                        
                        process.start("qrc:/SettingsApp/SettingsApp.qml", ["--new-window"]);
                        
                        console.log("تم فتح تطبيق الإعدادات كتطبيق منفصل");
                    } catch (e) {
                        console.error("فشل فتح تطبيق الإعدادات:", e);
                        
                        try {
                            const alternativeProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            alternativeProcess.start("qmlscene", ["qrc:/SettingsApp/SettingsApp.qml"]);
                        } catch (e2) {
                            console.error("فشل جميع محاولات فتح تطبيق الإعدادات:", e2);
                        }
                    }
                }
                
                
                function openHyprlandConfig() {
                    try {
                        
                        const homeDir = "/home/" + Qt.application.arguments[2];
                        const configPath = homeDir + "/.config/hypr/hyprland.conf";
                        
                        
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("alacritty", ["-e", "nvim", configPath]);
                        
                        console.log("تم فتح ملف Hyprland في Neovim");
                        
                        
                        rightClickCollapseAnimation.restart();
                        isExpanded = false;
                        isRightClicked = false;
                        activeCapsule = "";
                        
                        
                        fadeOutAnimation.target = editOptions;
                        fadeOutAnimation.onCompleted = function() {
                            editOptions.visible = false;
                        };
                        fadeOutAnimation.restart();
                    } catch (e) {
                        console.error("فشل فتح ملف Hyprland:", e);
                        
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xterm", ["-e", "nvim", configPath]);
                        } catch (e2) {
                            console.error("فشل جميع محاولات فتح ملف Hyprland:", e2);
                        }
                    }
                }
                
                
                function openQuickShellConfig() {
                    try {
                        
                        const homeDir = "/home/" + Qt.application.arguments[2];
                        const configPath = homeDir + "/.config/quickshell/config.json";
                        
                        
                        const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                        process.start("alacritty", ["-e", "nvim", configPath]);
                        
                        console.log("تم فتح ملف QuickShell في Neovim");
                        
                        
                        rightClickCollapseAnimation.restart();
                        isExpanded = false;
                        isRightClicked = false;
                        activeCapsule = "";
                        
                        
                        fadeOutAnimation.target = editOptions;
                        fadeOutAnimation.onCompleted = function() {
                            editOptions.visible = false;
                        };
                        fadeOutAnimation.restart();
                    } catch (e) {
                        console.error("فشل فتح ملف QuickShell:", e);
                        
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("xterm", ["-e", "nvim", configPath]);
                        } catch (e2) {
                            console.error("فشل جميع محاولات فتح ملف QuickShell:", e2);
                        }
                    }
                }
            }

            
            
            
            Capsule {
                icon: "\uf011" 
                colorIndex: 1
                capsuleId: "power"
                width: 50
                height: 50
                onClicked: root.isPowerMenuOpen = true
            }
        }
    }
    
    
    
    
    
    Item {
        id: powerMenu
        anchors.fill: parent
        visible: isPowerMenuOpen
        z: 996
        
        
        Rectangle {
            anchors.fill: parent
            color: "#000000"
        }
        
        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.7)"
            visible: !powerSaverModeActive
        }

        
        Rectangle {
            anchors.fill: parent
            color: "rgba(0, 0, 0, 0.92)"
            visible: powerSaverModeActive
        }
        
        
        Item {
            id: powerContent
            anchors.centerIn: parent
            width: 300
            height: 400
            
            
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                [1]
                border.width: 0
            }
            
            
            Text {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                text: "الطاقة"
                font.family: ibmPlex.name
                font.pixelSize: 24
                color: pywalColors.colors[7]
            }
            
            
            Repeater {
                model: [
                    {icon: "\uf011", text: "Pause التشغيل", color: 1},
                    {icon: "\uf021", text: "إعادة التشغيل", color: 4},
                    {icon: "\uf090", text: "وضع السكون", color: 5},
                    {icon: "\uf08b", text: "التسجيل الخروج", color: 3},
                    {icon: "\uf00d", text: "إلغاء", color: 7}
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
                            
                            console.log("تنفيذ: " + modelData.text)
                        }
                    }
                }
            }
        }
        
        
        OpacityAnimation on opacity {
            from: 0
            to: 1
            duration: 75
            easing.type: Easing.OutQuart
        }
        
        
        MouseArea {
            anchors.fill: parent
            onClicked: isPowerMenuOpen = false
        }
    }
    
    
    
    
    
    Item {
        id: systemIndicators
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height
        width: 320
        height: 85
        visible: false
        z: 100

        
        property string currentIndicator: "volume"  
        property int volumeLevel: 75
        property int brightnessLevel: 75
        property bool microphoneMuted: false
        property bool isAnimating: false

        
        Timer {
            id: autoHideTimer
            interval: 2000
            onTriggered: {
                if (!isAnimating) {
                    systemIndicators.visible = false
                }
            }
        }

        
        
        
        Rectangle {
            id: indicatorContainer
            anchors.fill: parent
            radius: 20
            color: "#000000"
            border.color: indicatorColor
            border.width: 1
            opacity: 0.92

            
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.7)"
                visible: !powerSaverModeActive
            }

            
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.92)"
                visible: powerSaverModeActive
            }

            
            Rectangle {
                anchors.fill: parent
                color: "rgba(0, 0, 0, 0.92)"
                visible: powerSaverModeActive
            }

            
            OpacityAnimation on opacity {
                duration: 75
                easing.type: Easing.OutQuart
            }

            
            ScaleAnimation on scale {
                id: indicatorExpandAnimation
                duration: 50
                easing.type: Easing.OutBack
                from: 0.9
                to: 1.0
            }

            
            
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 15

                
                Text {
                    id: indicatorIcon
                    layout.alignment: Qt.AlignVCenter
                    font.family: faSolid.name
                    font.pixelSize: 24
                    color: indicatorColor
                    text: indicatorIconText
                }

                
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

                    
                    Rectangle {
                        id: progressThumb
                        width: 22
                        height: 22
                        radius: 11
                        color: "#000000"
                        border.color: indicatorColor
                        border.width: 1
                        x: (parent.width * currentLevel / 100) - width / 2

                        
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

        
        
        
        
        
        property color indicatorColor: {
            switch(currentIndicator) {
                case "volume": return pywalColors.colors[3]
                case "brightness": return pywalColors.colors[1]
                case "microphone": return microphoneMuted ? pywalColors.colors[2] : pywalColors.colors[4]
                default: return pywalColors.colors[6]
            }
        }

        
        property string indicatorIconText: {
            switch(currentIndicator) {
                case "volume":
                    if (volumeLevel === 0) return "\uf026"  
                    if (volumeLevel < 30) return "\uf027"    
                    return "\uf028"                         
                case "brightness":
                    return "\uf185"  
                case "microphone":
                    return microphoneMuted ? "\uf131" : "\uf130"  
                default: return "\uf013"  
            }
        }

        
        property int currentLevel: {
            switch(currentIndicator) {
                case "volume": return volumeLevel
                case "brightness": return brightnessLevel
                case "microphone": return microphoneMuted ? 0 : 100
                default: return 100
            }
        }

        
        function showIndicator(type) {
            currentIndicator = type
            visible = true
            isAnimating = true
            indicatorExpandAnimation.restart()
            
            
            autoHideTimer.restart()
            
            
            setTimeout(() => {
                isAnimating = false
                autoHideTimer.start()
            }, 500)
        }

        
        function setVolumeLevel(level) {
            volumeLevel = Math.round(level / 5) * 5  
            autoHideTimer.restart()
            
            
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("wpctl", ["set-volume", "@DEFAULT_AUDIO_SINK@", volumeLevel + "%"])
            } catch (e) {
                console.error("فشل تعيين مستوى الصوت:", e)
            }
        }

        function toggleMute() {
            if (volumeLevel === 0) {
                setVolumeLevel(50)
            } else {
                volumeLevel = 0
            }
        }

        
        function setBrightnessLevel(level) {
            brightnessLevel = Math.round(level / 5) * 5  
            autoHideTimer.restart()
            
            
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("brightnessctl", ["set", brightnessLevel + "%"])
            } catch (e) {
                console.error("فشل تعيين مستوى السطوع:", e)
            }
        }

        function increaseBrightness() {
            setBrightnessLevel(Math.min(100, brightnessLevel + 5))
        }

        function decreaseBrightness() {
            setBrightnessLevel(Math.max(0, brightnessLevel - 5))
        }

        
        function toggleMicrophoneMute() {
            microphoneMuted = !microphoneMuted
            autoHideTimer.restart()
            
            
            try {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process")
                process.start("wpctl", ["set-mute", "@DEFAULT_AUDIO_SOURCE@", microphoneMuted ? "1" : "0"])
            } catch (e) {
                console.error("فشل تغيير حالة المايكروفون:", e)
            }
        }

        
        
        
        
        
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
                    
                    
                    const match = output.match(/(\d+)%/)
                    if (match) {
                        volumeLevel = parseInt(match[1])
                    }
                } catch (e) {
                    console.error("فشل جلب مستوى الصوت:", e)
                }
            }
        }

        
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
                    
                    
                    const match = output.match(/Current brightness: (\d+)%/)
                    if (match) {
                        brightnessLevel = parseInt(match[1])
                    }
                } catch (e) {
                    console.error("فشل جلب مستوى السطوع:", e)
                }
            }
        }

        
        
        
        
        
        Keys.onPressed: {
            
            if (event.key === Qt.Key_MediaToggle) {
                systemIndicators.showIndicator("volume")
                systemIndicators.toggleMute()
                event.accepted = true
            }
            
            
            if (event.key === Qt.Key_VolumeUp) {
                systemIndicators.showIndicator("volume")
                systemIndicators.setVolumeLevel(Math.min(100, systemIndicators.volumeLevel + 5))
                event.accepted = true
            }
            
            
            if (event.key === Qt.Key_VolumeDown) {
                systemIndicators.showIndicator("volume")
                systemIndicators.setVolumeLevel(Math.max(0, systemIndicators.volumeLevel - 5))
                event.accepted = true
            }
            
            
            if (event.key === Qt.Key_BrightnessUp) {
                systemIndicators.showIndicator("brightness")
                systemIndicators.increaseBrightness()
                event.accepted = true
            }
            
            
            if (event.key === Qt.Key_BrightnessDown) {
                systemIndicators.showIndicator("brightness")
                systemIndicators.decreaseBrightness()
                event.accepted = true
            }
            
            
            if (event.key === Qt.Key_MicMuteToggle) {
                systemIndicators.showIndicator("microphone")
                systemIndicators.toggleMicrophoneMute()
                event.accepted = true
            }
        }
    }
    
    
    
    
    
    
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
        
        
        onSourceChanged: {
            const processor = ImageProcessor
            const blurred = processor.applyGlassMorphism(
                sourceItem.grabToImageSync(), 15, 0.2
            )
            source = blurred
        }
    }
    
    
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
                
                
                NumberAnimation on height {
                    duration: 50
                    easing.type: Easing.OutQuart
                }
            }
        }
        
        
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
                text: "\uf130" 
                font.family: faSolid.name
                font.pixelSize: 18
                color: "#000000"
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    AudioVisualizer.isListening = !AudioVisualizer.isListening
                }
            }
        }
    }
    
    
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
            text: "التنبؤ: " + 
                  (UserBehaviorAnalyzer.predictedNextAction !== -1 ? 
                   ["قفل الشاشة", "Open قائمة التطبيقات", "إظهار مركز الإشعارات", "Open الإعدادات"][UserBehaviorAnalyzer.predictedNextAction] : 
                   "لا تنبؤات حالياً")
            anchors.centerIn: parent
            color: UserBehaviorAnalyzer.predictionConfidence > 0.7 ? pywalColors.colors[4] : 
                   UserBehaviorAnalyzer.predictionConfidence > 0.4 ? pywalColors.colors[5] : pywalColors.colors[7]
            font.pixelSize: 16
            opacity: 0
            
            
            OpacityAnimation on opacity {
                duration: 50
                from: 0
                to: 1
            }
        }
        
        
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
    
    
    Connections {
        target: statusBar
        function onActiveCapsuleChanged() {
            if (statusBar.activeCapsule === "power") {
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
            if (root.isAppLauncherOpen) {
                UserBehaviorAnalyzer.recordUserAction(4, "opened_app_launcher")
            }
        }
        
        function onIsPowerMenuOpenChanged() {
            if (root.isPowerMenuOpen) {
                UserBehaviorAnalyzer.recordUserAction(5, "opened_power_menu")
            }
        }
    }
    
    
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
            color: width > memoryIndicator.width * 0.8 ? "#FF0000" : "#4CAF50"
            radius: 10
        }
        
        Text {
            anchors.centerIn: parent
            text: Math.round(ResourceManager.currentMemoryUsage / (1024 * 1024)) + "MB"
            color: "#FFFFFF"
            font.pixelSize: 12
        }
        
        
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
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 
                color: "#000000"
                border.width: 0 
            }
                
            
            Text {
                anchors.centerIn: parent
                text: capsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
                
            
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
                capsuleBase.border.width = 3
            }
            onExited: {
                parent.scale = 1
                capsuleBase.border.width = 2
            }
            onClicked: {
                
                if (capsule.capsuleId === "crosire") {
                    expandAnimation.to = 140
                    expandAnimation.restart()
                    crosireContent.visible = !crosireContent.visible
                } else {
                    collapseAnimation.restart()
                }
                
                capsule.isExpanded = false
                activeCapsule = ""
                
                
                if (capsule.capsuleId === "arch") {
                    isAppLauncherOpen = false
                }
            }
        }
    }
    
    
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
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 
                color: "#000000"
                border.width: 0 
            }
                
            
            Text {
                anchors.centerIn: parent
                text: musicCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
            
            
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
                    capsuleBase.border.width = 3
                }
                onExited: {
                    parent.scale = 1
                    capsuleBase.border.width = 2
                }
                onClicked: {
                    
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

            
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
        }
    }

    
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
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 
                color: "#000000"
                border.width: 0 
            }
                
            
            Text {
                anchors.centerIn: parent
                text: clipboardCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }
            
            
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
                    capsuleBase.border.width = 3
                }
                onExited: {
                    parent.scale = 1
                    capsuleBase.border.width = 2
                }
                onClicked: {
                    
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

            
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
        }
    }

    
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
            
            
            Rectangle {
                id: capsuleBase
                anchors.fill: parent
                radius: width / 2 
                color: "#000000"
                border.width: 0 
            }
                
            
            Text {
                anchors.centerIn: parent
                text: crosireCapsule.icon
                font.family: faSolid.name
                font.pixelSize: 20
                color: pywalColors.colors[colorIndex]
            }

            
            ScaleAnimation on scale {
            id: iconPulse
                duration: 50
                from: 1
                to: 1.1
                loops: Animation.Infinite
                running: crosireCapsule.isListening
                easing.type: Easing.OutInQuad
            }
            
            
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
                capsuleBase.border.width = 3
            }
            onExited: {
                parent.scale = 1
                capsuleBase.border.width = 2
            }
            onClicked: {
                
                isExpanded = !isExpanded;
                if (isExpanded) {
                    crosireCapsuleExpandAnimation.restart();
                    activeCapsule = "crosire";
                } else {
                    crosireCapsuleCollapseAnimation.restart();
                    activeCapsule = "";
                }
            }
            
            
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

            
            ScaleAnimation on scale {
                id: hoverAnimation
                duration: 50
                easing.type: Easing.OutQuart
                from: 1
                to: 1.05
                running: false
            }

            
            ScaleAnimation {
                id: pressAnimation
                target: capsuleBase
                property: "scale"
                duration: 50
                easing.type: Easing.OutBack
            }
            
           
            property string currentQuery: ""
            property string currentResponse: ""
            property string token: "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";

            function queryCrosire(query) {
                currentQuery = query;
                currentResponse = "جاري التفكير...";
                
                try {
                    const xhr = new XMLHttpRequest();
                    xhr.open("POST", "https:
                    xhr.setRequestHeader("Authorization", "Bearer " + token);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                const response = JSON.parse(xhr.responseText);
                                currentResponse = response.choices[0].message.content;
                            } else {
                                currentResponse = "حدث خطأ في الاتصال بـ Crosire";
                            }
                        }
                    };
                    
                    xhr.send(JSON.stringify({
                        "model": "qwen3-max",
                        "messages": [
                            {"role": "user", "content": query}
                        ]
                    }));
                } catch (e) {
                    console.error("فشل استدعاء Crosire:", e);
                    currentResponse = "فشل الاتصال بـ Crosire";
                }
            }
        }
    }
    
    
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
                    spacing: 15
                    
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
    
    
    
    
    
    
    Keys.onPressed: {
        
        if (event.key === Qt.Key_L && event.modifiers & Qt.MetaModifier) {
            isLocked = true;
            event.accepted = true;
        }

        
        if (event.key === Qt.Key_Meta && event.modifiers === Qt.NoModifier) {
            isAppLauncherOpen = !isAppLauncherOpen;
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_MediaToggle) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.setVolumeLevel(indicatorPopup.volumeLevel === 0 ? 50 : 0)
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_VolumeUp) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.increaseVolume()
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_VolumeDown) {
            indicatorPopup.showIndicator("volume")
            indicatorPopup.decreaseVolume()
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_MicMuteToggle) {
            toggleMicrophoneMute();
            event.accepted = true;
        }

        
        if (event.key === Qt.Key_BrightnessUp) {
            indicatorPopup.showIndicator("brightness")
            indicatorPopup.increaseBrightness()
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_BrightnessDown) {
            indicatorPopup.showIndicator("brightness")
            indicatorPopup.decreaseBrightness()
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_N && event.modifiers & Qt.AltModifier) {
            isNotificationCenterOpen = !isNotificationCenterOpen
            event.accepted = true
        }
        
        
        if (event.key === Qt.Key_Escape && event.modifiers & Qt.MetaModifier) {
            isPowerMenuOpen = !isPowerMenuOpen;
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_C && event.modifiers & Qt.AltModifier) {
            crosireContent.visible = !crosireContent.visible
            event.accepted = true
        }
        
        Keys.onPressed: {
            
            if (event.key === Qt.Key_Escape && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                if (isLocked && !isAODActive) {
                    lockScreen.enterAODModeMCX();
                } else if (isAODActive) {
                    lockScreen.wakeUpFromAOD();
                }
                event.accepted = true;
            }

        
        
        
        Keys.onPressed: {
            
            if (event.key === Qt.Key_E && event.modifiers === Qt.MetaModifier) {
                openDrileApp();
                event.accepted = true;
            }

            
            if (event.key === Qt.Key_Q && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("main");
                event.accepted = true;
            }

            
            if (event.key === Qt.Key_W && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("general");
                event.accepted = true;
            }

            
            if (event.key === Qt.Key_E && event.modifiers === (Qt.ControlModifier | Qt.ShiftModifier)) {
                openSettingsApp("shortcuts");
                event.accepted = true;
            }
        }

        
        if (event.key === Qt.Key_V && event.modifiers & Qt.AltModifier) {
            clipboardExpanded.visible = !clipboardExpanded.visible
            event.accepted = true
        }
    }
    
    
    MouseArea {
        anchors.fill: parent
        visible: activeCapsule !== ""
        onClicked: {
            for (let i = 0; i < capsuleLayout.children.length; i++) {
                let child = capsuleLayout.children[i]
                if (child.isExpanded) {
                    
                    if (child.capsuleId === "keyboard") {
                        keyboardCapsule.collapseAnimation.restart()
                    }
                    
                    
                    if (child.capsuleId === "clipboard") {
                        clipboardExpanded.visible = false;
                        clipboardCapsule.collapseAnimation.restart()
                    }
                    
                    
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

    
    
    
    QtObject {
        id: cppIntegration
        property bool initialized: false
        property bool isDebugMode: false
        property int lastGC: 0
        property var pendingCalls: []
        property bool isProcessingCalls: false
        
        
        property var systemServices: {
            "power": null,
            "battery": null,
            "audio": null,
            "display": null,
            "network": null,
            "resources": null
        }
        
        
        property int cpuUsage: 0
        property int memoryUsage: 0
        property int gpuUsage: 0
        property bool isThrottling: false
        
        
        property int animationduration: 50
        property int animationEasing: Easing.OutQuart
        property bool opacityAnimationsEnabled: true
        property bool scaleAnimationsEnabled: true
        property bool slideAnimationsEnabled: true
        property bool rippleAnimationsEnabled: true
        
        
        function initialize() {
            if (initialized) return;
            
            try {
                
                initializeSystemServices();
                
                
                startResourceMonitoring();
                
                
                loadSystemSettings();
                
                initialized = true;
                console.log("تم تهيئة التكامل مع C++ بنجاح");
            } catch (e) {
                console.error("فشل تهيئة التكامل مع C++:", e);
            }
        }
        
        
        function initializeSystemServices() {
            
            systemServices.power = {
                getPowerMode: function(callback) {
                    Qt.callCpp("power.getPowerMode", function(mode) {
                        callback(mode);
                    });
                },
                setPowerMode: function(mode, callback) {
                    Qt.callCpp("power.setPowerMode", mode, function(success) {
                        if (success) {
                            updatePerformanceSettings(mode);
                        }
                        callback(success);
                    });
                }
            };
            
            
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
            
            
            systemServices.network = {
                getActiveConnection: function(callback) {
                    Qt.callCpp("network.getActiveConnection", function(connection) {
                        callback(connection);
                    });
                },
                scanWiFi: function(callback) {
                    Qt.callCpp("network.scanWiFi", function(networks) {
                        callback(networks);
                    });
                }
            };
            
            
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
                        
                        
                        if (cpuUsage > 90 || memoryUsage > 85) {
                            throttleSystem();
                        } else if (isThrottling && cpuUsage < 70 && memoryUsage < 70) {
                            restorePerformance();
                        }
                    });
                }
            }
        }
        
        
        function loadSystemSettings() {
            try {
                const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                fs.source = "/home/user/.config/quickshell/system-settings.json";
                const data = fs.read();
                
                if (data) {
                    const settings = JSON.parse(data);
                    animationDuration = settings.animationDuration || 75;
                    animationEasing = settings.animationEasing || Easing.OutQuart;
                    opacityAnimationsEnabled = settings.opacityAnimationsEnabled !== false;
                    scaleAnimationsEnabled = settings.scaleAnimationsEnabled !== false;
                    slideAnimationsEnabled = settings.slideAnimationsEnabled !== false;
                    rippleAnimationsEnabled = settings.rippleAnimationsEnabled !== false;
                }
            } catch (e) {
                console.error("فشل تحميل إعدادات النظام:", e);
            }
        }
        
        
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
            } catch (e) {
                console.error("فشل حفظ إعدادات النظام:", e);
            }
        }
        
        
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
        
        
        function throttleSystem() {
            if (isThrottling) return;
            
            isThrottling = true;
            console.log("تنشيط وضع التوفير التلقائي بسبب ارتفاع استخدام الموارد");
            
            
            animationDuration = 50;
            animationEasing = Easing.Linear;
            
            
            opacityAnimationsEnabled = false;
            scaleAnimationsEnabled = false;
            rippleAnimationsEnabled = false;
            
            
            systemServices.resources.setUpdateInterval(500);
        }
        
        
        function restorePerformance() {
            isThrottling = false;
            console.log("استعادة الأداء الطبيعي بعد تحسن استخدام الموارد");
            
            
            animationDuration = 100;
            animationEasing = Easing.OutQuart;
            
            
            opacityAnimationsEnabled = true;
            scaleAnimationsEnabled = true;
            rippleAnimationsEnabled = false;
            
            
            systemServices.resources.setUpdateInterval(300);
        }
        
        
        function collectGarbage() {
            
            if ((Date.now() - lastGC > 300000) || (Qt.application.memoryUsage > 0.7)) {
                systemServices.resources.collectGarbage();
                lastGC = Date.now();
            }
        }
        
        
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
                if (call.callback) {
                    call.callback(result);
                }
                isProcessingCalls = false;
                processPendingCalls();
            });
        }
        
        
        function monitorPerformance() {
            Timer {
                id: performanceMonitor
                interval: 5000
                running: true
                onTriggered: {
                    
                    const startTime = Date.now();
                    Qt.callCpp("test.performance", function() {
                        const responseTime = Date.now() - startTime;
                        
                        
                        if (responseTime > 100) {
                            if (!isThrottling) {
                                console.log("زيادة زمن الاستجابة إلى " + responseTime + "ms، تفعيل وضع التوفير");
                                throttleSystem();
                            }
                        }
                    });
                }
            }
        }
        
        
        function testConnection() {
            Qt.callCpp("test.connection", function(result) {
                console.log("اتصال C++ ناجح:", result);
            });
        }
        
        
        function logError(error, context) {
            if (isDebugMode) {
                console.error("خطأ في التكامل مع C++ [" + context + "]:", error);
            }
            
            try {
                const fs = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                fs.source = "/home/user/.config/quickshell/errors.log";
                fs.write("[" + new Date().toISOString() + "] [" + context + "]: " + error + "\n", true);
            } catch (e) {
                console.error("فشل تسجيل الخطأ:", e);
            }
        }
        
        
        Component.onCompleted: {
            initialize();
            monitorPerformance();
            
            
            Timer {
                interval: 60000 
                running: true
                onTriggered: collectGarbage()
            }
        }
    }
    
    
    
    
    
    Component {
        id: toastComponent
        
        Item {
            id: toast
            width: 300
            height: 60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            
            
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                [4]
                border.width: 0
                opacity: 0.9
                
                
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.7)"
                    visible: !powerSaverModeActive
                }

                
                Rectangle {
                    anchors.fill: parent
                    color: "rgba(0, 0, 0, 0.92)"
                    visible: powerSaverModeActive
                }
            }
            
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 15
                
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
            
            
            OpacityAnimation on opacity {
                id: showAnimation
                from: 0
                to: 1
                duration: 50
                easing.type: Easing.OutQuart
            }
            
            
            OpacityAnimation on opacity {
                id: hideAnimation
                from: 1
                to: 0
                duration: 50
                easing.type: Easing.OutQuart
                onRunningChanged: {
                    if (!running && to === 0) {
                        toast.destroy();
                    }
                }
            }
        }
    }

    
    
    
    function openDrileApp() {
        
        if (isDrileOpen) {
            console.log("تطبيق Drile مفتوح بالفعل.");
            return;
        }

        
        isDrileOpen = true;

        
        drileApp.visible = true;
        drileOpenAnimation.restart();
    }

    
    
    
    Item {
        id: drileApp
        anchors.fill: parent
        visible: false

        
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.9
            radius: 15
            border.color: pywalColors.colors[6]
            border.width: 1
        }

        
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "Drile File Manager"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 24
                color: pywalColors.colors[7]
            }

            Button {
                text: "إغلاق Drile"
                width: 150
                height: 40
                onClicked: closeDrileApp()
            }
        }

        
        ParallelAnimation {
            id: drileOpenAnimation
            NumberAnimation {
                target: drileApp
                property: "opacity"
                from: 0
                to: 1
                duration: 4 
            }
            ScaleAnimation {
                target: drileApp
                property: "scale"
                from: 0.8
                to: 1
                duration: 4 
            }
        }

        
        ParallelAnimation {
            id: drileCloseAnimation
            NumberAnimation {
                target: drileApp
                property: "opacity"
                from: 1
                to: 0
                duration: 4
            }
            ScaleAnimation {
                target: drileApp
                property: "scale"
                from: 1
                to: 0.8
                duration: 4
            }
            onRunningChanged: {
                if (!running) {
                    drileApp.visible = false;
                    isDrileOpen = false;
                }
            }
        }
    }

    
    function closeDrileApp() {
        drileCloseAnimation.restart();
    }

    
    
    
    
    Timer {
        id: systemMonitor
        interval: 60000 
        repeat: true
        running: true
        onTriggered: {
            monitorSystem();
        }
    }
    
    
    function monitorSystem() {
        try {
            
            const memoryProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            memoryProcess.start("free", ["-m"]);
            memoryProcess.waitForFinished();
            const memoryOutput = memoryProcess.readAllStandardOutput().trim();
            
            if (memoryOutput) {
                const lines = memoryOutput.split("\n");
                if (lines.length > 1) {
                    const memoryInfo = lines[1].split(/\s+/);
                    const total = parseInt(memoryInfo[1]);
                    const used = parseInt(memoryInfo[2]);
                    const usagePercent = (used / total) * 100;
                    
                    if (usagePercent > 90) {
                        showToast("تحذير: استخدام الذاكرة مرتفع (" + usagePercent.toFixed(1) + "%)", "\uf240");
                        
                        
                        const crosireSuggestion = "يبدو أن استخدام الذاكرة مرتفع. هل تريد إغلاق التطبيقات غير الضرورية؟";
                        showToast(crosireSuggestion, "\ue2ca");
                    }
                }
            }
            
            
            const cpuProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            cpuProcess.start("top", ["-bn1"]);
            cpuProcess.waitForFinished();
            const cpuOutput = cpuProcess.readAllStandardOutput().trim();
            
            if (cpuOutput) {
                const lines = cpuOutput.split("\n");
                for (const line of lines) {
                    if (line.includes("Cpu(s)")) {
                        const cpuInfo = line.split(",")[0];
                        const usagePercent = parseFloat(cpuInfo.split(":")[1].trim());
                        
                        if (usagePercent > 90) {
                            showToast("تحذير: استخدام وحدة المعالجة المركزية مرتفع (" + usagePercent + "%)", "\uf2db");
                            
                            
                            const crosireSuggestion = "يبدو أن استخدام وحدة المعالجة المركزية مرتفع. هل تريد إغلاق التطبيقات الثقيلة؟";
                            showToast(crosireSuggestion, "\ue2ca");
                        }
                    }
                }
            }
            
            
            const diskProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            diskProcess.start("df", ["/"]);
            diskProcess.waitForFinished();
            const diskOutput = diskProcess.readAllStandardOutput().trim();
            
            if (diskOutput) {
                const lines = diskOutput.split("\n");
                if (lines.length > 1) {
                    const diskInfo = lines[1].split(/\s+/);
                    const usagePercent = parseInt(diskInfo[4].replace("%", ""));
                    
                    if (usagePercent > 90) {
                        showToast("تحذير: مساحة التخزين منخفضة (" + usagePercent + "%)", "\uf0a0");
                        
                        
                        const crosireSuggestion = "يبدو أن مساحة التخزين منخفضة. هل تريد حذف الملفات المؤقتة؟";
                        showToast(crosireSuggestion, "\ue2ca");
                    }
                }
            }
        } catch (e) {
            console.error("فشل مراقبة النظام:", e);
        }
    }
    
    
    
    
    
    function getBatteryInfo() {
        try {
            const fs = Qt.createQmlObject('import QtQuick 2.0; FileIO', root, "FileIO")
            fs.source = "/sys/class/power_supply/BAT0/capacity"
            const capacity = fs.read().trim()
            return capacity + "%"
        } catch (e) {
            console.warn("لم يتم العثور على معلومات البطارية")
            return "N/A"
        }
    }
    
    
    function getNetworkName() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("nmcli", ["-t", "-f", "ACTIVE,SSID", "dev", "wifi"]);
            process.waitForFinished();
            const output = process.readAllStandardOutput().trim();
            
            if (output) {
                const lines = output.split("\n");
                for (const line of lines) {
                    if (line.startsWith("yes:")) {
                        return line.split(":")[1];
                    }
                }
            }
            
            return "غير متصل";
        } catch (e) {
            console.error("فشل جلب اسم الشبكة:", e);
            return "غير متصل";
        }
    }
    
    
    
    
    
    function analyzeSystemIssue(issueDescription) {
        try {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "https:
            xhr.setRequestHeader("Authorization", "Bearer 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");
            xhr.setRequestHeader("Content-Type", "application/json");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        const solution = response.choices[0].message.content;
                        showToast("اقتراح من Crosire: " + solution, "\ue2ca");
                    } else {
                        showToast("فشل تحليل المشكلة", "\uf071");
                    }
                }
            };
            
            xhr.send(JSON.stringify({
                "model": "mistralai/mistral-7b-instruct",
                "messages": [
                    {"role": "system", "content": "أنت مساعد تقني خبير في حل مشاكل نظام التشغيل"},
                    {"role": "user", "content": "المشكلة: " + issueDescription + "\nما هي الحلول الممكنة؟"}
                ]
            }));
        } catch (e) {
            console.error("فشل استدعاء Crosire لتحليل المشكلة:", e);
            showToast("فشل الاتصال بـ Crosire", "\uf071");
        }
    }
    
    
    function optimizeUserExperience() {
        try {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "https:
            xhr.setRequestHeader("Authorization", "Bearer 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");
            xhr.setRequestHeader("Content-Type", "application/json");
            
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        const response = JSON.parse(xhr.responseText);
                        const recommendations = response.choices[0].message.content;
                        showToast("توصيات من Crosire لتحسين تجربة المستخدم:\n" + recommendations, "\ue2ca");
                    }
                }
            };
            
            xhr.send(JSON.stringify({
                "model": "mistralai/mistral-7b-instruct",
                "messages": [
                    {"role": "system", "content": "أنت مساعد تقني خبير في تحسين تجربة المستخدم لنظام التشغيل"},
                    {"role": "user", "content": "ما هي التوصيات لتحسين تجربة المستخدم لنظام QuickShell مع مراعاة الأداء والجماليات؟"}
                ]
            }));
        } catch (e) {
            console.error("فشل استدعاء Crosire لتحسين تجربة المستخدم:", e);
        }
    }
    
    
    
    
    Component.onCompleted: {
        
        systemMonitor.start();
        
        
        optimizeUserExperience();
    }
}
EOL

echo "(2/5) انشاء تطبيق الإعدادات..."
echo "-----------------------------------"
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




Item {
    id: settingsApp
    width: 1000
    height: 650
    property string activeTab: "home"
    property string activeSubTab: ""
    property bool isExpanded: false
    property int animationduration: 50
    
    
    property var themeList: []
    property var wallpaperList: []
    property var iconList: []
    property var mouseCursorList: []
    property var fontList: []
    
    
    property string settingsAppSection: "main"
    
                  
                background: Rectangle {
                    color: settingsAppSection === modelData.section ? 
                           Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.2) : 
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

    
    
    
    Rectangle {
        id: settingsContainer
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        visible: false
        
        
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
        
        
        Item {
            id: islandContainer
            width: parent.width * 0.9
            height: 50
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            
            
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: 25
                color: Qt.rgba(0, 0, 0, 0.85)
                border.width: 0
                
                
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
            
            
            RowLayout {
                id: tabBar
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                height: 50
                
                
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
                
                
                TabButton {
                    text: languageManager.tr("language")
                    active: activeTab === "language"
                    onClicked: {
                        activeTab = "language"
                    }
                }

                
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
        
        
        Item {
            id: tabContent
            anchors.top: parent.top
            anchors.topMargin: 20
            width: parent.width
            height: parent.height - 70
            
            
            Item {
                id: homeTab
                anchors.fill: parent
                visible: activeTab === "home"
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 20
                    
                    
                    Rectangle {
                        id: crosireRecommendations
                        width: parent.width
                        height: 120
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10
                            
                            Text {
                                text: "توصيات Crosire"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: pywalColors.colors[6]
                            }
                            
                            Text {
                                text: "تم اكتشاف أنك تستخدم جهازًا حديثًا. نوصي بتفعيل الأنميشنات لتحسين تجربة المستخدم."
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
                                text: "تطبيق التوصية"
                                
                                onClicked: {
                                    animationsSettings.setAnimationSpeed(100);
                                }
                            }
                        }
                    }
                    
                    
                    Grid {
                        columns: 2
                        width: parent.width
                        spacing: 15
                        
                        
                        QuickShortcut {
                            icon: "\uf133"
                            title: "مركز التخصيص"
                            description: "تخصيص مظهر النظام بالكامل"
                            onClicked: {
                                activeTab = "customization";
                                activeSubTab = "themes";
                            }
                        }
                        
                        
                        QuickShortcut {
                            icon: "\uf108"
                            title: "إعدادات الشاشة"
                            description: "السطوع، الدقة، وحماية العينين"
                            onClicked: {
                                activeTab = "display";
                                displaySettings.loadDisplayInfo();
                            }
                        }
                        
                        
                        QuickShortcut {
                            icon: "\uf2db"
                            title: "الموارد"
                            description: "مراقبة واستخدام الموارد"
                            onClicked: {
                                activeTab = "resources";
                                loadResourceData();
                            }
                        }
                        
                        
                        QuickShortcut {
                            icon: "\uf108"
                            title: "حول الجهاز"
                            description: "المواصفات الفنية لجهازك"
                            onClicked: {
                                activeTab = "about";
                                activeSubTab = "device";
                            }
                        }
                    }
                    
                    
                    Rectangle {
                        id: quickTips
                        width: parent.width
                        height: 100
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 5
                            
                            Text {
                                text: "نصائح سريعة"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 16
                                color: pywalColors.colors[4]
                            }
                            
                            Text {
                                text: "اضغط Meta + Shift + C يمكنك تخصيص الاختصارات في مركز التخصيص."
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
            
            
            Item {
                id: customizationTab
                anchors.fill: parent
                visible: activeTab === "customization"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 15
                    anchors.margins: 15
                    
                    
                    RowLayout {
                        id: subTabBar
                        width: parent.width
                        height: 40
                        spacing: 10
                        
                        
                        SubTabButton {
                            icon: "\uf042"
                            label: "الثيمات"
                            active: activeSubTab === "themes"
                            onClicked: activeSubTab = "themes"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf108"
                            label: "النوافذ"
                            active: activeSubTab === "windows"
                            onClicked: activeSubTab = "windows"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf245"
                            label: "الماوس"
                            active: activeSubTab === "mouse"
                            onClicked: activeSubTab = "mouse"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf5fc"
                            label: "الخلفيات"
                            active: activeSubTab === "wallpapers"
                            onClicked: activeSubTab = "wallpapers"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf11b"
                            label: "الأيقونات"
                            active: activeSubTab === "icons"
                            onClicked: activeSubTab = "icons"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf023"
                            label: "شاشة القفل"
                            active: activeSubTab === "lockscreen"
                            onClicked: activeSubTab = "lockscreen"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf031"
                            label: "الخطوط"
                            active: activeSubTab === "fonts"
                            onClicked: activeSubTab = "fonts"
                        }
                        
                        
                        SubTabButton {
                            icon: "\uf11c"
                            label: "الاختصارات"
                            active: activeSubTab === "shortcuts"
                            onClicked: activeSubTab = "shortcuts"
                        }
                    }
                    
                    
                    Item {
                        id: subTabContent
                        Layout.fillWidth: true
                        height: parent.height - 40
                        
                        
                        Item {
                            id: themesSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "themes"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
                                Rectangle {
                                    id: currentThemeInfo
                                    width: parent.width
                                    height: 80
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 15
                                        
                                        
                                        Text {
                                            anchors.verticalCenter: parent.verticalCenter
                                            text: "\uf042"
                                            font.family: faSolid.name
                                            font.pixelSize: 24
                                            color: pywalColors.colors[2]
                                        }
                                        
                                        
                                        ColumnLayout {
                                            spacing: 5
                                            
                                            Text {
                                                text: "الثيم الحالي: Desind Dark"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            Text {
                                                text: "مظهر مظلم مع ألوان متناسقة"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 14
                                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            }
                                        }
                                    }
                                }
                                
                                
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
                                    
                                    
                                    OpacityAnimation on opacity {
                                        duration: 50
                                        easing.type: Easing.OutQuart
                                        from: 0
                                        to: 1
                                    }
                                }
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر الثيمات"
                                    
                                    onClicked: {
                                        openThemeStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: windowsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "windows"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
                                Rectangle {
                                    id: windowProperties
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 15
                                        
                                        
                                        OptionGroup {
                                            title: "شكل الحواف"
                                            options: ["مربعة", "مدوّرة قليلاً", "مدوّرة بالكامل"]
                                            currentIndex: 2
                                            onOptionSelected: {
                                                setWindowCorners(index);
                                            }
                                        }
                                        
                                        
                                        OptionGroup {
                                            title: "حجم الحواف"
                                            options: ["صغير", "متوسط", "كبير"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setWindowRadius(index);
                                            }
                                        }
                                    }
                                }
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر أشكال النوافذ"
                                    
                                    onClicked: {
                                        openWindowStyleStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: mouseSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "mouse"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
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
                                    
                                    
                                    OpacityAnimation on opacity {
                                        duration: 50
                                        easing.type: Easing.OutQuart
                                        from: 0
                                        to: 1
                                    }
                                }
                                
                                
                                Rectangle {
                                    id: mouseProperties
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 15
                                        
                                        
                                        SliderControl {
                                            title: "سرعة الماوس"
                                            min: 0
                                            max: 10
                                            value: 5
                                            onValueChanged: {
                                                setMouseSpeed(value);
                                            }
                                        }
                                        
                                        
                                        ToggleControl {
                                            title: "عكس اتجاه التمرير"
                                            active: false
                                            onToggled: {
                                                setMouseScrollDirection(active);
                                            }
                                        }
                                    }
                                }
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر مؤشرات الماوس"
                                    
                                    onClicked: {
                                        openMouseCursorStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: wallpapersSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "wallpapers"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
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
                                        text: "الخلفية الحالية"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 24
                                        color: pywalColors.colors[7]
                                    }
                                }
                                
                                
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
                                
                                
                                Rectangle {
                                    id: wallpaperProperties
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 15
                                        
                                        
                                        OptionGroup {
                                            title: "وضع العرض"
                                            options: ["ممتلئ", "مطابق", "مُكبّر", "مُصغّر"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setWallpaperMode(index);
                                            }
                                        }
                                        
                                        
                                        ToggleControl {
                                            title: "الخلفيات المتحركة"
                                            active: false
                                            onToggled: {
                                                setAnimatedWallpaper(active);
                                            }
                                        }
                                    }
                                }
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر الخلفيات"
                                    
                                    onClicked: {
                                        openWallpaperStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: iconsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "icons"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
                                Rectangle {
                                    id: systemIconsSection
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "أيقونات النظام"
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
                                
                                
                                Rectangle {
                                    id: appIconsSection
                                    width: parent.width
                                    height: 200
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "أيقونات التطبيقات"
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
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر الأيقونات"
                                    
                                    onClicked: {
                                        openIconsStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: lockscreenSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "lockscreen"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
                                Rectangle {
                                    id: lockscreenPreview
                                    width: parent.width
                                    height: 300
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.centerIn: parent
                                        anchors.margins: 15
                                        spacing: 20
                                        
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
                                
                                
                                Rectangle {
                                    id: lockscreenProperties
                                    width: parent.width
                                    height: 250
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 15
                                        
                                        
                                        OptionGroup {
                                            title: "حجم الساعة"
                                            options: ["صغير", "متوسط", "كبير"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setLockscreenClockSize(index);
                                            }
                                        }
                                        
                                        
                                        OptionGroup {
                                            title: "مكان الساعة"
                                            options: ["الأعلى", "المنتصف", "الأسفل"]
                                            currentIndex: 1
                                            onOptionSelected: {
                                                setLockscreenClockPosition(index);
                                            }
                                        }
                                        
                                        
                                        OptionGroup {
                                            title: "خط الساعة"
                                            options: ["Thin", "Light", "Regular", "Bold"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setLockscreenClockFont(index);
                                            }
                                        }
                                        
                                        
                                        OptionGroup {
                                            title: "الخلفية"
                                            options: ["الخلفية الحالية", "خلفية مظلمة", "صورة مخصصة"]
                                            currentIndex: 0
                                            onOptionSelected: {
                                                setLockscreenWallpaper(index);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: fontsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "fonts"
                            
                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 15
                                
                                
                                Rectangle {
                                    id: systemFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "خط النظام"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[2]
                                        }
                                        
                                        Text {
                                            text: "يتم استخدام هذا الخط في جميع أجزاء النظام"
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
                                
                                
                                Rectangle {
                                    id: appFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "خط التطبيقات"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[3]
                                        }
                                        
                                        Text {
                                            text: "يتم استخدام هذا الخط في التطبيقات المدعومة"
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
                                
                                
                                Rectangle {
                                    id: codeFontSection
                                    width: parent.width
                                    height: 150
                                    radius: 15
                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                    
                                    ColumnLayout {
                                        anchors.fill: parent
                                        anchors.margins: 15
                                        spacing: 10
                                        
                                        Text {
                                            text: "خط الواجهة البرمجية"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 16
                                            color: pywalColors.colors[4]
                                        }
                                        
                                        Text {
                                            text: "يتم استخدام هذا الخط في التطبيقات البرمجية"
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
                                
                                
                                Button {
                                    width: 200
                                    height: 40
                                    radius: 20
                                    color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                    border.color: pywalColors.colors[5]
                                    border.width: 1
                                    text: "متجر الخطوط"
                                    
                                    onClicked: {
                                        openFontStore();
                                    }
                                }
                            }
                        }
                        
                        
                        Item {
                            id: shortcutsSubTab
                            anchors.fill: parent
                            visible: activeSubTab === "shortcuts"

                        
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
                                text: "الاختصارات"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 18
                                color: pywalColors.colors[7]
                            }

                            Text {
                                anchors.left: parent.left
                                anchors.leftMargin: 25
                                anchors.verticalCenter: parent.verticalCenter
                                text: "\uf0c7" 
                                font.family: faSolid.name
                                font.pixelSize: 20
                                color: pywalColors.colors[6]
                            }
                        }

                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.topMargin: 60
                            spacing: 10

                            
                            TextField {
                                id: searchInput
                                Layout.fillWidth: true
                                placeholderText: "ابحث عن اختصار..."
                                background: Rectangle {
                                    radius: 10
                                    color: "#1E1E1E"
                                    border.color: pywalColors.colors[4]
                                    border.width: 1
                                }
                                onTextChanged: filterShortcuts(text)
                            }

                            
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

                            
                            Button {
                                text: "إضافة اختصار جديد"
                                width: 200
                                height: 40
                                anchors.horizontalCenter: parent.horizontalCenter
                                onClicked: openAddShortcutDialog()
                            }
                        }

                        
                        property var shortcutsModel: []
                        property var filteredShortcutsModel: shortcutsModel

                        
                        function filterShortcuts(query) {
                            if (!query.trim()) {
                                filteredShortcutsModel = shortcutsModel;
                                return;
                            }
                            filteredShortcutsModel = shortcutsModel.filter(function(shortcut) {
                                return shortcut.name.toLowerCase().includes(query.toLowerCase()) ||
                                    shortcut.key.toLowerCase().includes(query.toLowerCase());
                            });
                        }

                        
                        Timer {
                            interval: 2000
                            repeat: true
                            running: true
                            onTriggered: loadShortcuts()
                        }

                        
                        function loadShortcuts() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("hyprctl", ["getoption", "binds"]);
                                process.waitForFinished();
                                const output = process.readAllStandardOutput();

                                let newShortcuts = [];
                                const lines = output.split("\n");
                                for (let i = 0; i < lines.length; i++) {
                                    const line = lines[i].trim();
                                    if (line.startsWith("bind")) {
                                        const parts = line.split(" ");
                                        const key = parts[1];
                                        const command = parts.slice(2).join(" ");
                                        newShortcuts.push({
                                            id: Date.now() + i,
                                            name: getShortcutName(command),
                                            key: key,
                                            description: getShortcutDescription(command)
                                        });
                                    }
                                }

                                
                                shortcutsModel = newShortcuts;
                                filteredShortcutsModel = newShortcuts;
                            } catch (e) {
                                console.error("فشل تحميل الاختصارات:", e);
                            }
                        }

                        
                        function getShortcutName(command) {
                            if (command.includes("exec")) {
                                return "تنفيذ أمر";
                            } else if (command.includes("workspace")) {
                                return "تغيير مساحة العمل";
                            } else if (command.includes("togglefloating")) {
                                return "تبديل وضع العوامة";
                            } else {
                                return "اختصار مخصص";
                            }
                        }

                        
                        function getShortcutDescription(command) {
                            return command.replace("exec", "").trim();
                        }

                        
                        function openAddShortcutDialog() {
                            addShortcutDialog.open();
                        }

                        
                        function openEditDialog(shortcut) {
                            editShortcutDialog.shortcut = shortcut;
                            editShortcutDialog.open();
                        }

                        
                        function deleteShortcut(id) {
                            try {
                                const index = shortcutsModel.findIndex(function(shortcut) {
                                    return shortcut.id === id;
                                });
                                if (index !== -1) {
                                    shortcutsModel.splice(index, 1);
                                    saveShortcuts();
                                }
                            } catch (e) {
                                console.error("فشل حذف الاختصار:", e);
                            }
                        }

                        
                        function saveShortcuts() {
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("hyprctl", ["keyword", "binds", JSON.stringify(shortcutsModel)]);
                                process.waitForFinished();
                            } catch (e) {
                                console.error("فشل حفظ الاختصارات:", e);
                            }
                        }

                        
                        Dialog {
                            id: addShortcutDialog
                            title: "إضافة اختصار جديد"
                            standardButtons: Dialog.Ok | Dialog.Cancel

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 10

                                TextField {
                                    id: shortcutNameInput
                                    placeholderText: "اسم الاختصار"
                                }

                                TextField {
                                    id: shortcutKeyInput
                                    placeholderText: "مفتاح الاختصار"
                                }

                                TextField {
                                    id: shortcutCommandInput
                                    placeholderText: "الأمر المرتبط"
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

                        
                        Dialog {
                            id: editShortcutDialog
                            title: "تعديل اختصار"
                            standardButtons: Dialog.Ok | Dialog.Cancel
                            property var shortcut: null

                            ColumnLayout {
                                anchors.fill: parent
                                spacing: 10

                                TextField {
                                    id: editShortcutNameInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.name : ""
                                }

                                TextField {
                                    id: editShortcutKeyInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.key : ""
                                }

                                TextField {
                                    id: editShortcutCommandInput
                                    text: editShortcutDialog.shortcut ? editShortcutDialog.shortcut.description : ""
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

                    
                    Component {
                        id: shortcutItemComponent
                        Item {
                            id: shortcutItem
                            width: parent.width
                            height: 50

                            RowLayout {
                                anchors.fill: parent
                                spacing: 10

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
                                    text: "تعديل"
                                    onClicked: onEditShortcut()
                                }

                                Button {
                                    text: "حذف"
                                    onClicked: onDeleteShortcut()
                                }
                            }
                        }
                    }
                }
            }

            
            Item {
                id: displayTab
                anchors.fill: parent
                visible: activeTab === "display"
                
                
                Item {
                    id: displaySettings
                    anchors.fill: parent
                    
                    
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
                                    if (line.startsWith("Monitor")) {
                                        if (currentMonitor) {
                                            monitors.push(currentMonitor);
                                        }
                                        
                                        currentMonitor = {
                                            name: line.split(" ")[1],
                                            isPrimary: line.includes("primary"),
                                            resolution: "",
                                            refreshRate: 0,
                                            brightness: 100
                                        };
                                    } else if (line.includes("at")) {
                                        const parts = line.split(" ");
                                        currentMonitor.resolution = parts[0];
                                        currentMonitor.refreshRate = parseFloat(parts[3].replace("Hz,", ""));
                                    }
                                }
                                
                                if (currentMonitor) {
                                    monitors.push(currentMonitor);
                                }
                                
                                
                                for (let i = 0; i < monitors.length; i++) {
                                    const monitor = monitors[i];
                                    try {
                                        const brightnessProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                        brightnessProcess.start("brightnessctl", ["info", "-d", "sysfs/backlight/" + monitor.name]);
                                        brightnessProcess.waitForFinished(500);
                                        
                                        if (brightnessProcess.exitCode() === 0) {
                                            const output = brightnessProcess.readAllStandardOutput().trim();
                                            const match = output.match(/Current brightness:\s*(\d+)/);
                                            if (match) {
                                                monitor.brightness = parseInt(match[1]);
                                            }
                                        }
                                    } catch (e) {
                                        console.error("فشل جلب سطوع الشاشة:", e);
                                    }
                                }
                                
                                
                                updateDisplayUI();
                            }
                        } catch (e) {
                            console.error("فشل جلب معلومات الشاشة:", e);
                            
                            monitors = [{
                                name: "الشاشة الداخلية",
                                isPrimary: true,
                                resolution: "1920x1080",
                                refreshRate: 60,
                                brightness: 75
                            }];
                            updateDisplayUI();
                        }
                    }
                    
                    
                    function updateDisplayUI() {
                        
                        if (monitors.length > 0) {
                            currentMonitor = monitors[0];
                            monitorNameText.text = currentMonitor.name;
                            resolutionText.text = currentMonitor.resolution;
                            refreshRateText.text = currentMonitor.refreshRate + " هرتز";
                            brightnessSlider.value = currentMonitor.brightness;
                        }
                    }
                    
                    
                    function changeResolution(resolution) {
                        if (!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["keyword", "monitor", currentMonitor.name + "," + resolution + ",auto,1"]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.resolution = resolution;
                                resolutionText.text = resolution;
                                showToast("تم تغيير الدقة بنجاح", "\uf00c");
                            } else {
                                showToast("فشل تغيير الدقة", "\uf071");
                            }
                        } catch (e) {
                            console.error("فشل تغيير الدقة:", e);
                            showToast("فشل تغيير الدقة", "\uf071");
                        }
                    }
                    
                    
                    function changeRefreshRate(rate) {
                        if (!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("hyprctl", ["keyword", "monitor", currentMonitor.name + "," + currentMonitor.resolution + ",auto," + rate]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.refreshRate = rate;
                                refreshRateText.text = rate + " هرتز";
                                showToast("تم تغيير معدل التحديث بنجاح", "\uf00c");
                            } else {
                                showToast("فشل تغيير معدل التحديث", "\uf071");
                            }
                        } catch (e) {
                            console.error("فشل تغيير معدل التحديث:", e);
                            showToast("فشل تغيير معدل التحديث", "\uf071");
                        }
                    }
                    
                    
                    function setBrightness(value) {
                        if (!currentMonitor) return;
                        
                        try {
                            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                            process.start("brightnessctl", ["set", value + "%", "-d", "sysfs/backlight/" + currentMonitor.name]);
                            process.waitForFinished(500);
                            
                            if (process.exitCode() === 0) {
                                currentMonitor.brightness = value;
                                showToast("تم تغيير السطوع", "\uf00c");
                            } else {
                                showToast("فشل تغيير السطوع", "\uf071");
                            }
                        } catch (e) {
                            console.error("فشل تغيير السطوع:", e);
                            showToast("فشل تغيير السطوع", "\uf071");
                        }
                    }
                    
                    
                    function toggleEyeProtection() {
                        eyeProtectionEnabled = !eyeProtectionEnabled;
                        
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
                            showToast(eyeProtectionEnabled ? "تم تفعيل حماية العينين" : "تم إلغاء تفعيل حماية العينين", "\uf00c");
                        } catch (e) {
                            console.error("فشل تغيير إعدادات حماية العينين:", e);
                            showToast("فشل تغيير إعدادات حماية العينين", "\uf071");
                        }
                    }
                    
                    
                    function setEyeProtectionLevel(level) {
                        eyeProtectionLevel = level;
                        
                        try {
                            if (eyeProtectionEnabled) {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("redshift", ["-O", (6500 - level * 200).toString()]);
                                process.waitForFinished(500);
                            }
                        } catch (e) {
                            console.error("فشل تغيير مستوى حماية العينين:", e);
                        }
                    }
                    
                    
                    property var monitors: []
                    property var currentMonitor: null
                    property bool eyeProtectionEnabled: false
                    property int eyeProtectionLevel: 5
                    
                    
                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 20
                        anchors.margins: 20
                        
                        
                        Rectangle {
                            id: currentDisplayInfo
                            width: parent.width
                            height: 80
                            radius: 15
                            color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                            
                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 15
                                spacing: 15
                                
                                
                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "\uf108"
                                    font.family: faSolid.name
                                    font.pixelSize: 24
                                    color: pywalColors.colors[2]
                                }
                                
                                
                                ColumnLayout {
                                    spacing: 5
                                    
                                    Text {
                                        id: monitorNameText
                                        text: "الشاشة الداخلية"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: pywalColors.colors[2]
                                    }
                                    
                                    Text {
                                        text: "دقة الشاشة والسطوع"
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 14
                                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                    }
                                }
                            }
                        }

                        
                        RowLayout {
                            id: displayTabBar
                            width: parent.width
                            height: 40
                            spacing: 10
                            
                            
                            SubTabButton {
                                icon: "\uf015"
                                label: "العامة"
                                active: activeDisplayTab === "general"
                                onClicked: activeDisplayTab = "general"
                            }
                            
                            
                            SubTabButton {
                                icon: "\uf00d"
                                label: "السطوع"
                                active: activeDisplayTab === "brightness"
                                onClicked: activeDisplayTab = "brightness"
                            }
                            
                            
                            SubTabButton {
                                icon: "\uf120"
                                label: "الدقة"
                                active: activeDisplayTab === "resolution"
                                onClicked: activeDisplayTab = "resolution"
                            }
                            
                            
                            SubTabButton {
                                icon: "\uf26c"
                                label: "الشاشات"
                                active: activeDisplayTab === "displays"
                                onClicked: activeDisplayTab = "displays"
                            }
                            
                            
                            SubTabButton {
                                icon: "\uf001"
                                label: "الأنميشنات"
                                active: activeDisplayTab === "animations"
                                onClicked: activeDisplayTab = "animations"
                            }
                        }
                        
                        
                        Item {
                            id: displayTabContent
                            Layout.fillWidth: true
                            height: parent.height - 120
                            
                            
                            Item {
                                id: generalTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "general"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 20
                                    
                                    
                                    Rectangle {
                                        id: eyeProtectionSection
                                        width: parent.width
                                        height: 100
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 5
                                            
                                            Text {
                                                text: "حماية العينين"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            Text {
                                                text: "تقليل الضوء الأزرق للحماية من إجهاد العين"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 14
                                                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                            }
                                            
                                            RowLayout {
                                                spacing: 10
                                                
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
                                    
                                    
                                    Rectangle {
                                        id: crosireEyeProtectionRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: "توصية Crosire: تم تفعيل حماية العينين تلقائياً لأنك تستخدم الجهاز بعد الساعة 8 مساءً"
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
                            
                            
                            Item {
                                id: brightnessTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "brightness"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 20
                                    
                                    
                                    Rectangle {
                                        id: brightnessControl
                                        width: parent.width
                                        height: 120
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[1].r, pywalColors.colors[1].g, pywalColors.colors[1].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 15
                                            
                                            Text {
                                                text: "سطوع الشاشة"
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
                                    
                                    
                                    Rectangle {
                                        id: crosireBrightnessRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: "توصية Crosire: تم ضبط السطوع تلقائياً بناءً على الإضاءة المحيطة"
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
                            
                            
                            Item {
                                id: resolutionTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "resolution"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 20
                                    
                                    
                                    Rectangle {
                                        id: displayInfoResolution
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                                        
                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 15
                                            
                                            
                                            Text {
                                                anchors.verticalCenter: parent.verticalCenter
                                                text: "\uf108"
                                                font.family: faSolid.name
                                                font.pixelSize: 24
                                                color: pywalColors.colors[2]
                                            }
                                            
                                            
                                            ColumnLayout {
                                                spacing: 5
                                                
                                                Text {
                                                    id: resolutionText
                                                    text: "1920x1080"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 16
                                                    color: pywalColors.colors[2]
                                                }
                                                
                                                Text {
                                                    text: "الدقة الحالية للشاشة"
                                                    font.family: "IBM Plex Sans Thin"
                                                    font.pixelSize: 14
                                                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                                                }
                                            }
                                        }
                                    }
                                    
                                    
                                    Rectangle {
                                        id: resolutionOptions
                                        width: parent.width
                                        height: 200
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 10
                                            
                                            Text {
                                                text: "خيارات الدقة"
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
                                    
                                    
                                    Rectangle {
                                        id: refreshRateSection
                                        width: parent.width
                                        height: 100
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 5
                                            
                                            Text {
                                                text: "معدل التحديث"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[4]
                                            }
                                            
                                            RowLayout {
                                                spacing: 10
                                                
                                                Text {
                                                    id: refreshRateText
                                                    text: "60 هرتز"
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
                                                    text: "120 هرتز"
                                                    onClicked: changeRefreshRate(120)
                                                }
                                                
                                                Button {
                                                    width: 80
                                                    height: 30
                                                    radius: 15
                                                    color: Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1)
                                                    border.color: pywalColors.colors[4]
                                                    border.width: 1
                                                    text: "144 هرتز"
                                                    onClicked: changeRefreshRate(144)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            
                            Item {
                                id: displaysTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "displays"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 20
                                    
                                    
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
                                    
                                    
                                    Rectangle {
                                        id: selectedDisplaySettings
                                        width: parent.width
                                        height: 150
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 10
                                            
                                            Text {
                                                text: "إعدادات الشاشة المحددة"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[5]
                                            }
                                            
                                            RowLayout {
                                                spacing: 10
                                                
                                                ToggleSwitch {
                                                    id: primaryDisplayToggle
                                                    active: currentMonitor ? currentMonitor.isPrimary : false
                                                    onToggled: {
                                                        if (currentMonitor) {
                                                            currentMonitor.isPrimary = active;
                                                            setPrimaryDisplay(currentMonitor.name);
                                                        }
                                                    }
                                                }
                                                
                                                Text {
                                                    text: "شاشة رئيسية"
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
                            
                            
                            Item {
                                id: animationsTab
                                anchors.fill: parent
                                visible: activeDisplayTab === "animations"
                                
                                ColumnLayout {
                                    anchors.fill: parent
                                    spacing: 20
                                    
                                    
                                    Rectangle {
                                        id: animationSpeedSection
                                        width: parent.width
                                        height: 150
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 15
                                            
                                            Text {
                                                text: "سرعة الأنميشنات"
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
                                                text: animationSpeedSlider.value + " مللي ثانية"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 16
                                                color: pywalColors.colors[5]
                                                anchors.horizontalCenter: parent.horizontalCenter
                                            }
                                        }
                                    }
                                    
                                    
                                    Rectangle {
                                        id: crosireAnimationsRecommendation
                                        width: parent.width
                                        height: 70
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                                        
                                        Text {
                                            anchors.centerIn: parent
                                            text: "توصية Crosire: تم ضبط سرعة الأنميشنات تلقائياً بناءً على أداء جهازك"
                                            font.family: "IBM Plex Sans Thin"
                                            font.pixelSize: 14
                                            color: pywalColors.colors[6]
                                            width: parent.width * 0.9
                                            wrapMode: Text.Wrap
                                            horizontalAlignment: Text.AlignHCenter
                                        }
                                    }
                                    
                                    
                                    Rectangle {
                                        id: animationOptionsSection
                                        width: parent.width
                                        height: 200
                                        radius: 15
                                        color: Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1)
                                        
                                        ColumnLayout {
                                            anchors.fill: parent
                                            anchors.margins: 15
                                            spacing: 10
                                            
                                            Text {
                                                text: "الأنميشنات المخصصة"
                                                font.family: "IBM Plex Sans Thin"
                                                font.pixelSize: 18
                                                color: pywalColors.colors[5]
                                            }
                                            
                                            
                                            ColumnLayout {
                                                spacing: 10
                                                
                                                AnimationOption {
                                                    label: "أنميشن فتح/إغلاق الكبسولات"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "أنميشن فتح/إغلاق شاشة القفل"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "أنميشن التمرير بين مساحات العمل"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "أنميشن المؤشرات"
                                                    isEnabled: true
                                                }
                                                
                                                AnimationOption {
                                                    label: "أنميشن الإشعارات"
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
            
            
            Item {
                id: resourcesTab
                anchors.fill: parent
                visible: activeTab === "resources"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    anchors.margins: 20
                    
                    
                    Rectangle {
                        id: resourcesChart
                        width: parent.width
                        height: 200
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        
                        
                        Text {
                            anchors.centerIn: parent
                            text: "مخطط استخدام الموارد"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[2]
                        }
                    }
                    
                    
                    ResourceUsage {
                        title: "الذاكرة"
                        icon: "\uf2db"
                        current: 5.2
                        total: 16
                        unit: "GB"
                        colorIndex: 2
                    }
                    
                    
                    ResourceUsage {
                        title: "المعالج"
                        icon: "\uf2db"
                        current: 35
                        total: 100
                        unit: "%"
                        colorIndex: 3
                    }
                    
                    
                    ResourceUsage {
                        title: "الرسومات"
                        icon: "\uf26c"
                        current: 25
                        total: 100
                        unit: "%"
                        colorIndex: 4
                    }
                    
                    
                    ResourceUsage {
                        title: "التخزين"
                        icon: "\uf0a0"
                        current: 250
                        total: 512
                        unit: "GB"
                        colorIndex: 5
                    }
                    
                    
                    Rectangle {
                        id: activeProcesses
                        width: parent.width
                        height: 200
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10
                            
                            Text {
                                text: "العمليات النشطة"
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
            
            
            Item {
                id: languageTab
                anchors.fill: parent
                
                
                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    text: translationSystem.tr("language_section")
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: pywalColors.colors[2]
                }
                
                
                Text {
                    anchors.top: sectionTitle.bottom
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    text: translationSystem.tr("language_description")
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    wrapMode: Text.Wrap
                }
                
                
                Rectangle {
                    id: languageOptions
                    width: parent.width
                    height: 400
                    anchors.top: description.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 15
                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                    border.color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.3)
                    border.width: 1
                    
                    
                    Text {
                        anchors.top: parent.top
                        anchors.topMargin: 15
                        anchors.left: parent.left
                        anchors.leftMargin: 20
                        text: translationSystem.tr("select_language")
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 18
                        color: pywalColors.colors[2]
                    }
                    
                    
                    GridView {
                        id: languageGrid
                        anchors.top: title.bottom
                        anchors.topMargin: 15
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        cellWidth: 160
                        cellHeight: 60
                        model: Object.keys(translationSystem.languageNames)
                        
                        delegate: Item {
                            width: 160
                            height: 60
                            
                            
                            Rectangle {
                                anchors.fill: parent
                                radius: 10
                                color: modelData === translationSystem.currentLanguage ? 
                                    Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.2) : 
                                    "#000000"
                                border.color: modelData === translationSystem.currentLanguage ? 
                                            pywalColors.colors[2] : 
                                            Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                                border.width: 1
                                
                                Row {
                                    anchors.fill: parent
                                    anchors.margins: 10
                                    spacing: 10
                                    
                                    
                                    Text {
                                        text: translationSystem.languageFlags[modelData]
                                        font.family: faSolid.name
                                        font.pixelSize: 20
                                        color: pywalColors.colors[2]
                                    }
                                    
                                    
                                    Text {
                                        text: translationSystem.languageNames[modelData]
                                        font.family: "IBM Plex Sans Thin"
                                        font.pixelSize: 16
                                        color: modelData === translationSystem.currentLanguage ? 
                                                pywalColors.colors[2] : 
                                                pywalColors.colors[7]
                                    }
                                }
                            }
                            
                            
                            ScaleAnimation on scale {
                                duration: 50
                                easing.type: Easing.OutQuart
                                from: 1.0
                                to: 1.05
                                running: false
                            }
                            
                            
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: {
                                    if (translationSystem.setLanguage(modelData)) {
                                        showToast(translationSystem.tr("language_change_success"), "\uf00c");
                                    } else {
                                        showToast(translationSystem.tr("language_change_error"), "\uf071");
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
                }
                
                
                Rectangle {
                    id: restartInfo
                    width: parent.width
                    height: 70
                    anchors.top: languageOptions.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    radius: 15
                    color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                    border.color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.3)
                    border.width: 1
                    
                    Text {
                        anchors.centerIn: parent
                        text: translationSystem.tr("language_restart_required")
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[6]
                        width: parent.width * 0.9
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                
                
                RowLayout {
                    anchors.top: restartInfo.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    
                    Button {
                        width: 150
                        height: 40
                        radius: 20
                        color: pywalColors.colors[2]
                        border.color: pywalColors.colors[2]
                        border.width: 1
                        text: translationSystem.tr("language_restart_button")
                        
                        onClicked: {
                            
                            try {
                                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                                process.start("systemctl", ["reboot"]);
                            } catch (e) {
                                console.error("فشل إعادة التشغيل:", e);
                                showToast(translationSystem.tr("language_change_error"), "\uf071");
                            }
                        }
                    }
                    
                    Button {
                        width: 150
                        height: 40
                        radius: 20
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                        border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                        border.width: 1
                        text: translationSystem.tr("language_later_button")
                        
                        onClicked: {
                            
                        }
                    }
                }
            }

            
            Item {
                id: aboutTab
                anchors.fill: parent
                visible: activeTab === "about"
                
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    anchors.margins: 20
                    
                    
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
                    
                    
                    Rectangle {
                        id: systemInfoSection
                        width: parent.width
                        height: 300
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                        
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 15
                            
                            Text {
                                text: "معلومات النظام"
                                font.family: "IBM Plex Sans Thin"
                                font.pixelSize: 24
                                color: pywalColors.colors[2]
                            }
                            
                            SystemInfoItem {
                                label: "اسم الجهاز"
                                value: systemInfo.deviceName
                            }
                            
                            SystemInfoItem {
                                label: "نظام التشغيل"
                                value: systemInfo.os
                            }
                            
                            SystemInfoItem {
                                label: "النواة"
                                value: systemInfo.kernel
                            }
                            
                            SystemInfoItem {
                                label: "المعالج"
                                value: systemInfo.processor
                            }
                            
                            SystemInfoItem {
                                label: "الذاكرة"
                                value: systemInfo.memory
                            }
                            
                            SystemInfoItem {
                                label: "الرسومات"
                                value: systemInfo.graphics
                            }
                            
                            SystemInfoItem {
                                label: "التخزين"
                                value: systemInfo.storage
                            }
                        }
                    }
                    
                    
                    Rectangle {
                        id: licenseInfo
                        width: parent.width
                        height: 100
                        radius: 15
                        color: Qt.rgba(pywalColors.colors[6].r, pywalColors.colors[6].g, pywalColors.colors[6].b, 0.1)
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Desind OS مفتوح المصدر مبني على Arch Linux\nمرخص بموجب رخصة GPL v3"
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
    
    
    
    
    
    
    Component {
        id: tabButtonComponent
        
        Item {
            id: tabButton
            property string icon
            property bool active: false
            width: 50
            height: 50
            
            
            Rectangle {
                anchors.fill: parent
                radius: 25
                color: active ? Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : "#000000"
                
                
                Text {
                    anchors.centerIn: parent
                    text: tabButton.icon
                    font.family: faSolid.name
                    font.pixelSize: 18
                    color: active ? pywalColors.colors[4] : pywalColors.colors[7]
                }
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (tabButton.onClicked) {
                        tabButton.onClicked();
                    }
                }
                onEntered: {
                    if (!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if (!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    
    Component {
        id: subTabButtonComponent
        
        Item {
            id: subTabButton
            property string icon
            property string label
            property bool active: false
            width: 100
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : "#000000"
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: subTabButton.icon
                    font.family: faSolid.name
                    font.pixelSize: 18
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (subTabButton.onClicked) {
                        subTabButton.onClicked();
                    }
                }
                onEntered: {
                    if (!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if (!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    
    Component {
        id: quickShortcutComponent
        
        Item {
            id: quickShortcut
            property string icon
            property string title
            property string description
            width: parent.width / 2 - 7.5
            height: 150
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                
                
                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: quickShortcut.icon
                    font.family: faSolid.name
                    font.pixelSize: 24
                    color: pywalColors.colors[2]
                }
                
                
                Text {
                    anchors.top: iconText.bottom
                    anchors.topMargin: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: quickShortcut.title
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 18
                    color: pywalColors.colors[2]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
            
            
            RowLayout {
                anchors.top: titleText.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 15
                spacing: 10
                
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
    
    
    Component {
        id: optionItemComponent
        
        Item {
            id: optionItem
            property string text
            property bool active: false
            width: 100
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : "#000000"
                border.color: active ? pywalColors.colors[2] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 1
                
                
                Text {
                    anchors.centerIn: parent
                    text: optionItem.text
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (optionItem.onClicked) {
                        optionItem.onClicked();
                    }
                }
                onEntered: {
                    if (!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if (!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    
    Component {
        id: toggleControlComponent
        
        Item {
            id: toggleControl
            property string title
            property bool active: false
            signal toggled(bool active)
            width: parent.width
            height: 40
            
            
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                text: toggleControl.title
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            
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
    
    
    Component {
        id: fontSelectorComponent
        
        Item {
            id: fontSelector
            property string currentFont
            width: parent.width
            height: 40
            
            
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
    
    
    Component {
        id: themeItemComponent
        
        Item {
            id: themeItem
            property var theme
            property bool isActive: false
            width: parent.width
            height: 60
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: themeItem.isActive ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: themeItem.isActive ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf042"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: themeItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: themeItem.theme.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: themeItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (themeItem.onClicked) {
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
    
    
    Component {
        id: mouseCursorItemComponent
        
        Item {
            id: mouseCursorItem
            property var cursor
            property bool isActive: false
            width: parent.width
            height: 60
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: mouseCursorItem.isActive ? 
                       Qt.rgba(pywalColors.colors[3].r, pywalColors.colors[3].g, pywalColors.colors[3].b, 0.1) : 
                       "#000000"
                border.color: mouseCursorItem.isActive ? 
                              pywalColors.colors[3] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf245"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: mouseCursorItem.isActive ? pywalColors.colors[3] : pywalColors.colors[7]
                }
                
                
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: mouseCursorItem.cursor.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: mouseCursorItem.isActive ? pywalColors.colors[3] : pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: wallpaperItemComponent
        
        Item {
            id: wallpaperItem
            property var wallpaper
            property bool isActive: false
            width: parent.width
            height: 100
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: wallpaperItem.isActive ? 
                       Qt.rgba(pywalColors.colors[4].r, pywalColors.colors[4].g, pywalColors.colors[4].b, 0.1) : 
                       "#000000"
                border.color: wallpaperItem.isActive ? 
                              pywalColors.colors[4] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Image {
                    anchors.fill: parent
                    source: wallpaperItem.wallpaper.thumbnail
                    fillMode: Image.PreserveAspectCrop
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: iconItemComponent
        
        Item {
            id: iconItem
            property var icon
            property bool isActive: false
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: iconItem.isActive ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: iconItem.isActive ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf11b"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: iconItem.isActive ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: shortcutItemComponent
        
        Item {
            id: shortcutItem
            property var shortcut
            width: parent.width
            height: 50
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: shortcutItem.shortcut.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: displayItemComponent
        
        Item {
            id: displayItem
            property var display
            property bool isSelected: false
            width: parent.width
            height: 60
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: displayItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: displayItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf108"
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: displayItem.isSelected ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
                Text {
                    anchors.left: iconText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: displayItem.display.name
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: displayItem.isSelected ? pywalColors.colors[2] : pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (DisplayItem.onClicked) {
                        DisplayItem.onClicked();
                    }
                }
                onEntered: {
                    if (!DisplayItem.isSelected) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if (!DisplayItem.isSelected) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    
    Component {
        id: animationOptionComponent
        
        Item {
            id: animationOption
            property string label
            property bool isEnabled: true
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: animationOption.label
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: Qt.rgba(pywalColors.colors[colorIndex].r, pywalColors.colors[colorIndex].g, pywalColors.colors[colorIndex].b, 0.1)
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: resourceUsage.icon
                    font.family: faSolid.name
                    font.pixelSize: 20
                    color: pywalColors.colors[colorIndex]
                }
                
                
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
    
    
    Component {
        id: processItemComponent
        
        Item {
            id: processItem
            property var process
            width: parent.width
            height: 30
            
            
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: processItem.process.name
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: pywalColors.colors[7]
            }
            
            
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
    
    
    Component {
        id: systemInfoItemComponent
        
        Item {
            id: systemInfoItem
            property string label
            property string value
            width: parent.width
            height: 30
            
            
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                text: systemInfoItem.label + ":"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 16
                color: pywalColors.colors[7]
            }
            
            
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
    
    
    Component {
        id: themeStoreComponent
        
        Item {
            id: themeStore
            width: 600
            height: 400
            
            
            Rectangle {
                anchors.fill: parent
                radius: 30
                color: "#000000"
                
                
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
                    placeholderText: "البحث عن الثيمات..."
                    placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                    selectByMouse: true
                    focus: true
                    
                    onTextChanged: {
                        filterThemes(text);
                    }
                }
            }
            
            
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
                
                
                OpacityAnimation on opacity {
                    duration: 50
                    easing.type: Easing.OutQuart
                    from: 0
                    to: 1
                }
            }
            
            
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
                text: "تثبيت"
                visible: themeStore.selectedTheme !== null
                
                onClicked: {
                    installTheme(themeStore.selectedTheme);
                }
            }
        }
    }
    
    
    Component {
        id: themeStoreItemComponent
        
        Item {
            id: themeStoreItem
            property var theme
            width: parent.width
            height: 70
            
            
            Rectangle {
                anchors.fill: parent
                radius: 15
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50
                    height: 50
                    source: themeStoreItem.theme.thumbnail
                    fillMode: Image.PreserveAspectCrop
                }
                
                
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
                
                
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: "\uf005 " + themeStoreItem.theme.rating
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[5]
                }
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    
    
    
    function openSettings() {
        settingsContainer.visible = true;
        settingsContainer.opacity = 0;
        fadeInAnimation.target = settingsContainer;
        fadeInAnimation.restart();
    }
    
    
    function closeSettings() {
        fadeOutAnimation.target = settingsContainer;
        fadeOutAnimation.onCompleted = function() {
            settingsContainer.visible = false;
        };
        fadeOutAnimation.restart();
    }
    
    
    function loadResourceData() {
        try {
            
            const memProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            memProcess.start("free", ["-h"]);
            memProcess.waitForFinished(500);
            
            if (memProcess.exitCode() === 0) {
                const output = memProcess.readAllStandardOutput().trim();
                const lines = output.split('\n');
                const memLine = lines[1].split(/\s+/);
                const used = parseFloat(memLine[2].replace("Gi", ""));
                const total = parseFloat(memLine[1].replace("Gi", ""));
                
                
                memoryUsage.current = used;
                memoryUsage.total = total;
            }
            
            
            const cpuProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            cpuProcess.start("top", ["-bn1"]);
            cpuProcess.waitForFinished(500);
            
            if (cpuProcess.exitCode() === 0) {
                const output = cpuProcess.readAllStandardOutput().trim();
                const lines = output.split('\n');
                const cpuLine = lines[2];
                const match = cpuLine.match(/Cpu\(s\):\s*([\d.]+)/);
                
                if (match) {
                    const cpuUsage = parseFloat(match[1]);
                    cpuUsage.current = cpuUsage;
                }
            }
            
            
            const processProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            processProcess.start("ps", ["-eo", "comm,%cpu", "--sort=-%cpu"]);
            processProcess.waitForFinished(500);
            
            if (processProcess.exitCode() === 0) {
                const output = processProcess.readAllStandardOutput().trim();
                const lines = output.split('\n').slice(1, 6); 
                
                processList = [];
                for (const line of lines) {
                    const parts = line.trim().split(/\s+/);
                    if (parts.length >= 2) {
                        processList.push({
                            name: parts[0],
                            usage: parts[1]
                        });
                    }
                }
                
                
                processesList.model = processList;
            }
        } catch (e) {
            console.error("فشل تحميل بيانات الموارد:", e);
        }
    }
    
    
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
                    description: "ثيم مخصص لـ Desind",
                    thumbnail: `~/.themes/${theme}/thumbnail.png`
                }));
                
                
                themesList.model = themeList;
            }
        } catch (e) {
            console.error("فشل تحميل الثيمات:", e);
            
            themeList = [
                {name: "Desind Dark", description: "ثيم مظلم مع ألوان متناسقة", thumbnail: "qrc:/themes/desind_dark.png"},
                {name: "Desind Light", description: "ثيم فاتح مع ألوان ناعمة", thumbnail: "qrc:/themes/desind_light.png"},
                {name: "Solarized Dark", description: "ثيم مظلم كلاسيكي", thumbnail: "qrc:/themes/solarized_dark.png"}
            ];
            themesList.model = themeList;
        }
    }
    
    
    function applyTheme(themeName) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "gtk-theme", themeName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تطبيق الثيم بنجاح", "\uf00c");
            } else {
                showToast("فشل تطبيق الثيم", "\uf071");
            }
        } catch (e) {
            console.error("فشل تطبيق الثيم:", e);
            showToast("فشل تطبيق الثيم", "\uf071");
        }
    }
    
    
    function openThemeStore() {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https:
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
                
                themeStore.themes = [
                    {name: "Desind Dark", description: "ثيم مظلم مع ألوان متناسقة", rating: 4.8, thumbnail: "qrc:/themes/desind_dark.png"},
                    {name: "Desind Light", description: "ثيم فاتح مع ألوان ناعمة", rating: 4.5, thumbnail: "qrc:/themes/desind_light.png"},
                    {name: "Solarized Dark", description: "ثيم مظلم كلاسيكي", rating: 4.7, thumbnail: "qrc:/themes/solarized_dark.png"},
                    {name: "Nord", description: "ثيم مظلم مع ألوان باردة", rating: 4.6, thumbnail: "qrc:/themes/nord.png"},
                    {name: "Dracula", description: "ثيم مظلم مع ألوان زاهية", rating: 4.9, thumbnail: "qrc:/themes/dracula.png"}
                ];
            }
            
            
            themeStore.visible = true;
            themeStore.opacity = 0;
            fadeInAnimation.target = themeStore;
            fadeInAnimation.restart();
        } catch (e) {
            console.error("فشل فتح متجر الثيمات:", e);
            showToast("فشل فتح متجر الثيمات", "\uf071");
        }
    }
    
    
    function previewTheme(theme) {
        themeStore.selectedTheme = theme;
        
    }
    
    
    function installTheme(theme) {
        try {
            
            const downloadProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            downloadProcess.start("wget", [theme.download_url, "-P", "/tmp"]);
            downloadProcess.waitForFinished(5000); 
            
            if (downloadProcess.exitCode() === 0) {
                
                const installProcess = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                installProcess.start("tar", ["-xvf", `/tmp/${theme.name}.tar.gz`, "-C", "~/.themes"]);
                installProcess.waitForFinished(5000);
                
                if (installProcess.exitCode() === 0) {
                    
                    loadThemes();
                    showToast("تم تثبيت الثيم بنجاح", "\uf00c");
                    
                    
                    fadeOutAnimation.target = themeStore;
                    fadeOutAnimation.onCompleted = function() {
                        themeStore.visible = false;
                    };
                    fadeOutAnimation.restart();
                } else {
                    showToast("فشل تثبيت الثيم", "\uf071");
                }
            } else {
                showToast("فشل تنزيل الثيم", "\uf071");
            }
        } catch (e) {
            console.error("فشل تثبيت الثيم:", e);
            showToast("فشل تثبيت الثيم", "\uf071");
        }
    }
    
    
    function loadWallpapers() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("ls", ["~/.wallpapers"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                const output = process.readAllStandardOutput().trim();
                const wallpapers = output.split('\n');
                
                wallpaperList = wallpapers.map(wallpaper => ({
                    name: wallpaper,
                    path: `~/.wallpapers/${wallpaper}`,
                    thumbnail: `~/.wallpapers/${wallpaper}/thumbnail.jpg`
                }));
                
                
                wallpapersGrid.model = wallpaperList;
            }
        } catch (e) {
            console.error("فشل تحميل الخلفيات:", e);
            
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
    
    
    function applyWallpaper(wallpaperPath) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.background", "picture-uri", `file:
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير الخلفية بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير الخلفية", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير الخلفية:", e);
            showToast("فشل تغيير الخلفية", "\uf071");
        }
    }
    
    
    function openWallpaperStore() {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https:
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
                
                wallpaperStore.wallpapers = [
                    {name: "Nature", description: "مناظر طبيعية خلابة", rating: 4.8, thumbnail: "qrc:/wallpapers/nature_thumbnail.jpg"},
                    {name: "Abstract", description: "تصاميم مجردة فنية", rating: 4.5, thumbnail: "qrc:/wallpapers/abstract_thumbnail.jpg"},
                    {name: "Dark", description: "خلفيات مظلمة أنيقة", rating: 4.7, thumbnail: "qrc:/wallpapers/dark_thumbnail.jpg"},
                    {name: "Light", description: "خلفيات فاتحة ناعمة", rating: 4.6, thumbnail: "qrc:/wallpapers/light_thumbnail.jpg"},
                    {name: "Patterns", description: "أنماط هندسية", rating: 4.9, thumbnail: "qrc:/wallpapers/patterns_thumbnail.jpg"}
                ];
            }
            
            
            wallpaperStore.visible = true;
            wallpaperStore.opacity = 0;
            fadeInAnimation.target = wallpaperStore;
            fadeInAnimation.restart();
        } catch (e) {
            console.error("فشل فتح متجر الخلفيات:", e);
            showToast("فشل فتح متجر الخلفيات", "\uf071");
        }
    }
    
    
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
                    type: "apps", 
                    thumbnail: `~/.icons/${icon}/thumbnail.png`
                }));
                
                
                systemIconsList.model = iconList.filter(i => i.type === "system");
                appIconsList.model = iconList.filter(i => i.type === "apps");
            }
        } catch (e) {
            console.error("فشل تحميل الأيقونات:", e);
            
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
    
    
    function applySystemIcons(iconName) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "icon-theme", iconName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير أيقونات النظام بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير أيقونات النظام", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير أيقونات النظام:", e);
            showToast("فشل تغيير أيقونات النظام", "\uf071");
        }
    }
    
    
    function applyAppIcons(iconName) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "icon-theme", iconName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير أيقونات التطبيقات بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير أيقونات التطبيقات", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير أيقونات التطبيقات:", e);
            showToast("فشل تغيير أيقونات التطبيقات", "\uf071");
        }
    }
    
    
    function openIconsStore() {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https:
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
                
                iconsStore.icons = [
                    {name: "Desind Icons", description: "أيقونات مخصصة لـ Desind", rating: 4.8, thumbnail: "qrc:/icons/desind_system.png"},
                    {name: "Papirus", description: "أيقونات بسيطة وأنيقة", rating: 4.5, thumbnail: "qrc:/icons/papirus.png"},
                    {name: "Tela", description: "أيقونات حديثة", rating: 4.7, thumbnail: "qrc:/icons/tela.png"},
                    {name: "Breeze", description: "أيقونات من نظام KDE", rating: 4.6, thumbnail: "qrc:/icons/breeze.png"},
                    {name: "Fluent", description: "أيقونات متوافقة مع تصميم Microsoft", rating: 4.9, thumbnail: "qrc:/icons/fluent.png"}
                ];
            }
            
            
            iconsStore.visible = true;
            iconsStore.opacity = 0;
            fadeInAnimation.target = iconsStore;
            fadeInAnimation.restart();
        } catch (e) {
            console.error("فشل فتح متجر الأيقونات:", e);
            showToast("فشل فتح متجر الأيقونات", "\uf071");
        }
    }
    
    
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
                    description: "مؤشر ماوس مخصص",
                    thumbnail: `~/.icons/${cursor}/cursor.png`
                }));
                
                
                mouseCursorList.model = mouseCursorList;
            }
        } catch (e) {
            console.error("فشل تحميل مؤشرات الماوس:", e);
            
            mouseCursorList = [
                {name: "Desind Cursor", description: "مؤشر ماوس مخصص لـ Desind", thumbnail: "qrc:/cursors/desind.png"},
                {name: "Breeze", description: "مؤشر ماوس من نظام KDE", thumbnail: "qrc:/cursors/breeze.png"},
                {name: "DMZ-White", description: "مؤشر ماوس أبيض", thumbnail: "qrc:/cursors/dmz-white.png"},
                {name: "DMZ-Black", description: "مؤشر ماوس أسود", thumbnail: "qrc:/cursors/dmz-black.png"}
            ];
            mouseCursorList.model = mouseCursorList;
        }
    }
    
    
    function applyMouseCursor(cursorName) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "cursor-theme", cursorName]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير مؤشر الماوس بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير مؤشر الماوس", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير مؤشر الماوس:", e);
            showToast("فشل تغيير مؤشر الماوس", "\uf071");
        }
    }
    
    
    function openMouseCursorStore() {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https:
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
                
                mouseCursorStore.cursors = [
                    {name: "Desind Cursor", description: "مؤشر ماوس مخصص لـ Desind", rating: 4.8, thumbnail: "qrc:/cursors/desind.png"},
                    {name: "Breeze", description: "مؤشر ماوس من نظام KDE", rating: 4.5, thumbnail: "qrc:/cursors/breeze.png"},
                    {name: "DMZ-White", description: "مؤشر ماوس أبيض", rating: 4.7, thumbnail: "qrc:/cursors/dmz-white.png"},
                    {name: "DMZ-Black", description: "مؤشر ماوس أسود", rating: 4.6, thumbnail: "qrc:/cursors/dmz-black.png"},
                    {name: "Fluent", description: "مؤشر ماوس متوافق مع تصميم Microsoft", rating: 4.9, thumbnail: "qrc:/cursors/fluent.png"}
                ];
            }
            
            
            mouseCursorStore.visible = true;
            mouseCursorStore.opacity = 0;
            fadeInAnimation.target = mouseCursorStore;
            fadeInAnimation.restart();
        } catch (e) {
            console.error("فشل فتح متجر مؤشرات الماوس:", e);
            showToast("فشل فتح متجر مؤشرات الماوس", "\uf071");
        }
    }
    
    
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
                    description: "خط متوفر في النظام"
                }));
            }
        } catch (e) {
            console.error("فشل تحميل الخطوط:", e);
            
            fontList = [
                {name: "IBM Plex Sans Thin", description: "خط خفيف وعصري"},
                {name: "IBM Plex Sans", description: "خط قياسي وواضح"},
                {name: "Fira Code", description: "خط مخصص للبرمجة"},
                {name: "Noto Sans", description: "خط شامل للغات المتعددة"},
                {name: "Roboto", description: "خط حديث من Google"}
            ];
        }
    }
    
    
    function setSystemFont(font) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير خط النظام بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير خط النظام", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير خط النظام:", e);
            showToast("فشل تغيير خط النظام", "\uf071");
        }
    }
    
    
    function setAppFont(font) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "document-font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير خط التطبيقات بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير خط التطبيقات", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير خط التطبيقات:", e);
            showToast("فشل تغيير خط التطبيقات", "\uf071");
        }
    }
    
    
    function setCodeFont(font) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "monospace-font-name", `"${font} 10"`]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast("تم تغيير خط الواجهة البرمجية بنجاح", "\uf00c");
            } else {
                showToast("فشل تغيير خط الواجهة البرمجية", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير خط الواجهة البرمجية:", e);
            showToast("فشل تغيير خط الواجهة البرمجية", "\uf071");
        }
    }
    
    
    function openFontStore() {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("curl", ["https:
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
                
                fontStore.fonts = [
                    {name: "IBM Plex Sans", description: "خط حديث وواضح", rating: 4.8, thumbnail: "qrc:/fonts/ibm_plex.png"},
                    {name: "Fira Code", description: "خط مخصص للبرمجة", rating: 4.5, thumbnail: "qrc:/fonts/fira_code.png"},
                    {name: "Noto Sans", description: "خط شامل للغات المتعددة", rating: 4.7, thumbnail: "qrc:/fonts/noto_sans.png"},
                    {name: "Roboto", description: "خط حديث من Google", rating: 4.6, thumbnail: "qrc:/fonts/roboto.png"},
                    {name: "Open Sans", description: "خط قابل للقراءة", rating: 4.9, thumbnail: "qrc:/fonts/open_sans.png"}
                ];
            }
            
            
            fontStore.visible = true;
            fontStore.opacity = 0;
            fadeInAnimation.target = fontStore;
            fadeInAnimation.restart();
        } catch (e) {
            console.error("فشل فتح متجر الخطوط:", e);
            showToast("فشل فتح متجر الخطوط", "\uf071");
        }
    }
    
    
    function setAnimationSpeed(speed) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.interface", "enable-animations", speed > 50 ? "true" : "false"]);
            process.waitForFinished(500);
            
            
            animationDuration = speed;
            
            if (process.exitCode() === 0) {
                showToast(`تم تغيير سرعة الأنميشنات إلى ${speed} مللي ثانية`, "\uf00c");
            } else {
                showToast("فشل تغيير سرعة الأنميشنات", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير سرعة الأنميشنات:", e);
            showToast("فشل تغيير سرعة الأنميشنات", "\uf071");
        }
    }
    
    
    function toggleAnimation(animationName, active) {
        try {
            
            showToast(active ? `تم تفعيل ${animationName}` : `تم إلغاء تفعيل ${animationName}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير إعدادات الأنميشن:", e);
            showToast("فشل تغيير إعدادات الأنميشن", "\uf071");
        }
    }
    
    
    function setWindowCorners(index) {
        try {
            
            const corners = ["square", "slightlyRounded", "fullyRounded"];
            showToast(`تم تغيير شكل الحواف إلى ${corners[index]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير شكل الحواف:", e);
            showToast("فشل تغيير شكل الحواف", "\uf071");
        }
    }
    
    
    function setWindowRadius(index) {
        try {
            
            const sizes = ["small", "medium", "large"];
            showToast(`تم تغيير حجم الحواف إلى ${sizes[index]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير حجم الحواف:", e);
            showToast("فشل تغيير حجم الحواف", "\uf071");
        }
    }
    
    
    function setMouseSpeed(speed) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("xset", ["m", speed * 10, "5"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`تم تغيير سرعة الماوس إلى ${speed}`, "\uf00c");
            } else {
                showToast("فشل تغيير سرعة الماوس", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير سرعة الماوس:", e);
            showToast("فشل تغيير سرعة الماوس", "\uf071");
        }
    }
    
    
    function setMouseScrollDirection(inverted) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.peripherals.touchpad", "natural-scroll", inverted ? "true" : "false"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(inverted ? "تم تفعيل عكس اتجاه التمرير" : "تم إلغاء عكس اتجاه التمرير", "\uf00c");
            } else {
                showToast("فشل تغيير اتجاه التمرير", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير اتجاه التمرير:", e);
            showToast("فشل تغيير اتجاه التمرير", "\uf071");
        }
    }
    
    
    function setWallpaperMode(modeIndex) {
        try {
            const modes = ["zoom", "scaled", "stretched", "wallpaper"];
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("gsettings", ["set", "org.gnome.desktop.background", "picture-options", modes[modeIndex]]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`تم تغيير وضع العرض إلى ${modes[modeIndex]}`, "\uf00c");
            } else {
                showToast("فشل تغيير وضع العرض", "\uf071");
            }
        } catch (e) {
            console.error("فشل تغيير وضع العرض:", e);
            showToast("فشل تغيير وضع العرض", "\uf071");
        }
    }
    
    
    function setAnimatedWallpaper(active) {
        try {
            
            showToast(active ? "تم تفعيل الخلفيات المتحركة" : "تم إلغاء تفعيل الخلفيات المتحركة", "\uf00c");
        } catch (e) {
            console.error("فشل تغيير إعدادات الخلفيات المتحركة:", e);
            showToast("فشل تغيير إعدادات الخلفيات المتحركة", "\uf071");
        }
    }
    
    
    function setLockscreenClockSize(sizeIndex) {
        try {
            const sizes = ["small", "medium", "large"];
            
            showToast(`تم تغيير حجم الساعة إلى ${sizes[sizeIndex]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير حجم ساعة شاشة القفل:", e);
            showToast("فشل تغيير حجم ساعة شاشة القفل", "\uf071");
        }
    }
    
    
    function setLockscreenClockPosition(positionIndex) {
        try {
            const positions = ["top", "center", "bottom"];
            
            showToast(`تم تغيير مكان الساعة إلى ${positions[positionIndex]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير مكان ساعة شاشة القفل:", e);
            showToast("فشل تغيير مكان ساعة شاشة القفل", "\uf071");
        }
    }
    
    
    function setLockscreenClockFont(fontIndex) {
        try {
            const fonts = ["Thin", "Light", "Regular", "Bold"];
            
            showToast(`تم تغيير خط الساعة إلى ${fonts[fontIndex]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير خط ساعة شاشة القفل:", e);
            showToast("فشل تغيير خط ساعة شاشة القفل", "\uf071");
        }
    }
    
    
    function setLockscreenWallpaper(wallpaperIndex) {
        try {
            const wallpapers = ["current", "dark", "custom"];
            
            showToast(`تم تغيير خلفية شاشة القفل إلى ${wallpapers[wallpaperIndex]}`, "\uf00c");
        } catch (e) {
            console.error("فشل تغيير خلفية شاشة القفل:", e);
            showToast("فشل تغيير خلفية شاشة القفل", "\uf071");
        }
    }
    
    
    function setPrimaryDisplay(displayName) {
        try {
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hyprctl", ["keyword", "monitor", displayName + ", preferred, auto, 1"]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                showToast(`تم تعيين ${displayName} كشاشة رئيسية`, "\uf00c");
            } else {
                showToast("فشل تعيين الشاشة الرئيسية", "\uf071");
            }
        } catch (e) {
            console.error("فشل تعيين الشاشة الرئيسية:", e);
            showToast("فشل تعيين الشاشة الرئيسية", "\uf071");
        }
    }
    
    
    function showToast(message, icon) {
        
        console.log(`Toast: ${message}`);
    }

    
    function openSettingsApp(section) {
        
        if (isSettingsAppOpen) {
            navigateSettingsApp(section)
            return
        }
        
        
        settingsAppOpenEffect.start()
        
        
        isSettingsAppOpen = true
        settingsAppSection = section
        
        
        settingsAppAnimation.start()
    }

    
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

    
    function navigateSettingsApp(section) {
        settingsAppSection = section
        
        
        settingsSectionTransition.start()
    }

    
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

    
    
    
    
    OpacityAnimation {
        id: fadeInAnimation
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
    OpacityAnimation {
        id: fadeOutAnimation
        from: 1
        to: 0
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
    
    
    Component.onCompleted: {
        
        loadThemes();
        loadWallpapers();
        loadIcons();
        loadMouseCursors();
        loadFonts();
        
        
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("hostname");
            process.waitForFinished(500);
            if (process.exitCode() === 0) {
                systemInfo.deviceName = process.readAllStandardOutput().trim();
            }
        } catch (e) {
            console.error("فشل جلب اسم الجهاز:", e);
        }
    }
}
EOL

echo "----------------------------"
echo "(3/5) انشاء مدير الملفات..."
cat <<EOL > ~/.config/Drile/Drile.qml



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
    id: drile
    width: 1000
    height: 650
    
    
    property string currentPath: "/home/" + Qt.application.arguments[2]
    property string selectedPath: ""
    property int viewMode: 0 
    property int animationduration: 50
    property int debounceTime: 50
    property bool showHiddenFiles: false
    property var clipboard: null
    property string clipboardAction: "" 
    
    
    property var files: []
    property var selectedFiles: []
    property var bookmarks: [
        {name: "المنزل", path: "/home/" + Qt.application.arguments[2]},
        {name: "الصور", path: "/home/" + Qt.application.arguments[2] + "/Pictures"},
        {name: "الوثائق", path: "/home/" + Qt.application.arguments[2] + "/Documents"},
        {name: "التنزيلات", path: "/home/" + Qt.application.arguments[2] + "/Downloads"},
        {name: "الفيديو", path: "/home/" + Qt.application.arguments[2] + "/Videos"}
    ]
    
    
    property bool isSearching: false
    property string searchQuery: ""
    property var tabs: [{id: "tab1", title: "المنزل", path: "/home/" + Qt.application.arguments[2]}]
    property int activeTabIndex: 0
    property bool contextMenuVisible: false
    property point contextMenuPos: ({x: 0, y: 0})
    
    
    Rectangle {
        id: container
        anchors.fill: parent
        color: "#000000"
        opacity: 0
        visible: false
        
        
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
        
        
        Item {
            id: islandContainer
            width: parent.width * 0.9
            height: 50
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            
            
            Rectangle {
                id: islandBackground
                anchors.fill: parent
                radius: 25
                color: Qt.rgba(0, 0, 0, 0.85)
                border.width: 0
                
                
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
            
            
            RowLayout {
                id: tabBar
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5
                
                
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
        
        
        Item {
            id: content
            anchors.top: islandContainer.bottom
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            
            
            RowLayout {
                id: navigationBar
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                height: 40
                spacing: 10
                
                
                Button {
                    width: 40
                    height: 40
                    radius: 20
                    color: Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1)
                    border.color: pywalColors.colors[2]
                    border.width: 1
                    text: "\uf060" 
                    
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
                    text: "\uf061" 
                    
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
                    text: "\uf0e2" 
                    
                    onClicked: {
                        loadDirectory(currentPath);
                    }
                }
                
                
                Rectangle {
                    id: pathBar
                    Layout.fillWidth: true
                    height: 40
                    radius: 20
                    color: Qt.rgba(0, 0, 0, 0.85)
                    
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 5
                        
                        
                        Repeater {
                            model: currentPath.split("/").filter(p => p !== "").length + 1
                            delegate: PathSegment {
                                text: index === 0 ? "المنزل" : currentPath.split("/")[index]
                                isLast: index === currentPath.split("/").filter(p => p !== "").length
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
                        placeholderText: "البحث في هذا المجلد..."
                        placeholderColor: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
                        selectByMouse: true
                        focus: false
                        maximumLength: 100
                        
                        onTextChanged: {
                            if (searchTimer) {
                                clearTimeout(searchTimer);
                            }
                            
                            if (text.length > 0) {
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
            
            
            Item {
                id: fileManagerContent
                anchors.top: navigationBar.bottom
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                
                
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
                        spacing: 10
                        
                        
                        Text {
                            text: "المفضلات"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        
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
                        
                        
                        Text {
                            text: "المواقع"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        
                        ListView {
                            id: locationsList
                            Layout.fillWidth: true
                            height: 200
                            model: [
                                {name: "الكمبيوتر", icon: "\uf109"},
                                {name: "الشبكة", icon: "\uf1eb"},
                                {name: "المحركات", icon: "\uf0a0"}
                            ]
                            clip: true
                            interactive: false
                            
                            delegate: LocationItem {
                                width: parent.width
                                height: 40
                                location: modelData
                                onClicked: {
                                    if (location.name === "الكمبيوتر") {
                                        currentPath = "/";
                                        loadDirectory(currentPath);
                                    }
                                }
                            }
                        }
                        
                        
                        Text {
                            text: "الأجهزة"
                            font.family: "IBM Plex Sans Thin"
                            font.pixelSize: 18
                            color: pywalColors.colors[7]
                        }
                        
                        
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
                
                
                Item {
                    id: filesArea
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: sidebar.right
                    anchors.right: parent.right
                    anchors.margins: 10
                    
                    
                    RowLayout {
                        id: toolbar
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        height: 40
                        spacing: 10
                        
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode === 0 ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode === 0 ? 1 : 0
                            text: "\uf00b" 
                            
                            onClicked: {
                                viewMode = 0;
                            }
                        }
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode === 1 ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode === 1 ? 1 : 0
                            text: "\uf009" 
                            
                            onClicked: {
                                viewMode = 1;
                            }
                        }
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: viewMode === 2 ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : Qt.rgba(0, 0, 0, 0.85)
                            border.color: pywalColors.colors[2]
                            border.width: viewMode === 2 ? 1 : 0
                            text: "\uf0ae" 
                            
                            onClicked: {
                                viewMode = 2;
                            }
                        }
                        
                        
                        Button {
                            width: 40
                            height: 40
                            radius: 20
                            color: showHiddenFiles ? Qt.rgba(pywalColors.colors[5].r, pywalColors.colors[5].g, pywalColors.colors[5].b, 0.1) : Qt.rgba(0, 0, 0, 0.85)
                            border.color: showHiddenFiles ? pywalColors.colors[5] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                            border.width: showHiddenFiles ? 1 : 0
                            text: "\uf06e" 
                            
                            onClicked: {
                                showHiddenFiles = !showHiddenFiles;
                                loadDirectory(currentPath);
                            }
                        }
                    }
                    
                    
                    Item {
                        id: viewContainer
                        anchors.top: toolbar.bottom
                        anchors.topMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        
                        
                        Item {
                            id: listView
                            anchors.fill: parent
                            visible: viewMode === 0
                            
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
                                
                                
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                            }
                        }
                        
                        
                        Item {
                            id: gridView
                            anchors.fill: parent
                            visible: viewMode === 1
                            
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
                                
                                
                                OpacityAnimation on opacity {
                                    duration: 50
                                    easing.type: Easing.OutQuart
                                    from: 0
                                    to: 1
                                }
                            }
                        }
                        
                        
                        Item {
                            id: detailsView
                            anchors.fill: parent
                            visible: viewMode === 2
                            
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
    
    
    
    
    
    
    Component {
        id: tabButtonComponent
        
        Item {
            id: tabButton
            property string text
            property bool active: false
            width: 120
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 20
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : "#000000"
                border.color: active ? pywalColors.colors[2] : Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 1
                
                
                Text {
                    anchors.centerIn: parent
                    text: tabButton.text
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 16
                    color: active ? pywalColors.colors[2] : pywalColors.colors[7]
                }
            }
            
            
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                width: 20
                height: 20
                radius: 10
                color: active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.3) : Qt.rgba(0, 0, 0, 0.5)
                visible: drile.tabs.length > 1
                
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
                        if (tabButton.onCloseRequested) {
                            tabButton.onCloseRequested();
                        }
                    }
                    onEntered: {
                        parent.color = active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.5) : Qt.rgba(0, 0, 0, 0.7);
                    }
                    onExited: {
                        parent.color = active ? Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.3) : Qt.rgba(0, 0, 0, 0.5);
                    }
                }
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if (tabButton.onClicked) {
                        tabButton.onClicked();
                    }
                }
                onEntered: {
                    if (!active) {
                        parent.scale = 1.05;
                    }
                }
                onExited: {
                    if (!active) {
                        parent.scale = 1.0;
                    }
                }
            }
        }
    }
    
    
    Component {
        id: pathSegmentComponent
        
        Item {
            id: pathSegment
            property string text
            property bool isLast: false
            width: 80
            height: 30
            
            
            Text {
                anchors.centerIn: parent
                text: pathSegment.text
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: pywalColors.colors[7]
                elide: Text.ElideRight
                width: parent.width * 0.8
            }
            
            
            Text {
                anchors.left: parent.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                text: isLast ? "" : "/"
                font.family: "IBM Plex Sans Thin"
                font.pixelSize: 14
                color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.5)
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: bookmarkItemComponent
        
        Item {
            id: bookmarkItem
            property var bookmark
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: bookmarkItem.bookmark.name === "المنزل" ? "\uf015" : 
                          (bookmarkItem.bookmark.name === "الصور" ? "\uf03e" : 
                          (bookmarkItem.bookmark.name === "الوثائق" ? "\uf15c" : 
                          (bookmarkItem.bookmark.name === "التنزيلات" ? "\uf019" : 
                          (bookmarkItem.bookmark.name === "الفيديو" ? "\uf03d" : "\uf15b"))))
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: locationItemComponent
        
        Item {
            id: locationItem
            property var location
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: locationItem.location.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: deviceItemComponent
        
        Item {
            id: deviceItem
            property var device
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: "#000000"
                border.color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: deviceItem.device.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: fileItemComponent
        
        Item {
            id: fileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: fileItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: fileItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "\uf07b" : 
                          (fileItem.file.extension === "pdf" ? "\uf1c1" :
                          (fileItem.file.extension === "txt" ? "\uf15c" :
                          (fileItem.file.extension === "jpg" || fileItem.file.extension === "png" ? "\uf03e" :
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
                
                
                Text {
                    anchors.left: nameText.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "مجلد" : fileItem.file.extension.toUpperCase()
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
                
                
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: fileItem.file.isDirectory ? "" : formatFileSize(fileItem.file.size)
                    font.family: "IBM Plex Sans Thin"
                    font.pixelSize: 14
                    color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: gridFileItemComponent
        
        Item {
            id: gridFileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: parent.height
            
            
            Rectangle {
                anchors.fill: parent
                radius: 10
                color: gridFileItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: gridFileItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 5
                    
                    
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: gridFileItem.file.isDirectory ? "\uf07b" : 
                              (gridFileItem.file.extension === "pdf" ? "\uf1c1" :
                              (gridFileItem.file.extension === "txt" ? "\uf15c" :
                              (gridFileItem.file.extension === "jpg" || gridFileItem.file.extension === "png" ? "\uf03e" :
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: detailFileItemComponent
        
        Item {
            id: detailFileItem
            property var file
            property bool isSelected: false
            width: parent.width
            height: 30
            
            
            Rectangle {
                anchors.fill: parent
                radius: 5
                color: detailFileItem.isSelected ? 
                       Qt.rgba(pywalColors.colors[2].r, pywalColors.colors[2].g, pywalColors.colors[2].b, 0.1) : 
                       "#000000"
                border.color: detailFileItem.isSelected ? 
                              pywalColors.colors[2] : 
                              Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.2)
                border.width: 0
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 5
                    spacing: 10
                    
                    
                    Text {
                        Layout.alignment: Qt.AlignVCenter
                        text: detailFileItem.file.isDirectory ? "\uf07b" : 
                              (detailFileItem.file.extension === "pdf" ? "\uf1c1" :
                              (detailFileItem.file.extension === "txt" ? "\uf15c" :
                              (detailFileItem.file.extension === "jpg" || detailFileItem.file.extension === "png" ? "\uf03e" :
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
                    
                    
                    Text {
                        Layout.fillWidth: true
                        text: detailFileItem.file.name
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: pywalColors.colors[7]
                        elide: Text.ElideRight
                    }
                    
                    
                    Text {
                        width: 100
                        text: detailFileItem.file.isDirectory ? "مجلد" : detailFileItem.file.extension.toUpperCase()
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    
                    Text {
                        width: 100
                        text: detailFileItem.file.isDirectory ? "" : formatFileSize(detailFileItem.file.size)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                    
                    
                    Text {
                        width: 150
                        text: formatDate(detailFileItem.file.modified)
                        font.family: "IBM Plex Sans Thin"
                        font.pixelSize: 14
                        color: Qt.rgba(pywalColors.colors[7].r, pywalColors.colors[7].g, pywalColors.colors[7].b, 0.7)
                    }
                }
            }
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    Component {
        id: contextMenuItemComponent
        
        Item {
            id: contextMenuItem
            property var item
            width: parent.width
            height: 40
            
            
            Rectangle {
                anchors.fill: parent
                radius: 5
                color: "#000000"
                border.width: 0
                
                
                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: contextMenuItem.item.icon
                    font.family: faSolid.name
                    font.pixelSize: 16
                    color: pywalColors.colors[7]
                }
                
                
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
            
            
            ScaleAnimation on scale {
                duration: 50
                easing.type: Easing.OutQuart
                from: 1.0
                to: 1.05
                running: false
            }
            
            
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
    
    
    
    
    
    
    function openDrile() {
        container.visible = true;
        container.opacity = 0;
        fadeInAnimation.target = container;
        fadeInAnimation.restart();
        
        
        loadDirectory(currentPath);
    }
    
    
    function closeDrile() {
        fadeOutAnimation.target = container;
        fadeOutAnimation.onCompleted = function() {
            container.visible = false;
        };
        fadeOutAnimation.restart();
    }
    
    
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
                    
                    
                    if (!showHiddenFiles && name.startsWith(".")) continue;
                    
                    drile.files.push({
                        name: name,
                        path: path + "/" + name,
                        isDirectory: isDirectory,
                        size: size,
                        modified: modified,
                        extension: isDirectory ? "" : name.split(".").pop().toLowerCase()
                    });
                }
                
                
                updateUI();
            }
        } catch (e) {
            console.error("فشل تحميل الدليل:", e);
            showToast("فشل تحميل الدليل", "\uf071");
        }
    }
    
    
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
                    if (!path || path === currentPath) continue;
                    
                    const name = path.substring(path.lastIndexOf("/") + 1);
                    const isDirectory = path.endsWith("/");
                    
                    drile.files.push({
                        name: name,
                        path: path,
                        isDirectory: isDirectory,
                        size: 0, 
                        modified: "",
                        extension: isDirectory ? "" : name.split(".").pop().toLowerCase()
                    });
                }
                
                
                updateUI();
            }
        } catch (e) {
            console.error("فشل البحث:", e);
            showToast("فشل البحث", "\uf071");
        }
    }
    
    
    function updateUI() {
        
        if (viewMode === 0) {
            listFilesView.model = filteredFiles;
        } else if (viewMode === 1) {
            gridFilesView.model = filteredFiles;
        } else if (viewMode === 2) {
            detailsFilesView.model = filteredFiles;
        }
    }
    
    
    function openFile(path) {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("xdg-open", [path]);
            process.waitForFinished(500);
            
            if (process.exitCode() !== 0) {
                showToast("فشل فتح الملف", "\uf071");
            }
        } catch (e) {
            console.error("فشل فتح الملف:", e);
            showToast("فشل فتح الملف", "\uf071");
        }
    }
    
    
    function goBack() {
        const parts = currentPath.split("/");
        if (parts.length > 2) {
            parts.pop();
            currentPath = parts.join("/");
            loadDirectory(currentPath);
        }
    }
    
    
    function goForward() {
        
        showToast("لا يوجد دليل سابق ليعاد التقدم إليه", "\uf071");
    }
    
    
    function addNewTab() {
        const newTab = {
            id: "tab" + (drile.tabs.length + 1),
            title: "جديد",
            path: "/home/" + Qt.application.arguments[2]
        };
        
        drile.tabs = [...drile.tabs, newTab];
        drile.activeTabIndex = drile.tabs.length - 1;
        drile.currentPath = newTab.path;
        loadDirectory(drile.currentPath);
    }
    
    
    function closeTab(index) {
        if (drile.tabs.length === 1) return;
        
        const newTabs = [...drile.tabs];
        newTabs.splice(index, 1);
        
        drile.tabs = newTabs;
        
        if (index <= drile.activeTabIndex) {
            drile.activeTabIndex = Math.min(drile.activeTabIndex, drile.tabs.length - 1);
            drile.currentPath = drile.tabs[drile.activeTabIndex].path;
            loadDirectory(drile.currentPath);
        }
    }
    
    
    function handleFileClick(file, mouse) {
        if (mouse.button === Qt.RightButton) {
            showContextMenu(mouse.x, mouse.y);
            return;
        }
        
        if (mouse.modifiers & Qt.ControlModifier || mouse.modifiers & Qt.ShiftModifier) {
            
            if (selectedFiles.some(f => f.path === file.path)) {
                selectedFiles = selectedFiles.filter(f => f.path !== file.path);
            } else {
                selectedFiles = [...selectedFiles, file];
            }
        } else {
            
            if (selectedFiles.length === 1 && selectedFiles[0].path === file.path) {
                
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
    
    
    function showContextMenu(x, y) {
        contextMenuPos = ({x: x, y: y});
        contextMenuVisible = true;
        
        
        updateContextMenuItems();
    }
    
    
    function updateContextMenuItems() {
        if (selectedFiles.length === 0) {
            contextMenuItems = [
                {icon: "\uf067", text: "لصق", action: "paste"},
                {icon: "\uf07b", text: "مجلد جديد", action: "new_folder"},
                {icon: "\uf0c2", text: "التنقيب في الملفات", action: "search"}
            ];
        } else if (selectedFiles.length === 1) {
            const file = selectedFiles[0];
            contextMenuItems = [
                {icon: "\uf0c5", text: "Open", action: "open"},
                {icon: "\uf07c", text: "Open مع...", action: "open_with"},
                {icon: "\uf0c5", text: "Open in new window", action: "open_in_new_window"},
                {icon: "\uf0c8", text: "Cut", action: "cut"},
                {icon: "\uf0ea", text: "Copy", action: "copy"},
                {icon: "\uf24d", text: "Rename", action: "rename"},
                {icon: "\uf0c4", text: "Properties", action: "properties"},
                {icon: "\uf1f8", text: "Send to", action: "send_to"},
                {icon: "\uf1f6", text: "Create shortcut", action: "create_shortcut"},
                {icon: "\uf1f8", text: "Move to trash", action: "move_to_trash"}
            ];
        } else {
            contextMenuItems = [
                {icon: "\uf0c8", text: "Cut", action: "cut"},
                {icon: "\uf0ea", text: "Copy", action: "copy"},
                {icon: "\uf1f8", text: "Move to trash", action: "move_to_trash"}
            ];
        }
    }
    
    
    function executeContextMenuItem(item) {
        switch (item.action) {
            case "open":
                if (selectedFiles.length === 1) {
                    if (selectedFiles[0].isDirectory) {
                        currentPath = selectedFiles[0].path;
                        loadDirectory(currentPath);
                    } else {
                        openFile(selectedFiles[0].path);
                    }
                }
                break;
                
            case "open_with":
                
                showToast("ميزة 'Open مع...' قيد التطوير", "\uf071");
                break;
                
            case "open_in_new_window":
                
                showToast("ميزة 'Open in new window' قيد التطوير", "\uf071");
                break;
                
            case "cut":
                clipboard = [...selectedFiles];
                clipboardAction = "cut";
                showToast(`تم قص ${selectedFiles.length} عنصر(عناصر)`, "\uf0c8");
                break;
                
            case "copy":
                clipboard = [...selectedFiles];
                clipboardAction = "copy";
                showToast(`تم نسخ ${selectedFiles.length} عنصر(عناصر)`, "\uf0ea");
                break;
                
            case "paste":
                if (clipboard) {
                    pasteFiles();
                }
                break;
                
            case "rename":
                if (selectedFiles.length === 1) {
                    
                    showToast("ميزة 'إعادة التسمية' قيد التطوير", "\uf071");
                }
                break;
                
            case "properties":
                if (selectedFiles.length === 1) {
                    
                    showToast("ميزة 'الخصائص' قيد التطوير", "\uf071");
                }
                break;
                
            case "send_to":
                
                showToast("ميزة 'Send to' قيد التطوير", "\uf071");
                break;
                
            case "create_shortcut":
                
                showToast("ميزة 'Create shortcut' قيد التطوير", "\uf071");
                break;
                
            case "move_to_trash":
                moveToTrash();
                break;
                
            case "new_folder":
                createNewFolder();
                break;
                
            case "search":
                
                showToast("ميزة 'التنقيب في الملفات' قيد التطوير", "\uf071");
                break;
        }
    }
    
    
    function pasteFiles() {
        try {
            for (const file of clipboard) {
                if (clipboardAction === "cut") {
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
            showToast(`تم ${clipboardAction === "cut" ? "نقل" : "Copy"} العناصر بنجاح`, "\uf00c");
        } catch (e) {
            console.error("فشل لصق الملفات:", e);
            showToast("فشل لصق الملفات", "\uf071");
        }
    }
    
    
    function moveToTrash() {
        try {
            for (const file of selectedFiles) {
                const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
                process.start("gio", ["trash", file.path]);
                process.waitForFinished(500);
            }
            
            selectedFiles = [];
            loadDirectory(currentPath);
            showToast(`تم نقل ${selectedFiles.length} عنصر(عناصر) إلى سلة المحذوفات`, "\uf1f8");
        } catch (e) {
            console.error("فشل نقل الملفات إلى سلة المحذوفات:", e);
            showToast("فشل نقل الملفات إلى سلة المحذوفات", "\uf071");
        }
    }
    
    
    function createNewFolder() {
        try {
            const folderName = "مجلد جديد";
            let counter = 2;
            let name = folderName;
            
            
            while (files.some(f => f.name === name)) {
                name = `${folderName} ${counter}`;
                counter++;
            }
            
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("mkdir", [currentPath + "/" + name]);
            process.waitForFinished(500);
            
            if (process.exitCode() === 0) {
                loadDirectory(currentPath);
                showToast(`تم إنشاء "${name}" بنجاح`, "\uf07b");
            } else {
                showToast("فشل إنشاء المجلد", "\uf071");
            }
        } catch (e) {
            console.error("فشل إنشاء المجلد:", e);
            showToast("فشل إنشاء المجلد", "\uf071");
        }
    }
    
    
    function getDevices() {
        try {
            const process = Qt.createQmlObject('import Qt.labs.processes 6.8; Process', root, "Process");
            process.start("lsblk", ["-o", "NAME,SIZE,MOUNTPOINT", "-b", "-J"]);
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
        } catch (e) {
            console.error("فشل جلب الأجهزة:", e);
        }
        
        return [];
    }
    
    
    function formatFileSize(bytes) {
        if (bytes === 0) return "0 B";
        
        const k = 1024;
        const sizes = ["B", "KB", "MB", "GB", "TB"];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
    }
    
    
    function formatDate(dateString) {
        
        return dateString;
    }
    
    
    function showToast(message, icon) {
        
        console.log(`Toast: ${message}`);
    }
    
    
    
    
    
    
    OpacityAnimation {
        id: fadeInAnimation
        from: 0
        to: 1
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
    OpacityAnimation {
        id: fadeOutAnimation
        from: 1
        to: 0
        duration: 50
        easing.type: Easing.OutQuart
    }
    
    
    
    
    
    property var contextMenuItems: []
    
    
    property var filteredFiles: {
        if (searchQuery) {
            return files.filter(file => 
                file.name.toLowerCase().includes(searchQuery.toLowerCase())
            );
        }
        return files;
    }
    
    
    
    
    Keys.onPressed: {
        
        if (event.key === Qt.Key_N && event.modifiers & Qt.ControlModifier) {
            createNewFolder();
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_C && event.modifiers & Qt.ControlModifier) {
            if (selectedFiles.length > 0) {
                clipboard = [...selectedFiles];
                clipboardAction = "copy";
                showToast(`تم نسخ ${selectedFiles.length} عنصر(عناصر)`, "\uf0ea");
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_X && event.modifiers & Qt.ControlModifier) {
            if (selectedFiles.length > 0) {
                clipboard = [...selectedFiles];
                clipboardAction = "cut";
                showToast(`تم قص ${selectedFiles.length} عنصر(عناصر)`, "\uf0c8");
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_V && event.modifiers & Qt.ControlModifier) {
            if (clipboard) {
                pasteFiles();
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_Delete) {
            if (selectedFiles.length > 0) {
                moveToTrash();
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_F2) {
            if (selectedFiles.length === 1) {
                
                showToast("ميزة 'إعادة التسمية' قيد التطوير", "\uf071");
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_F5) {
            loadDirectory(currentPath);
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_Left && event.modifiers & Qt.AltModifier) {
            goBack();
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_Right && event.modifiers & Qt.AltModifier) {
            goForward();
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_T && event.modifiers & Qt.ControlModifier) {
            addNewTab();
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_W && event.modifiers & Qt.ControlModifier) {
            if (tabs.length > 1) {
                closeTab(activeTabIndex);
            }
            event.accepted = true;
        }
        
        
        if (event.key === Qt.Key_Q && event.modifiers & Qt.ControlModifier) {
            closeDrile();
            event.accepted = true;
        }
    }
    
    
    
    
    Component.onCompleted: {
        
        loadDirectory(currentPath);
        
        
        updateContextMenuItems();
    }
}
EOL

echo "---------------------------"
echo "(4/5) تكوين الموارد..."
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

echo "------------------------------"
echo "(5/5) بناء النظام باستخدام C++..."

cat <<EOL > ~/src/quickshell/main.cpp


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


class QuickShellAnimation : public QObject, protected QOpenGLFunctions {
    Q_OBJECT
    Q_PROPERTY(qreal animationDuration READ animationDuration WRITE setAnimationDuration NOTIFY animationDurationChanged)
    Q_PROPERTY(qreal animationEasing READ animationEasing WRITE setAnimationEasing NOTIFY animationEasingChanged)
    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    
public:
    explicit QuickShellAnimation(QObject *parent = nullptr);
    ~QuickShellAnimation();
    
    
    Q_INVOKABLE void startAnimation(QObject *target, const QString &property, qreal from, qreal to, int duration = -1);
    Q_INVOKABLE void stopAnimation(QObject *target, const QString &property);
    Q_INVOKABLE void stopAllAnimations();
    Q_INVOKABLE bool isAnimating(QObject *target, const QString &property) const;
    
    
    qreal animationDuration() const { return m_animationDuration; }
    void setAnimationDuration(qreal duration);
    
    qreal animationEasing() const { return m_animationEasing; }
    void setAnimationEasing(qreal easing);
    
    bool enabled() const { return m_enabled; }
    void setEnabled(bool enabled);
    
    
    Q_INVOKABLE void setHighPerformanceMode(bool enabled);
    Q_INVOKABLE void setVSyncEnabled(bool enabled);
    Q_INVOKABLE void setAnimationQuality(int quality); 
    
    
    Q_INVOKABLE void registerCustomEasing(const QString &name, std::function<qreal(qreal)> easingFunction);
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
    qreal calculateEasing(qreal progress, int easingType) const;
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
    
    
    QOpenGLShaderProgram *m_shaderProgram;
    QOpenGLBuffer *m_vertexBuffer;
    QOpenGLVertexArrayObject *m_vao;
    
    std::thread m_animationThread;
    std::atomic<bool> m_running;
    std::mutex m_mutex;
    std::condition_variable m_condition;
};

EOL

cat <<EOL > ~/src/quickshell/animation/QuickShellAnimation.cpp

QuickShellAnimation::QuickShellAnimation(QObject *parent)
    : QObject(parent),
      m_animationDuration(100),
      m_animationEasing(2), 
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
    
    for (QWindow *window : QGuiApplication::topLevelWindows()) {
        if (QQuickWindow *quickWindow = qobject_cast<QQuickWindow*>(window)) {
            m_window = quickWindow;
            break;
        }
    }
    
    if (m_window) {
        m_window->beforeRendering.connect(this, &QuickShellAnimation::handleWindowBeforeRendering, Qt::DirectConnection);
    }
    
    
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
        return t < 0.5 ? 8 * t * t * t * t : 1 - 8 * (--t) * t * t * t; 
    });
    
    
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
    
    if (m_window) {
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
    if (m_window) {
        m_window->setVSyncEnabled(enabled);
    }
}

void QuickShellAnimation::setAnimationQuality(int quality) {
    m_animationQuality = qBound(0, quality, 100);
}

void QuickShellAnimation::startAnimation(QObject *target, const QString &property, qreal from, qreal to, int duration) {
    if (!m_enabled || !target)
        return;
    
    if (duration == -1)
        duration = m_animationDuration;
    
    
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

void QuickShellAnimation::stopAnimation(QObject *target, const QString &property) {
    std::lock_guard<std::mutex> lock(m_mutex);
    
    auto it = std::remove_if(m_animations.begin(), m_animations.end(),
        [target, &property](const Animation &anim) {
            return anim.target == target && anim.property == property;
        });
    
    if (it != m_animations.end()) {
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
    
    for (const auto &anim : m_animations) {
        if (anim.target == target && anim.property == property && anim.active) {
            return true;
        }
    }
    
    return false;
}

void QuickShellAnimation::registerCustomEasing(const QString &name, std::function<qreal(qreal)> easingFunction) {
    m_customEasings[name] = easingFunction;
}

void QuickShellAnimation::animateWithCustomEasing(QObject *target, const QString &property, qreal from, qreal to, int duration, const QString &easingName) {
    if (!m_enabled || !target || m_customEasings.find(easingName) == m_customEasings.end())
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
    if (!m_enabled)
        return;
    
    
    processAnimations();
    
    
    if (m_animationQuality < 100 && m_window && m_window->openglContext()) {
        initializeOpenGL();
        renderAnimations();
    }
}

void QuickShellAnimation::initializeOpenGL() {
    if (m_shaderProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    
    m_shaderProgram = new QOpenGLShaderProgram();
    m_shaderProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    coords = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_shaderProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform float opacity;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    vec4 color = texture2D(source, coords);\n"
        "    gl_FragColor = vec4(color.rgb, color.a * opacity);\n"
        "}\n");
    
    m_shaderProgram->bindAttributeLocation("vertices", 0);
    m_shaderProgram->link();
    m_shaderProgram->bind();
    
    
    m_vertexBuffer = new QOpenGLBuffer(QOpenGLBuffer::VertexBuffer);
    m_vertexBuffer->create();
    m_vertexBuffer->bind();
    
    
    m_vao = new QOpenGLVertexArrayObject();
    if (m_vao->create())
        m_vao->bind();
}

void QuickShellAnimation::cleanupOpenGL() {
    if (m_vao) {
        m_vao->destroy();
        delete m_vao;
        m_vao = nullptr;
    }
    
    if (m_vertexBuffer) {
        m_vertexBuffer->destroy();
        delete m_vertexBuffer;
        m_vertexBuffer = nullptr;
    }
    
    if (m_shaderProgram) {
        delete m_shaderProgram;
        m_shaderProgram = nullptr;
    }
}

void QuickShellAnimation::renderAnimations() {
    if (!m_shaderProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    
    float opacity = m_animationQuality / 100.0f;
    
    
    m_shaderProgram->bind();
    m_shaderProgram->setUniformValue("opacity", opacity);
    
    
    m_window->openglContext()->functions()->glEnable(GL_BLEND);
    m_window->openglContext()->functions()->glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    
    
    m_window->openglContext()->functions()->glDisable(GL_BLEND);
    m_shaderProgram->release();
}

void QuickShellAnimation::processAnimations() {
    if (!m_enabled)
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    std::vector<Animation> completedAnimations;
    
    {
        std::lock_guard<std::mutex> lock(m_mutex);
        
        for (auto &anim : m_animations) {
            if (!anim.active)
                continue;
            
            qint64 elapsed = currentTime - anim.startTime;
            if (elapsed >= anim.duration) {
                
                updateTargetProperty(anim, anim.to);
                anim.active = false;
                completedAnimations.push_back(anim);
                continue;
            }
            
            
            qreal progress = static_cast<qreal>(elapsed) / anim.duration;
            qreal easedProgress = anim.easingFunction ? anim.easingFunction(progress) : progress;
            qreal value = anim.from + (anim.to - anim.from) * easedProgress;
            
            
            updateTargetProperty(anim, value);
            
            emit animationProgress(anim.target, anim.property, easedProgress);
        }
        
        
        m_animations.erase(
            std::remove_if(m_animations.begin(), m_animations.end(),
                [](const Animation &anim) { return !anim.active; }),
            m_animations.end()
        );
    }
    
    
    for (const auto &anim : completedAnimations) {
        emit animationStopped(anim.target, anim.property);
    }
}

qreal QuickShellAnimation::calculateEasing(qreal progress, int easingType) const {
    switch (easingType) {
    case 0: 
        return progress;
    case 1: 
        return progress * progress;
    case 2: 
        return progress * (2 - progress);
    case 3: 
        return progress < 0.5 ? 2 * progress * progress : -1 + (4 - 2 * progress) * progress;
    case 4: 
        return progress * progress * progress;
    case 5: 
        return (--progress) * progress * progress + 1;
    case 6: 
        return progress < 0.5 ? 4 * progress * progress * progress : (progress - 1) * (2 * progress - 2) * (2 * progress - 2) + 1;
    case 7: 
        return progress * progress * progress * progress;
    case 8: 
        return 1 - (--progress) * progress * progress * progress;
    case 9: 
        return progress < 0.5 ? 8 * progress * progress * progress * progress : 1 - 8 * (--progress) * progress * progress * progress;
    default:
        return progress;
    }
}

void QuickShellAnimation::updateTargetProperty(Animation &anim, qreal value) {
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


class QuickShellEffects : public QObject, protected QOpenGLFunctions {
    Q_OBJECT
    Q_PROPERTY(qreal blurRadius READ blurRadius WRITE setBlurRadius NOTIFY blurRadiusChanged)
    Q_PROPERTY(qreal opacity READ opacity WRITE setOpacity NOTIFY opacityChanged)
    Q_PROPERTY(bool enabled READ enabled WRITE setEnabled NOTIFY enabledChanged)
    Q_PROPERTY(QColor backgroundColor READ backgroundColor WRITE setBackgroundColor NOTIFY backgroundColorChanged)
    
public:
    explicit QuickShellEffects(QObject *parent = nullptr);
    ~QuickShellEffects();
    
    
    qreal blurRadius() const { return m_blurRadius; }
    void setBlurRadius(qreal radius);
    
    qreal opacity() const { return m_opacity; }
    void setOpacity(qreal opacity);
    
    bool enabled() const { return m_enabled; }
    void setEnabled(bool enabled);
    
    QColor backgroundColor() const { return m_backgroundColor; }
    void setBackgroundColor(const QColor &color);
    
    
    Q_INVOKABLE void applySmoothBlur(QQuickItem *item, qreal radius = -1, qreal opacity = -1);
    Q_INVOKABLE void applyEyeFriendlyGlow(QQuickItem *item, const QColor &color, qreal intensity = 1.0);
    Q_INVOKABLE void applyDynamicIslandEffect(QQuickItem *item, bool isExpanded = false);
    Q_INVOKABLE void applyWaterRippleEffect(QQuickItem *item, const QPointF &center, qreal maxRadius = 100);
    Q_INVOKABLE void applySmoothTransition(QQuickItem *source, QQuickItem *target, qreal duration = 300);
    
    
    Q_INVOKABLE void optimizeEffectsForPerformance();
    Q_INVOKABLE void optimizeEffectsForQuality();
    Q_INVOKABLE void setEffectQuality(int quality); 
    
    
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
    
    
    QOpenGLShaderProgram *m_blurProgram;
    QOpenGLShaderProgram *m_pulseProgram;
    QOpenGLShaderProgram *m_breathingProgram;
    QOpenGLBuffer *m_vertexBuffer;
    QOpenGLVertexArrayObject *m_vao;
    
    QTimer m_pulseTimer;
    QTimer m_breathingTimer;
};

EOL

cat <<EOL > ~/src/quickshell/effects/QuickShellEffects.cpp

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
    
    for (QWindow *window : QGuiApplication::topLevelWindows()) {
        if (QQuickWindow *quickWindow = qobject_cast<QQuickWindow*>(window)) {
            m_window = quickWindow;
            break;
        }
    }
    
    if (m_window) {
        m_window->beforeRendering.connect(this, &QuickShellEffects::handleWindowBeforeRendering, Qt::DirectConnection);
    }
    
    
    m_pulseTimer.setInterval(16); 
    m_pulseTimer.setSingleShot(false);
    connect(&m_pulseTimer, &QTimer::timeout, this, &QuickShellEffects::handlePulseAnimations);
    
    m_breathingTimer.setInterval(16);
    m_breathingTimer.setSingleShot(false);
    connect(&m_breathingTimer, &QTimer::timeout, this, &QuickShellEffects::handleBreathingAnimations);
}

QuickShellEffects::~QuickShellEffects() {
    if (m_window) {
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
    if (!m_enabled) {
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
    if (!m_enabled || !item)
        return;
    
    if (radius < 0) radius = m_blurRadius;
    if (opacity < 0) opacity = m_opacity;
    
    
    for (auto &effect : m_blurEffects) {
        if (effect.item == item) {
            effect.radius = radius;
            effect.opacity = opacity;
            effect.active = true;
            return;
        }
    }
    
    
    BlurEffect effect;
    effect.item = item;
    effect.radius = radius;
    effect.opacity = opacity;
    effect.active = true;
    m_blurEffects.push_back(effect);
    
    emit effectApplied(item, "blur");
}

void QuickShellEffects::applyEyeFriendlyGlow(QQuickItem *item, const QColor &color, qreal intensity) {
    if (!m_enabled || !item)
        return;
    
    
    
    
    applySmoothBlur(item, 16.0, intensity * 0.3);
}

void QuickShellEffects::applyDynamicIslandEffect(QQuickItem *item, bool isExpanded) {
    if (!m_enabled || !item)
        return;
    
    
    if (isExpanded) {
        applySmoothBlur(item, 24.0, 0.7);
    } else {
        applySmoothBlur(item, 32.0, 0.85);
    }
}

void QuickShellEffects::applyWaterRippleEffect(QQuickItem *item, const QPointF &center, qreal maxRadius) {
    if (!m_enabled || !item)
        return;
    
    
    
    
    applySmoothBlur(item, 8.0, 0.5);
}

void QuickShellEffects::applySmoothTransition(QQuickItem *source, QQuickItem *target, qreal duration) {
    if (!m_enabled || !source || !target)
        return;
    
    
    applySmoothBlur(source, 16.0, 0.5);
    applySmoothBlur(target, 16.0, 0.5);
    
    
}

void QuickShellEffects::optimizeEffectsForPerformance() {
    m_effectQuality = 70; 
    m_blurRadius = 16.0;  
}

void QuickShellEffects::optimizeEffectsForQuality() {
    m_effectQuality = 100; 
    m_blurRadius = 32.0;   
}

void QuickShellEffects::setEffectQuality(int quality) {
    m_effectQuality = qBound(0, quality, 100);
}

void QuickShellEffects::startPulseAnimation(QQuickItem *item, const QColor &color, int duration, int interval) {
    if (!m_enabled || !item)
        return;
    
    
    for (auto &effect : m_pulseEffects) {
        if (effect.item == item) {
            effect.color = color;
            effect.duration = duration;
            effect.interval = interval;
            effect.timer.restart();
            effect.active = true;
            return;
        }
    }
    
    
    PulseEffect effect;
    effect.item = item;
    effect.color = color;
    effect.duration = duration;
    effect.interval = interval;
    effect.timer.restart();
    effect.active = true;
    m_pulseEffects.push_back(effect);
    
    
    if (m_pulseEffects.size() == 1) {
        m_pulseTimer.start();
    }
}

void QuickShellEffects::stopPulseAnimation(QQuickItem *item) {
    for (auto &effect : m_pulseEffects) {
        if (effect.item == item) {
            effect.active = false;
        }
    }
}

void QuickShellEffects::startBreathingAnimation(QQuickItem *item, qreal minScale, qreal maxScale, int duration) {
    if (!m_enabled || !item)
        return;
    
    
    for (auto &effect : m_breathingEffects) {
        if (effect.item == item) {
            effect.minScale = minScale;
            effect.maxScale = maxScale;
            effect.duration = duration;
            effect.timer.restart();
            effect.active = true;
            return;
        }
    }
    
    
    BreathingEffect effect;
    effect.item = item;
    effect.minScale = minScale;
    effect.maxScale = maxScale;
    effect.duration = duration;
    effect.timer.restart();
    effect.active = true;
    m_breathingEffects.push_back(effect);
    
    
    if (m_breathingEffects.size() == 1) {
        m_breathingTimer.start();
    }
}

void QuickShellEffects::stopBreathingAnimation(QQuickItem *item) {
    for (auto &effect : m_breathingEffects) {
        if (effect.item == item) {
            effect.active = false;
        }
    }
}

void QuickShellEffects::handleWindowBeforeRendering() {
    if (!m_enabled)
        return;
    
    
    renderEffects();
}

void QuickShellEffects::handlePulseAnimations() {
    if (m_pulseEffects.empty())
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    
    for (auto &effect : m_pulseEffects) {
        if (!effect.active)
            continue;
        
        qreal elapsed = fmod(effect.timer.elapsed(), effect.interval);
        qreal progress = elapsed / effect.interval;
        
        if (progress < 0.5) {
            
            qreal opacity = progress * 2.0;
            applyEyeFriendlyGlow(effect.item, effect.color, opacity);
        } else {
            
            qreal opacity = 2.0 - progress * 2.0;
            applyEyeFriendlyGlow(effect.item, effect.color, opacity);
        }
    }
}

void QuickShellEffects::handleBreathingAnimations() {
    if (m_breathingEffects.empty())
        return;
    
    qint64 currentTime = QDateTime::currentMSecsSinceEpoch();
    
    for (auto &effect : m_breathingEffects) {
        if (!effect.active)
            continue;
        
        qreal elapsed = fmod(effect.timer.elapsed(), effect.duration);
        qreal progress = elapsed / effect.duration;
        
        
        qreal scale = effect.minScale + (effect.maxScale - effect.minScale) * (0.5 + 0.5 * qSin(progress * 2 * M_PI));
        effect.item->setScale(scale);
    }
}

void QuickShellEffects::initializeOpenGL() {
    if (m_blurProgram || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    
    m_blurProgram = new QOpenGLShaderProgram();
    m_blurProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    coords = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_blurProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform float radius;\n"
        "uniform float opacity;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    vec4 color = vec4(0.0);\n"
        "    float total = 0.0;\n"
        "    vec2 size = vec2(1.0, 1.0);\n"
        "    \n"
        "    
        "    for (int i = -4; i <= 4; i++) {\n"
        "        for (int j = -4; j <= 4; j++) {\n"
        "            float weight = 1.0 - length(vec2(i, j)) / 5.0;\n"
        "            color += texture2D(source, coords + vec2(i, j) * radius / 500.0) * weight;\n"
        "            total += weight;\n"
        "        }\n"
        "    }\n"
        "    \n"
        "    gl_FragColor = vec4(color.rgb / total, color.a * opacity);\n"
        "}\n");
    
    m_blurProgram->bindAttributeLocation("vertices", 0);
    m_blurProgram->link();
    m_blurProgram->bind();
    
    
    m_pulseProgram = new QOpenGLShaderProgram();
    m_pulseProgram->addShaderFromSourceCode(QOpenGLShader::Vertex,
        "attribute vec4 vertices;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    gl_Position = vertices;\n"
        "    coords = vertices.xy * 0.5 + 0.5;\n"
        "}\n");
    
    m_pulseProgram->addShaderFromSourceCode(QOpenGLShader::Fragment,
        "uniform sampler2D source;\n"
        "uniform vec4 glowColor;\n"
        "uniform float intensity;\n"
        "varying vec2 coords;\n"
        "void main() {\n"
        "    vec4 color = texture2D(source, coords);\n"
        "    vec4 glow = glowColor * intensity;\n"
        "    gl_FragColor = vec4(mix(color.rgb, glow.rgb, glow.a), color.a);\n"
        "}\n");
    
    m_pulseProgram->bindAttributeLocation("vertices", 0);
    m_pulseProgram->link();
    
    
    m_vertexBuffer = new QOpenGLBuffer(QOpenGLBuffer::VertexBuffer);
    m_vertexBuffer->create();
    m_vertexBuffer->bind();
    
    
    m_vao = new QOpenGLVertexArrayObject();
    if (m_vao->create())
        m_vao->bind();
}

void QuickShellEffects::cleanupOpenGL() {
    if (m_vao) {
        m_vao->destroy();
        delete m_vao;
        m_vao = nullptr;
    }
    
    if (m_vertexBuffer) {
        m_vertexBuffer->destroy();
        delete m_vertexBuffer;
        m_vertexBuffer = nullptr;
    }
    
    if (m_blurProgram) {
        delete m_blurProgram;
        m_blurProgram = nullptr;
    }
    
    if (m_pulseProgram) {
        delete m_pulseProgram;
        m_pulseProgram = nullptr;
    }
    
    if (m_breathingProgram) {
        delete m_breathingProgram;
        m_breathingProgram = nullptr;
    }
}

void QuickShellEffects::renderEffects() {
    if (!m_enabled || !m_window || !m_window->openglContext())
        return;
    
    m_window->openglContext()->functions()->initializeOpenGLFunctions();
    
    
    m_window->openglContext()->functions()->glEnable(GL_BLEND);
    m_window->openglContext()->functions()->glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    
    for (const auto &effect : m_blurEffects) {
        if (effect.active) {
            renderBlurEffect(effect);
        }
    }
    
    
    for (const auto &effect : m_pulseEffects) {
        if (effect.active) {
            renderPulseEffect(effect);
        }
    }
    
    
    for (const auto &effect : m_breathingEffects) {
        if (effect.active) {
            renderBreathingEffect(effect);
        }
    }
    
    
    m_window->openglContext()->functions()->glDisable(GL_BLEND);
}

void QuickShellEffects::renderBlurEffect(const BlurEffect &effect) {
    if (!m_blurProgram || !m_window || !m_window->openglContext())
        return;
    
    m_blurProgram->bind();
    m_blurProgram->setUniformValue("radius", static_cast<float>(effect.radius));
    m_blurProgram->setUniformValue("opacity", static_cast<float>(effect.opacity));
    
    
    m_window->openglContext()->functions()->glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    m_blurProgram->release();
}

void QuickShellEffects::renderPulseEffect(const PulseEffect &effect) {
    if (!m_pulseProgram || !m_window || !m_window->openglContext())
        return;
    
    m_pulseProgram->bind();
    m_pulseProgram->setUniformValue("glowColor", effect.color);
    m_pulseProgram->setUniformValue("intensity", 1.0f);
    
    
    m_window->openglContext()->functions()->glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    m_pulseProgram->release();
}

void QuickShellEffects::renderBreathingEffect(const BreathingEffect &effect) {
    
}
EOL

cat <<EOL > ~/src/quickshell/effects/GlassMorphismEffect.h



class GlassMorphismEffect : public QObject
{
    Q_OBJECT

public:
    explicit GlassMorphismEffect(QObject *parent = nullptr);
    ~GlassMorphismEffect();

    
    void applyEffect(QImage &input, QImage &output, int radius, float intensity);

private:
    
    QImage applyGaussianBlur(const QRgb *bits, int width, int height, int radius);

    
    void horizontalBlur(const QRgb *source, QRgb *target, int width, int height, int radius);

    
    void verticalBlur(const QRgb *source, QRgb *target, int width, int height, int radius);
};

EOL

cat <<EOL > ~/src/quickshell/system/GlassMorphismEffect.h

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

    if (input.isNull() || input.format() != QImage::Format_ARGB32) {
        output = input;
        return;
    }

    QRgb *bits = (QRgb *)input.bits();
    const int width = input.width();
    const int height = input.height();

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
        qDebug() << "GlassMorphismEffect: Processing took" << elapsed << "ms";
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
    const int diameter = radius * 2 + 1;
    const float scale = 1.0f / diameter;

    for (int y = 0; y < height; ++y) {
        int sumR = 0, sumG = 0, sumB = 0;

        for (int x = 0; x < diameter && x < width; ++x) {
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
    const int diameter = radius * 2 + 1;
    const float scale = 1.0f / diameter;

    for (int x = 0; x < width; ++x) {
        int sumR = 0, sumG = 0, sumB = 0;

        for (int y = 0; y < diameter && y < height; ++y) {
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


class QuickShellSystem : public QObject {
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
    
    
    qint64 totalMemory() const;
    qint64 usedMemory() const;
    qint64 freeMemory() const;
    int cpuUsage() const;
    int batteryLevel() const;
    bool batteryCharging() const;
    QString systemName() const;
    QString kernelVersion() const;
    QString architecture() const;
    
    
    Q_INVOKABLE void restartSystem();
    Q_INVOKABLE void shutdownSystem();
    Q_INVOKABLE void suspendSystem();
    Q_INVOKABLE void lockScreen();
    
    
    Q_INVOKABLE bool fileExists(const QString &path) const;
    Q_INVOKABLE bool directoryExists(const QString &path) const;
    Q_INVOKABLE bool createDirectory(const QString &path) const;
    Q_INVOKABLE bool removeFile(const QString &path) const;
    Q_INVOKABLE bool copyFile(const QString &source, const QString &destination) const;
    Q_INVOKABLE bool moveFile(const QString &source, const QString &destination) const;
    
    
    Q_INVOKABLE QString executeCommand(const QString &command, const QStringList &arguments = QStringList(), int timeout = 5000);
    Q_INVOKABLE bool executeTerminalCommand(const QString &command);
    
    
    Q_INVOKABLE QVariant getSetting(const QString &group, const QString &key, const QVariant &defaultValue = QVariant());
    Q_INVOKABLE void setSetting(const QString &group, const QString &key, const QVariant &value);
    Q_INVOKABLE void removeSetting(const QString &group, const QString &key);
    
    
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

EOL

cat <<EOL > ~/src/quickshell/system/QuickShellSystem.cpp

QuickShellSystem::QuickShellSystem(QObject *parent)
    : QObject(parent),
      m_process(nullptr)
{
    
    m_systemInfo.totalMemory = 0;
    m_systemInfo.usedMemory = 0;
    m_systemInfo.freeMemory = 0;
    m_systemInfo.cpuUsage = 0;
    m_systemInfo.batteryLevel = 100;
    m_systemInfo.batteryCharging = false;
    m_systemInfo.systemName = "Desind OS";
    m_systemInfo.kernelVersion = "Unknown";
    m_systemInfo.architecture = "Unknown";
    
    
    updateSystemInfo();
    
    
    m_updateTimer.setInterval(2000);
    m_updateTimer.setSingleShot(false);
    connect(&m_updateTimer, &QTimer::timeout, this, &QuickShellSystem::updateSystemInfo);
    m_updateTimer.start();
}

QuickShellSystem::~QuickShellSystem() {
    if (m_process) {
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

QString QuickShellSystem::executeCommand(const QString &command, const QStringList &arguments, int timeout) {
    QProcess process;
    process.start(command, arguments);
    
    if (!process.waitForStarted()) {
        emit errorOccurred("Failed to start process: " + command);
        return QString();
    }
    
    if (!process.waitForFinished(timeout)) {
        process.kill();
        emit errorOccurred("Process timed out: " + command);
        return QString();
    }
    
    QString output = QString::fromUtf8(process.readAllStandardOutput());
    QString error = QString::fromUtf8(process.readAllStandardError());
    
    if (!error.isEmpty()) {
        emit errorOccurred(error);
    }
    
    emit commandExecuted(output);
    return output;
}

bool QuickShellSystem::executeTerminalCommand(const QString &command) {
    return executeCommand("alacritty", QStringList() << "-e" << command) != QString();
}

QVariant QuickShellSystem::getSetting(const QString &group, const QString &key, const QVariant &defaultValue) {
    QSettings settings("Desind", "DesindOS");
    settings.beginGroup(group);
    QVariant value = settings.value(key, defaultValue);
    settings.endGroup();
    return value;
}

void QuickShellSystem::setSetting(const QString &group, const QString &key, const QVariant &value) {
    QSettings settings("Desind", "DesindOS");
    settings.beginGroup(group);
    settings.setValue(key, value);
    settings.endGroup();
}

void QuickShellSystem::removeSetting(const QString &group, const QString &key) {
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
    
    
    static qint64 prevIdleTime = 0;
    static qint64 prevTotalTime = 0;
    
    QFile statFile("/proc/stat");
    if (statFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&statFile);
        QString line = in.readLine();
        if (line.startsWith("cpu ")) {
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
    
    
    QDir batteryDir("/sys/class/power_supply");
    if (batteryDir.exists()) {
        QStringList batteries = batteryDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
        for (const QString &battery : batteries) {
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
    
    
    QFile kernelVersion("/proc/version");
    if (kernelVersion.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&kernelVersion);
        QString line = in.readLine();
        if (!line.isEmpty()) {
            QStringList parts = line.split(" ");
            if (parts.size() > 2) {
                m_systemInfo.kernelVersion = parts[2];
            }
        }
        kernelVersion.close();
    }
    
    
    m_systemInfo.architecture = QSysInfo::buildCpuArchitecture();
    
    
    emit systemInfoChanged();
}
EOL

cat <<EOL > ~/src/quickshell/QuickShellPlugin.cpp

static void registerQuickShellTypes() {
    qmlRegisterType<QuickShellAnimation>("QuickShell.Animation", 1, 0, "Animation");
    qmlRegisterType<QuickShellEffects>("QuickShell.Effects", 1, 0, "Effects");
    qmlRegisterType<QuickShellSystem>("QuickShell.System", 1, 0, "System");
}

Q_COREAPP_STARTUP_FUNCTION(registerQuickShellTypes)
EOL

echo "================="
echo "تثبيت Snapd..."
echo "================="
if ! command -v snap &> /dev/null; then
    sudo pacman -Sy --noconfirm snapd
    sudo systemctl enable --now snapd.socket
fi

echo "تثبيت تطبيقات سطح المكتب..."
echo "=============================="
echo "(1/7) تثبيت YouTube..."
cat <<EOL > ~/.local/share/applications/youtube.desktop
[Desktop Entry]
Name=YouTube
Comment=فيديوهاتك المفضلة في أي وقت وأي مكان!
Exec=chromium --app=https:
Icon=youtube
Terminal=false
Type=Application
Categories=Multimedia;Video;Network;
StartupWMClass=youtube-pwa
EOL

echo "(2/7) تثبيت Gmail..."
cat <<EOL > ~/.local/share/applications/gmail.desktop
[Desktop Entry]
Name=Gmail
Comment=تطبيق البريد الالكتروني المفضل من الجميع!
Exec=chromium --app=https:
Icon=gmail
Terminal=false
Type=Application
Categories=Network;Email;
StartupWMClass=gmail-pwa
MimeType=x-scheme-handler/mailto;
EOL

echo "(3/7) تثبيت Google Drive..."
cat <<EOL > ~/.local/share/applications/google-drive.desktop
[Desktop Entry]
Name=Google Drive
Comment=ملفاتك مزامنة على أجهزتك.
Exec=chromium --app=https:
Icon=google-drive
Terminal=false
Type=Application
Categories=Network;Office;Utility;
StartupWMClass=google-drive-pwa
EOL

echo "(4/7) تثبيت Google Photos..."
cat <<EOL > ~/.local/share/applications/google-photos.desktop
[Desktop Entry]
Name=Google Photos
Comment=شارك صورك مع جميع أجهزتك أينما كنت!
Exec=chromium --app=https:
Icon=google-photos
Terminal=false
Type=Application
Categories=Multimedia;Graphics;Photography;Network;
StartupWMClass=google-photos-pwa
EOL

echo "(5/7) تثبيت GitHub..."
cat <<EOL > ~/.local/share/applications/github.desktop
[Desktop Entry]
Name=GitHub
Comment=مستودعاتك معك طوال الوقت!
Exec=chromium --app=https:
Icon=github
Terminal=false
Type=Application
Categories=Development;Network;
StartupWMClass=github-pwa
EOL

echo "(6/7) تثبيت Reddit..."
cat <<EOL > ~/.local/share/applications/reddit.desktop
[Desktop Entry]
Name=Reddit
Comment=فتح Reddit كواجهة تطبيق سطح المكتب
Exec=chromium --app=https:
Icon=reddit
Terminal=false
Type=Application
Categories=Network;Social;
StartupWMClass=reddit-pwa
EOL

echo "(7/7) تثبيت Pinterest..."
cat <<EOL > ~/.local/share/applications/pinterest.desktop
[Desktop Entry]
Name=Pinterest
Comment=أفضل تطبيق لسرقة أفكار الأخرين!
Exec=chromium --app=https:
Icon=pinterest
Terminal=false
Type=Application
Categories=Graphics;Network;
StartupWMClass=pinterest-pwa
EOL

update-desktop-database ~/.local/share/applications/

echo "انهاء إعداد النظام، يرجى الانتظار..."
cat <<EOL > ~/etc/systemd/system/desind.service
[Unit]
Description=Desind Shell Desktop (DSD)
After=graphical.target

[Service]
Type=simple
ExecStart=/usr/bin/quickshell -p /home/$USER/.config/quickshell/shell.qml
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

mkdir -p "$SYSTEM_CONFIG_DIR"
mkdir -p "$IMAGE_DIR"

echo "نقل الصور..."
cp "$PROJECT_ROOT/resources/images/"* "$IMAGE_DIR/"

echo "نقل ملفات الإعدادات..."
cp "$PROJECT_ROOT/resources/data/"*.json "$SYSTEM_CONFIG_DIR/"

cp "$PROJECT_ROOT/docs/"*.{md,LICENSE} "$DOC_DIR/"

echo "----------"
echo "=============="
echo "تم الانتهاء!"
echo "=============="
echo "----------"

systemctl enable desind.service
systemctl start desind.service