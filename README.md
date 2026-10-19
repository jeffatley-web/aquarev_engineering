# AquaRev Engineering landing page — Deployment

First-touch page for hotel engineers and sub-contractors who have been introduced to
AquaRev by their GM or management company. Lives at **www.aquarevwater.us/engineering**
(Webflow). Same split-deploy pattern as the Specifications, Data and Certification pages:
CSS + JS hosted on GitHub Pages, a short embed pasted into Webflow, every style scoped
under `#aren`.

## Page outline

Deliberately short, like Step 1 (Briefing) of the Engineer Portal. Detailed instruction lives
in the portal's help, the video and the Specifications pages, not here.

1. Welcome heading + one-sentence lede
2. Pump Room Specifications Guide (video placeholder until the video is published)
3. What we need from you: four cards (walk the pump room, confirm each pool, size the returns, send it)
4. Ready to start: Engineer Portal (primary), Email AquaRev, phone
5. Reference links: /specifications, /drawings, /data

## Files

| File | Role |
|---|---|
| `AquaRev_Engineering_Page.html` | Master. The only file you edit. Opens on its own in a browser. |
| `img/` | Video poster frame (from the v6 video). |
| `build.sh` | Generates everything below from the master. |
| `engineering.css`, `engineering.js` | Generated. Hosted on GitHub Pages. |
| `webflow-embed-engineering.html` | Generated. Paste into the Webflow Embed on `/engineering`. |
| `preview.html` | Generated. Mirrors the embed locally (images load once pushed). |

## Turning the video on

In the master's `<script>`, set `GUIDE.youtubeId` to the YouTube id, rebuild and push. The
button then reads "Watch the guide" and plays the video in place. With no id set, it reads
"Video publishing soon".

## GitHub Pages

- Repo: `jeffatley-web/aquarev_engineering` (public), Pages source `main` branch, root.
- Push `engineering.css`, `engineering.js` and `img/`.

## Update workflow

```bash
cd "/Users/jatley/Documents/Jeff Atley/Aquarev Water /Marketing/Website/Engineering"
./build.sh
git add -A
git commit -m "Update engineering page"
git push
```

`build.sh` stamps a fresh `?v=` cache buster into the embed each run. Re-paste the embed into
Webflow when you want browsers to pick up a change immediately.
