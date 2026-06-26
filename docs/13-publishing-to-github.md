# 13. Publishing to GitHub

## Goal

Publish the guide cleanly without accidentally uploading large/proprietary firmware or private backups.

## Recommended Repository Name

```text
matepad11-dby-w09-china-rom-root-wps-guide
```

## Before Publishing

Check that you are not uploading:

- full EDL backups,
- original OEMINFO,
- converted OEMINFO unless you are sure it is safe to share,
- Huawei firmware ZIP files,
- paid tools,
- cracked tools,
- personal serial numbers,
- screenshots showing private account data.

## Safe to Include

Usually safe:

- Markdown guide files,
- screenshots with private data removed,
- your own APatch module,
- helper PowerShell scripts,
- file manifest template,
- hashes/checksum list,
- links to original source threads.

## Suggested Git Commands

From the guide folder:

```powershell
git init
git add README.md docs assets scripts modules .gitignore
git status
git commit -m "Initial DBY-W09 China ROM root WPS guide"
```

Then create an empty GitHub repo and push:

```powershell
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/matepad11-dby-w09-china-rom-root-wps-guide.git
git push -u origin main
```

## GitHub Release

If you want to provide the WPS APatch module as a download, the cleanest method is:

1. Keep the module ZIP in `modules/` if it is yours.
2. Also attach it to a GitHub Release.
3. Write its SHA256 hash in `docs/file-manifest-template.md`.

## Optional GitHub Pages

For a simple documentation website, GitHub can render Markdown directly.

If you later want a nicer docs site, use MkDocs Material:

```text
README.md
docs/
mkdocs.yml
```

Do this later after the Markdown guide is reviewed and stable.

