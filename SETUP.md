# Setup & Deployment

This portfolio is a **plain HTML/CSS site with no build step**. Deploying it to GitHub Pages takes 5 minutes.

---

## 1. Before you push — personalize placeholders

Open these files and replace the placeholder text with your real information:

### `index.html`

Search for and replace:
- `your.email@example.com` → your real email address
- `linkedin.com/in/your-handle` → your LinkedIn URL (in 2 places)
- `your-username` → your GitHub username (in the GitHub link)
- `omar-abdeljalil.github.io/portfolio` → your actual Pages URL (in one place)

### `README.md`

Same replacements as above:
- `your.email@example.com`
- `linkedin.com/in/your-handle`
- `your-username.github.io/portfolio` → your actual Pages URL

---

## 2. Create the GitHub repo & push

You have **two options** for hosting:

### Option A — Project site (recommended if you want a portfolio URL like `username.github.io/portfolio`)

```bash
# From inside this folder
git init
git add .
git commit -m "Initial portfolio commit"
git branch -M main
git remote add origin https://github.com/<your-username>/portfolio.git
git push -u origin main
```

Then on GitHub:
1. Go to your repo's **Settings → Pages**
2. Under **"Build and deployment"**, set **Source** to `Deploy from a branch`
3. Set **Branch** to `main` and folder to `/ (root)`
4. Click **Save**
5. Wait ~1 minute — your site will be live at `https://<your-username>.github.io/portfolio/`

### Option B — User site (URL is just `username.github.io`)

Same steps, but name the repo exactly `<your-username>.github.io`. The site will live at that root URL.

---

## 3. Add more files to a project

Each project folder is set up to hold additional artifacts. For example, to add your Python code and Excel file to the Aramex project:

```bash
# Drop your files into the right folder
cp ~/Downloads/aramex_optimization.py projects/02-aramex-drone-optimization/
cp ~/Downloads/aramex_model.xlsx projects/02-aramex-drone-optimization/

# Commit and push
git add projects/02-aramex-drone-optimization/
git commit -m "Add Aramex source code and Excel model"
git push
```

The site updates automatically within ~1 minute of each push.

### Suggested files to add per project

| Project | Files you might have |
|---------|---------------------|
| 01 · DES production systems | AnyLogic model files (`.alp`), Excel results tables, Python plotting scripts |
| 02 · Aramex drones | Python source (`.py`), Excel model (`.xlsx`), input CSVs |
| 03 · Nabil MSE | Odoo BOM exports, MS Project schedule (`.mpp`), VSM diagrams (PNG) |
| 04 · Jada Lean | VSM diagrams (current + future), OEE calculations, process chart photos |
| 05 · Fever bracelet | Meeting agendas & MOMs, BMC/risk-register spreadsheets, supply-chain diagrams |
| 06 · Data analytics | Raw CSVs, Power BI dashboard (`.pbix`), Python scripts (`.py`), SQL scripts (`.sql`) |
| 07 · Financial analysis | Excel model with all ratios, source financial statements PDFs |

---

## 4. Optional — custom domain

If you own a domain (e.g. `omarabdeljalil.com`) and want to use it:

1. In your repo, create a file called `CNAME` containing just your domain name (no `https://`, no path)
2. In your DNS provider, add:
   - An `A` record pointing to GitHub's IPs: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - Or a `CNAME` record pointing to `<your-username>.github.io`
3. In GitHub Settings → Pages, enter your custom domain and save
4. Enable "Enforce HTTPS" once the certificate provisions (~10 min)

---

## 5. Local preview (optional)

To preview locally before pushing:

```bash
cd portfolio
python3 -m http.server 8000
```

Then open `http://localhost:8000` in your browser.

---

## Notes

- **No frameworks, no `npm install`.** Just HTML + CSS + one Google Fonts request.
- **Fully responsive** down to mobile.
- **Respects `prefers-reduced-motion`** for accessibility.
- **DOCX reports** will download rather than preview in-browser — this is expected. If you want in-browser preview, convert them to PDF (e.g., Word → Save As PDF, or `libreoffice --headless --convert-to pdf report.docx`).
