# AquaRev Engineering landing page — Deployment

First-touch page for hotel engineers and sub-contractors who have been introduced to
AquaRev by their GM or management company. Lives at **www.aquarevwater.us/engineering**
(Webflow). Same split-deploy pattern as the Specifications, Data and Certification pages:
CSS + JS hosted on GitHub Pages, a short embed pasted into Webflow, every style scoped
under `#aren`.

## Page outline

Deliberately short and styled like Step 1 (Briefing) of the Engineer Portal (Bebas Neue,
DM Sans, navy cards, green "go" band). Detailed instruction lives in the portal's help, the
video and the Specifications pages, not here.

1. Introduction card: title, welcome lede, guide video, four "what we need" cards
2. Recommended band: Open the Engineer Portal, Request portal access (mailto with template)
3. Direct submission band: Download submission guide (pump room pop-up), Email a summary, Copy email template
4. Resources: Specifications, Drawings, Technology & Data, Certifications, Submission Guide, contact

## Files

| File | Role |
|---|---|
| `AquaRev_Engineering_Page.html` | Master. The only file you edit. Opens on its own in a browser. |
| `img/` | Video poster frame (from the v6 video). |
| `build.sh` | Generates everything below from the master. |
| `engineering.css`, `engineering.js` | Generated. Hosted on GitHub Pages. |
| `webflow-embed-engineering.html` | Generated. Paste into the Webflow Embed on `/engineering`. |
| `preview.html` | Generated. Mirrors the embed locally (images load once pushed). |
| `docs/src/AquaRev_Direct_Submission_Guide.html` | Master for the submission guide PDF. `?rooms=N` adds N Pump Room Profile pages. |
| `docs/render.sh` | Renders the ten PDFs (`AquaRev_Submission_Guide_N_Pump_Room(s).pdf`, N = 1–10) with headless Chrome. |

## Submission guide PDFs

Page 1 is the guide (what we need, sizing reference with metric equivalents, how to send),
page 2 is property & contact, then one Pump Room Profile per pump room (three bodies of
water each). Every page ends with a Notes section. On the site, "Download submission guide"
opens a pop-up asking how many pump rooms (1–10) and downloads the matching file. After
editing the master, run `docs/render.sh`, then rebuild and push.

## Turning the video on

In the master's `<script>`, set `GUIDE.youtubeId` to the YouTube id, rebuild and push. The
button then reads "Watch the guide" and plays the video in place. With no id set, it reads
"Video publishing soon".

## GitHub Pages

- Repo: `jeffatley-web/aquarev_engineering` (public), Pages source `main` branch, root.
- Push `engineering.css`, `engineering.js`, `img/` and `docs/*.pdf`.

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
