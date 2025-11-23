# Seng Lin Shee's Personal Website

A personal website built with Jekyll using the Forty theme, hosted on GitHub Pages.

## Prerequisites

- Ruby 3.3+
- Bundler
- Git

**OR** use the included VS Code Dev Container (recommended):
- [Docker](https://www.docker.com/products/docker-desktop)
- [VS Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Quick Start

### Option A: Using Dev Container (Recommended)

This repository includes a pre-configured development environment using VS Code Dev Containers.

1. **Install prerequisites:**
   - Docker Desktop
   - VS Code with Dev Containers extension

2. **Open in Dev Container:**
   ```bash
   # Clone the repository
   git clone https://github.com/senglin/senglin.github.io.git
   cd senglin.github.io
   
   # Open in VS Code
   code .
   ```

3. **When prompted**, click "Reopen in Container" (or run command: `Dev Containers: Reopen in Container`)

4. **Wait for container to build** (first time only, ~2-3 minutes)

5. **Start development:**
   ```bash
   make install
   make serve
   ```

The Dev Container includes:
- ✅ Alpine Linux 3.20
- ✅ Ruby 3.3 pre-installed
- ✅ Jekyll and dependencies
- ✅ SSH key sharing from host
- ✅ Recommended VS Code extensions (Docker, Git Graph, JSON tools)
- ✅ Pre-configured terminal fonts

### Option B: Local Setup

If you prefer to work without Docker:

```bash
# First time setup
make install

# Start development server
make serve

# Or with live reload
make dev
```

## Detailed Setup

### Using Dev Container

The `.devcontainer/` configuration provides a consistent development environment across all platforms.

**What's included:**
- Base image: `mcr.microsoft.com/devcontainers/base:alpine-3.20`
- Ruby 3.3.8 with development headers
- Build tools pre-installed
- SSH agent forwarding for Git operations
- Port 4000 automatically forwarded for Jekyll server

**Customizations:**
- Edit `.devcontainer/devcontainer.json` to add more VS Code extensions
- Modify `postCreateCommand` to run setup automatically
- Add additional Alpine packages via `apk add`

**Working with SSH keys:**
The container automatically mounts your host SSH keys, so you can push/pull from GitHub without additional setup.

### Local Installation

### 1. Clone the Repository

```bash
git clone https://github.com/senglin/senglin.github.io.git
cd senglin.github.io
```

### 2. Install Dependencies

```bash
make install
```

Or manually:
```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

This will install Jekyll and all required plugins into the `vendor/bundle` directory.

### 3. Configure the Site

Edit `_config.yml` to customize:
- Site title, subtitle, and description
- Contact information
- Social media links
- Base URL settings

## Local Development

### Available Commands

```bash
make install     # Install dependencies
make serve       # Start development server
make dev         # Start server with live reload
make build       # Build for production
make clean       # Clean generated files
make start       # Start server and open in browser
make open        # Open site in browser
make new-post    # Create a new blog post
make new-page    # Create a new page
make deploy      # Show deployment instructions
make help        # Show all available commands
```

### Start the Development Server

```bash
make serve
```

Or manually:
```bash
bundle exec jekyll serve --host 0.0.0.0
```

The site will be available at:
- Local: `http://localhost:4000`
- Network: `http://0.0.0.0:4000`

Jekyll will automatically regenerate pages when you make changes. Refresh your browser to see updates.

### Build Only (Without Server)

```bash
make build
```

Or manually:
```bash
bundle exec jekyll build
```

The generated site will be in the `_site` directory.

## Creating Content

### Create a New Page

Quick way:
```bash
make new-page
```

Or manually:
1. Create a new Markdown file in the root directory (e.g., `about.md`)
2. Add front matter at the top:

```yaml
---
layout: page
title: About Me
description: Learn more about my background
image: assets/images/pic01.jpg
nav-menu: true
---

Your content here...
```

### Create a New Blog Post

Quick way:
```bash
make new-post
```

Or manually:
1. Create a new file in the `_posts` directory
2. Name it following the pattern: `YYYY-MM-DD-title.md` (e.g., `2025-11-23-my-first-post.md`)
3. Add front matter:

```yaml
---
layout: post
title: My First Post
description: A brief description of the post
image: assets/images/pic02.jpg
---

Your post content here...
```

### Front Matter Options

- `layout`: Choose from `page`, `post`, `landing`, `allposts`, or `home`
- `title`: Page/post title
- `description`: Brief description (used in meta tags and tiles)
- `image`: Featured image path (relative to site root)
- `nav-menu`: Set to `true` to include in navigation menu
- `show_tile`: Set to `false` to hide from homepage tiles

## Deployment to GitHub Pages

### Automatic Deployment

This repository is configured for automatic deployment to GitHub Pages.

Quick deploy:
```bash
git add .
git commit -m "Update site content"
git push origin main
```

Or get deployment instructions:
```bash
make deploy
```

**GitHub Pages builds automatically** from the `main` branch and your site will be live at: `https://senglin.github.io`

### GitHub Pages Settings

1. Go to your repository on GitHub
2. Navigate to **Settings** > **Pages**
3. Ensure the following settings:
   - **Source**: Deploy from a branch
   - **Branch**: `main` / `(root)`
   - **Custom domain** (optional): Configure if you have one

### First-Time Deployment

If this is your first deployment:

1. Make sure your repository is named `<username>.github.io` (e.g., `senglin.github.io`)
2. Push your changes to the `main` branch
3. Wait a few minutes for GitHub to build and deploy
4. Visit `https://<username>.github.io` to see your site

### Deployment Notes

- GitHub Pages automatically runs Jekyll build on push
- No need to commit the `_site` directory (it's in `.gitignore`)
- The `vendor` and `.bundle` directories are excluded from Jekyll processing
- Build times typically take 1-2 minutes

## Project Structure

```
.
├── _config.yml           # Jekyll configuration
├── _includes/            # Reusable page components
├── _layouts/             # Page templates
├── _posts/               # Blog posts
├── _sass/                # Sass stylesheets
├── assets/               # Images, CSS, JavaScript, fonts
├── index.md              # Homepage
├── landing.md            # Landing page example
├── generic.md            # Generic page example
├── elements.md           # UI elements showcase
├── all_posts.md          # Blog archive
└── vendor/               # Local gem dependencies (ignored by git)
```

## Customization

### Homepage Tiles

Edit `_config.yml` to control homepage tiles:

```yaml
tiles-source: pages  # 'pages' or 'posts'
tiles-count: 6       # Number of tiles to display
```

### Styling

- Main styles: `assets/css/main.scss`
- Component styles: `_sass/components/`
- Layout styles: `_sass/layout/`

### Images

Replace images in `assets/images/` with your own:
- `banner.jpg` - Homepage banner
- `pic01.jpg` through `pic11.jpg` - Page/post featured images

## Troubleshooting

### Jekyll Won't Start

If Jekyll hangs on startup, try:
- Disable problematic plugins in `_config.yml`
- Run with `--skip-initial-build` flag
- Check Ruby version compatibility

### Build Errors

```bash
# Clear cached files
rm -rf _site .jekyll-cache

# Rebuild
bundle exec jekyll build
```

### Permission Errors

If you see permission errors during `bundle install`:
```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

## Credits

- **Theme**: [Forty Jekyll Theme](https://github.com/andrewbanchich/forty-jekyll-theme) by Andrew Banchich
- **Original Design**: [HTML5 UP](https://html5up.net)
- **License**: Creative Commons

## License

See LICENSE.md for details.
