# Setting Up LaTeX on VSCode

## 1. Install a LaTeX distribution

### macOS
```bash
brew install --cask mactex
```
Or download the full installer from [tug.org/mactex](https://tug.org/mactex/).

### Windows
Download and install **MiKTeX** from [miktex.org](https://miktex.org/download)  
or **TeX Live** from [tug.org/texlive](https://tug.org/texlive/).

### Linux (Ubuntu/Debian)
```bash
sudo apt-get install texlive-full
```

### Amazon Linux / RHEL
```bash
sudo dnf install texlive-scheme-full
```

---

## 2. Install the LaTeX Workshop extension in VSCode

1. Open VSCode
2. Go to **Extensions** (`Ctrl+Shift+X` / `Cmd+Shift+X`)
3. Search for **LaTeX Workshop** (by James Yu)
4. Click **Install**

---

## 3. Configure LaTeX Workshop

Open VSCode settings (`Ctrl+,` / `Cmd+,`), click **Open Settings (JSON)**, and add:

```json
"latex-workshop.latex.tools": [
  {
    "name": "pdflatex",
    "command": "pdflatex",
    "args": [
      "-interaction=nonstopmode",
      "-output-directory=build",
      "%DOC%"
    ]
  }
],
"latex-workshop.latex.recipes": [
  {
    "name": "pdflatex × 2",
    "tools": ["pdflatex", "pdflatex"]
  }
],
"latex-workshop.latex.outDir": "build",
"latex-workshop.view.pdf.viewer": "tab"
```

> **Note:** the `build/` output directory must exist before compiling.  
> Create it once with `mkdir -p build`.

---

## 4. Compile

- **Auto-compile on save**: enabled by default in LaTeX Workshop.
- **Manual compile**: `Ctrl+Alt+B` / `Cmd+Alt+B`, or click the green ▶ button in the top-right.
- **View PDF**: `Ctrl+Alt+V` / `Cmd+Alt+V` opens the PDF preview tab.

### Alternative: use the provided script
```bash
mkdir -p build
bash compile.sh
```
Output: `presentation.pdf` in the project root.

---

## 5. Required LaTeX packages

This presentation uses the following packages — all included in a full TeX Live / MacTeX install:

| Package | Purpose |
|---|---|
| `beamer` | Presentation class |
| `tikz` | Diagrams and arrows |
| `booktabs` | Professional tables |
| `multirow` | Multi-row table cells |
| `amsmath` / `amssymb` | Math symbols |
| `graphicx` | Images |
| `tabularx` / `makecell` / `array` | Table utilities |

If using a minimal TeX Live install, add missing packages with:
```bash
# TeX Live
tlmgr install beamer tikz booktabs multirow

# MiKTeX (Windows) — packages install automatically on first compile
```
