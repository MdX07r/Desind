#!/usr/bin/env python3
import urllib.request, json, os, sys, subprocess, html, time

def fetch(url, headers=None, timeout=15):
    try:
        req = urllib.request.Request(url, headers=headers or {})
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.read().decode()
    except Exception as e:
        print(f"[fetch error] {url} -> {e}", file=sys.stderr)
        return None

def fetch_json(url, headers=None):
    txt = fetch(url, headers)
    if not txt:
        return None
    try:
        return json.loads(txt)
    except Exception as e:
        print("[json parse error]", e, file=sys.stderr)
        return None

def get_discord_count(invite_code):
    url = f"https://discord.com/api/v9/invites/{invite_code}?with_counts=true"
    j = fetch_json(url, headers={"User-Agent":"Mozilla/5.0"})
    if j and "approximate_member_count" in j:
        return str(j["approximate_member_count"])
    return "N/A"

def get_reddit_count(sub):
    url = f"https://www.reddit.com/r/{sub}/about.json"
    j = fetch_json(url, headers={"User-Agent":"Mozilla/5.0"})
    if j and "data" in j and "subscribers" in j["data"]:
        return str(j["data"]["subscribers"])
    return "N/A"

def get_github_stars(repo, token=None):
    url = f"https://api.github.com/repos/{repo}"
    headers = {"User-Agent":"Mozilla/5.0"}
    if token:
        headers["Authorization"] = f"token {token}"
    j = fetch_json(url, headers=headers)
    if j and "stargazers_count" in j:
        return str(j["stargazers_count"])
    return "N/A"

def xml_escape(s):
    return html.escape(s)

def make_badge(label, value, filename):
    height = 32
    stroke_w = 3
    rx = height // 2
    pad_x = 10
    char_w = 8.6
    font_size = 13

    label_s = xml_escape(label)
    value_s = xml_escape(value)

    left_w = max(70, int(pad_x*2 + len(label)*char_w))
    right_w = max(70, int(pad_x*2 + len(value)*char_w))
    total_w = left_w + right_w

    svg = f'''<svg xmlns="http://www.w3.org/2000/svg" width="{total_w}" height="{height}" viewBox="0 0 {total_w} {height}" role="img" aria-label="{label_s} {value_s}">
  <!-- outer rounded black with white border -->
  <rect x="0" y="0" width="{total_w}" height="{height}" rx="{rx}" fill="#000000" stroke="#ffffff" stroke-width="{stroke_w}"/>
  <!-- left blue pill -->
  <rect x="0" y="0" width="{left_w}" height="{height}" rx="{rx}" fill="#1e90ff"/>
  <!-- cover the right rounded of left pill to make straight seam -->
  <rect x="{left_w - rx}" y="0" width="{rx}" height="{height}" fill="#000000"/>
  <!-- texts -->
  <text x="{left_w/2}" y="{height/2}" dominant-baseline="middle" text-anchor="middle" font-family="Segoe UI, Roboto, 'Helvetica Neue', Arial, sans-serif" font-size="{font_size}" fill="#ffffff">{label_s}</text>
  <text x="{left_w + right_w/2}" y="{height/2}" dominant-baseline="middle" text-anchor="middle" font-family="Segoe UI, Roboto, 'Helvetica Neue', Arial, sans-serif" font-size="{font_size}" fill="#ffffff">{value_s}</text>
</svg>'''
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w", encoding="utf-8") as f:
        f.write(svg)
    print(f"[wrote] {filename} (w={total_w})")

def git_commit_push():
    try:
        res = subprocess.run('git status --porcelain', shell=True, capture_output=True, text=True)
        if res.stdout.strip() == "":
            print("[git] no changes")
            return
        subprocess.run('git config user.name "github-actions[bot]"', shell=True, check=True)
        subprocess.run('git config user.email "41898282+github-actions[bot]@users.noreply.github.com"', shell=True, check=True)
        subprocess.run('git add badges/*.svg', shell=True, check=True)
        subprocess.run('git commit -m "chore: update dynamic badges [auto]"', shell=True, check=True)
        subprocess.run('git push', shell=True, check=True)
        print("[git] pushed changes")
    except Exception as e:
        print("[git error]", e, file=sys.stderr)

def main():
    invite = os.getenv("DISCORD_INVITE", "sVdmwUd2pz")
    reddit_sub = os.getenv("REDDIT_SUB", "Daruza")
    gh_repo = os.getenv("GITHUB_REPO", "MdX07r/Desind")
    gh_token = os.getenv("GITHUB_TOKEN", None)

    print("[start] fetching counts...")
    d = get_discord_count(invite)
    time.sleep(1)
    r = get_reddit_count(reddit_sub)
    time.sleep(1)
    s = get_github_stars(gh_repo, gh_token)

    print(f"[counts] Discord={d} Reddit={r} Stars={s}")

    make_badge("Discord", d, "badges/discord.svg")
    make_badge(f"r/{reddit_sub}", r, "badges/reddit.svg")
    make_badge("Stars", s, "badges/stars.svg")

    git_commit_push()

if __name__ == "__main__":
    main()
