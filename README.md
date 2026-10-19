# AquaRev Engineering landing page — Deployment

First-touch page for hotel engineers and sub-contractors who have been introduced to
AquaRev by their GM or management company. Lives at **www.aquarevwater.us/engineering**
(Webflow). Same split-deploy pattern as the Specifications, Data and Certification pages:
CSS + JS hosted on GitHub Pages, a short embed pasted into Webflow, every style scoped
under `#aren`.

## Page outline

1. Hero + Pump Room Specifications Guide (video placeholder until the video is published)
2. Why you're here
3. What we need (three things per pool, plus walkthrough video and three notes) + field checklist
4. How to capture it (five steps, same order as the video and the portal)
5. How to send it (Engineer Portal, or a direct email summary)
6. References (/specifications, /drawings, /data)
7. FAQ + contact band

## Files

| File | Role |
|---|---|
| `AquaRev_Engineering_Page.html` | Master. The only file you edit. Opens on its own in a browser. |
| `img/` | Poster frame (from the v6 video) and three compressed pump-room photos. |
| `build.sh` | Generates everything below from the master. |
| `engineering.css`, `engineering.js` | Generated. Hosted on GitHub Pages. |
| `webflow-embed-engineering.html` | Generated. Paste into the Webflow Embed on `/engineering`. |
| `preview.html` | Generated. Mirrors the embed locally (images load once pushed). |

## Turning the video on

In the master's `<script>`, set `GUIDE.youtubeId` to the YouTube id. Optionally fill
`GUIDE.chapters` with six start times in seconds (walkthrough, find the return, size it,
count & label, extras, send it); the chapter buttons then jump into the video. Rebuild and push.
With no id set, the page shows "Video publishing soon" and the chapter buttons scroll to
the written steps instead.

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
