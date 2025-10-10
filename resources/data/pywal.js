function loadPywalColors() {
    const fs = require('fs');
    const path = require('path');
    const homeDir = process.env.HOME || process.env.USERPROFILE;
    const colorsPath = path.join(homeDir, '.cache', 'wal', 'colors.json');
    try {
        const data = JSON.parse(fs.readFileSync(colorsPath, 'utf8'));
        return {
            colors: [
                data.special.background,
                data.colors.color1,
                data.colors.color2,
                data.colors.color3,
                data.colors.color4,
                data.colors.color5,
                data.colors.color6,
                data.colors.color7,
                data.special.foreground
            ],
            special: {
                background: data.special.background,
                foreground: data.special.foreground,
                cursor: data.special.cursor
            }
        };
    } catch (error) {
        console.error("Failed to load Pywal colors");
        return null;
    }
}

module.exports = { loadPywalColors };