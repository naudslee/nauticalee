# nauticalee.com

Site for Nautica Lee Consulting. Two pages, plain HTML and CSS, no build tooling.

## Files

| Path | Purpose |
| --- | --- |
| `index.html`, `contact.html` | The published pages. Generated, do not edit directly. |
| `_src/index.body.html`, `_src/contact.body.html` | Page content. Edit these. |
| `_src/head.html`, `_src/foot.html` | Shared letterhead and footer |
| `assets/styles.css` | All styling. Colors are variables at the top. |
| `assets/brand/` | The two logo files and the bouquet cut from them |
| `build.sh` | Stitches `_src` into the root pages |
| `CNAME` | Custom domain for GitHub Pages |

After editing anything in `_src/`, run `./build.sh`.

## Contact form

The form posts to Formspree (form ID `mljjopwy`), which emails each submission to nautica@nauticalee.com. Manage it at formspree.io.

## Deploying

GitHub Pages: Settings, Pages, deploy from branch `main`, folder root. Point nauticalee.com DNS at GitHub Pages (A records plus a `www` CNAME). Netlify or Vercel: connect the repo, no build command, publish directory `/`.

## Notes

- The site is served by GitHub Pages from the `main` branch.
