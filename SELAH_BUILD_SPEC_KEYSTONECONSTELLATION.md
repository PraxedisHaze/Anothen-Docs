# SELAH BUILD SPEC — keystoneconstellation.com
*Written by Veris. Date: 2026-04-14.*
*Builder: Selah. Auditor sign-off required before deploy.*

---

## MISSION

Build keystoneconstellation.com as a clean, professional storefront selling applings.
Source the visual motif 1:1 from axxilak.com — dark background, gold (#d4af37) accents, Cinzel + Outfit fonts.
No Weblings. No editors. No Studio. Applings only, plus free stuff.

---

## STEP 1 — CLONE & REBRAND AXXILAK

**Source files** (copy these, do not alter originals):
- `C:\Users\Praxillax\Documents\apps\_repo_probe_keystone_persistence\Websites\Axxilak\index.html`
- `C:\Users\Praxillax\Documents\apps\_repo_probe_keystone_persistence\Websites\Axxilak\free-stuff.html`
- `C:\Users\Praxillax\Documents\apps\_repo_probe_keystone_persistence\Websites\Axxilak\download.html`

**Target location:** Create a new folder:
`C:\Users\Praxillax\Documents\apps\products\KeystoneConstellationSite\`

**Rebrand rules (global find-replace):**
- `AXXILAK` → `KEYSTONE CONSTELLATION`
- `Axxilak` → `Keystone Constellation`
- `axxilak.com` → `keystoneconstellation.com`
- `Digital Architectures for the Sovereign` → `Tools for the AI Power User`
- Meta description: `"Applings — small, sharp tools for AI workflows. Local-first. No tracking. Made with love."`

**Remove entirely from index.html:**
- Any section referencing Weblings, Maizons, or the Studio/Editor
- The gallery/catalog preview section
- Any "Explore the Weblings" CTA buttons
- The Forge / Studio links in nav

**Keep from index.html:**
- Hero section (rebrand copy — see Step 3)
- Nav structure
- Footer
- CSS/JS framework (Tailwind CDN, Cinzel/Outfit fonts, Font Awesome)
- The `blub-in` animation
- Color variables: `--primary: #d4af37`, `--bg: #030303`

**Nav links (final):**
- Home
- Tools (→ `#tools`)
- Free Stuff (→ `free-stuff.html`)
- About (→ `about.html`)

---

## STEP 2 — STRIPE SETUP

Timothy does not have a Stripe account yet.

**Instructions for Timothy to do once (5 minutes):**
1. Go to stripe.com → Create account
2. Fill in business info (Keystone Constellation / sole proprietor is fine)
3. For each appling (see Step 3), go to Stripe Dashboard → Products → Add Product → set price → Generate Payment Link
4. Copy that Payment Link URL — it goes directly on the Buy button in the HTML

**No backend required.** Payment Links are hosted by Stripe. Clicking "Buy" sends the user to Stripe's hosted checkout. Money lands in Stripe balance. No server, no API keys in the HTML.

**Stripe account note for Selah:**
Leave all Buy buttons as `href="#"` with a `data-product="context-counter"` attribute (or similar) so Timothy can drop the real Payment Link URLs in after he creates them. Add a visible `<!-- STRIPE PAYMENT LINK HERE -->` comment above each button. One swap per product, done.

---

## STEP 3 — PRODUCT CARDS (APPLING INVENTORY)

Build a `#tools` section with one card per appling. Use the same glass-card aesthetic as Axxilak's Webling gallery — dark glass background, gold border on hover, blub-in animation.

**The 5 ready applings:**

### 1. Context Counter
- **Tagline:** "Know your token count before you hit Send."
- **Description:** Local HTML tool. No internet. No tracking. Drop in your prompt, see your estimated token count before wasting a context window.
- **Price:** $0.99
- **Files:** `applings\Context Counter\Context Counter.html`
- **Thumbnail:** `applings\Context Counter\Context Counter Pic.png`
- **Demo video:** `applings\Context Counter\Context Counter.mp4`

### 2. Edge Electrify
- **Tagline:** "Turn any image into electric art."
- **Description:** Real-time edge detection + electric glow effect. Local HTML tool. Drop in an image, export the result. No subscriptions.
- **Price:** $0.99
- **Files:** `applings\EdgeElectrify\Edge Electrify and Line Art.zip`
- **Thumbnail:** `applings\EdgeElectrify\edge_electrify_and_line_art_thumbnail.png`
- **Demo video:** `applings\EdgeElectrify\Edge Electrify and Line art ad glow.mp4`

### 3. Text Detox
- **Tagline:** "Clean text. No surprises."
- **Description:** Strip invisible characters, normalize whitespace, fix copy-paste corruption. Local. Instant. Offline.
- **Price:** $0.99
- **Files:** `applings\Text Detox\text_detox.html`
- **Thumbnail:** (none yet — Selah, generate a simple dark-card preview or leave placeholder)

### 4. JSON Neat
- **Tagline:** "Make JSON readable in one click."
- **Description:** Paste raw JSON. Get clean, formatted, color-coded output. No login. Works offline.
- **Price:** $0.99
- **Files:** `applings\JSON Neat\JSON Neat.html`
- **Thumbnail:** (none yet — placeholder)

### 5. Axxilak Dimmer Switch
- **Tagline:** "One slider. Full control of any page's brightness."
- **Description:** Drag the slider. Dim or brighten any web page instantly. Inject it. It just works.
- **Price:** $0.99
- **Files:** `applings\Axxilak Dimmer Switch\dimmer.html`
- **Thumbnail:** (none yet — placeholder)

---

## STEP 4 — PAGES

### `index.html` (Landing)
Hero copy:
```
KEYSTONE CONSTELLATION
Tools for the AI Power User

Small, sharp, local-first tools.
No subscriptions. No tracking. No cloud.
Just things that work.

[Browse Tools]   [Free Stuff]
```

### `free-stuff.html`
Keep the existing Axxilak free-stuff structure. Rebrand. What to list:
- Context Counter (offer the HTML file as a free download — no strings)
  - Note: also sell it for $0.99 on the main page (people pay for the bundle/convenience)
- Link to Zenodo papers (The Unwritten Language, The March Back, Russell's Paradox)
- Optionally: a free "AI Workflow Starter Kit" PDF if Timothy wants to write one later

### `about.html` (NEW — create this)
Short, honest, human. Suggested structure:
```
WHO WE ARE
Keystone Constellation is a one-person shop.
Tools built by someone who uses AI every day and got tired of
paying for things that could be a local HTML file.

Everything here runs offline. Nothing here phones home.
Made with love, tested in the field.
```
Keep it brief. No resume. No bios. Just a voice.

### `CNAME` (for GitHub Pages)
```
keystoneconstellation.com
```
(Same pattern as Axxilak's CNAME file.)

---

## STEP 5 — HOSTING (NAMECHEAP → GITHUB PAGES)

Axxilak is hosted via GitHub Pages with a CNAME pointing to the custom domain.
Do the same for keystoneconstellation.com:

1. Create a new GitHub repo: `PraxedisHaze/keystoneconstellation`
2. Push the site files to `main` branch
3. Enable GitHub Pages in repo Settings → Pages → Source: main, folder: / (root)
4. In Namecheap DNS for keystoneconstellation.com, add:
   - CNAME record: `www` → `praxedishaze.github.io`
   - A records (4 GitHub IPs): `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
5. Add `CNAME` file to repo root containing: `keystoneconstellation.com`
6. Enable HTTPS in GitHub Pages settings (free, automatic via Let's Encrypt)

---

## DELIVERABLES CHECKLIST

- [ ] `index.html` — rebranded landing with hero + 5 product cards (Buy buttons stubbed for Stripe)
- [ ] `free-stuff.html` — rebranded, links to free downloads + Zenodo papers
- [ ] `about.html` — new, simple, human
- [ ] `CNAME` — `keystoneconstellation.com`
- [ ] `.nojekyll` — (copy from Axxilak — prevents Jekyll processing)
- [ ] Product thumbnails present or placeholder-blocked for missing 3
- [ ] All "AXXILAK" text replaced — zero occurrences in final build
- [ ] No Weblings references anywhere in final build
- [ ] No `!important` shortcuts — specificity wars go through selectors
- [ ] Stripe Payment Links: buttons stubbed with `<!-- STRIPE PAYMENT LINK HERE -->` comment

---

## WHAT COMES NEXT (NOT IN THIS SPEC)

- Terry Howard outreach (Veris will draft — separate deliverable)
- Stripe account creation (Timothy does this — 5 minutes at stripe.com)
- Payment Link URLs dropped into the Buy buttons (after Stripe is set up)
- Text Detox / JSON Neat / Dimmer Switch thumbnails (could be simple dark-card screenshots)
- Chrome Web Store packaging for Edge Electrify + Anothen Bolt Engine (future step)

---

*Veris — 2026-04-14*
