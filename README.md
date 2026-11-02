# nauticalee.com

Static marketing site for Nauticalee: social media, email, media kits, brand building, marketing and client management.

No framework, no build tooling. Plain HTML, CSS and a little JavaScript.

## Files

| Path | Purpose |
| --- | --- |
| `index.html`, `services.html`, `about.html`, `contact.html` | The published pages (generated, don't edit directly) |
| `_src/*.body.html` | Page content. Edit these. |
| `_src/head.html`, `_src/foot.html` | Shared header, nav and footer |
| `assets/styles.css` | All styling. Colors are CSS variables at the top. |
| `assets/script.js` | Mobile nav, scroll reveal, theme preview |
| `build.sh` | Stitches `_src` into the root HTML files |
| `CNAME` | Custom domain for GitHub Pages |

After editing anything in `_src/`, run `./build.sh` to regenerate the pages.

## Changing the color theme

Open `assets/styles.css`. The first `:root` block holds the sage palette. Change those values and every page updates.

To preview the two alternate palettes that ship with the site, add a query string to any page:

- `index.html?theme=navy` (deep navy and gold)
- `index.html?theme=blush` (dusty rose and sage)

To make one of them the default, copy its values into the first `:root` block.

## Contact form

The form on `contact.html` posts to Formspree. Create a free form at formspree.io, then replace `YOUR_FORM_ID` in `_src/contact.body.html` and rebuild. Netlify Forms, Basin or any other endpoint also work.

## Deploying

**GitHub Pages:** Settings → Pages → Deploy from branch → `main` / root. Point the `nauticalee.com` DNS at GitHub Pages (A records to GitHub's IPs plus a `www` CNAME). The `CNAME` file is already in place.

**Netlify or Vercel:** connect the repo, leave the build command empty, publish directory `/`.

## To do before launch

- Replace the placeholder photo blocks (the green gradient squares) with real photos
- Swap the three placeholder testimonials for real ones
- Update social links in `_src/foot.html` and `_src/contact.body.html`
- Add the Formspree ID
