# senglin.github.io

Personal website built with Jekyll and hosted on GitHub Pages.

## Overview

This repository contains the source code for a Jekyll-based static website. The site uses a custom theme and is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

## Prerequisites

Choose one of the following options:

### Option A: VS Code Dev Container (Recommended)

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) or Docker Engine
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Option B: Local Setup

- Ruby 3.0 or higher
- Bundler gem (`gem install bundler`)
- Git

## Getting Started

### Option A: Using VS Code Dev Container (Recommended)

The repository includes a pre-configured development container with all necessary tools (Ruby, Bundler, Jekyll, and dependencies) already set up.

#### First-time Setup:

1. **Install Prerequisites:**
   - Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
   - Install [VS Code](https://code.visualstudio.com/)
   - Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Clone the Repository:**
   ```bash
   git clone git@github.com:senglin/senglin.github.io.git
   cd senglin.github.io
   ```

3. **Open in Dev Container:**
   - Open VS Code
   - Press `F1` or `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
   - Type and select: **Dev Containers: Open Folder in Container...**
   - Select the `senglin.github.io` folder
   - Wait for the container to build (first time takes a few minutes)

4. **Install Dependencies:**
   ```bash
   make install
   ```

5. **Start Development Server:**
   ```bash
   make serve
   ```

   The site will be available at `http://localhost:4000`

#### Features Included in Dev Container:

- **Alpine Linux 3.20** base image with Ruby 3.3.8
- **SSH key sharing** from host (for Git operations)
- **VS Code extensions:**
  - Docker support
  - JSON tools
  - Git Graph
  - Data preview tools
- **Pre-configured Bundler** for local gem installation
- **Port forwarding** for Jekyll server (port 4000)

#### Tips:

- The dev container mounts your SSH keys from `~/.ssh`, so you can use Git with SSH without additional setup
- Test SSH access: `ssh -T git@github.com`
- All gems are installed in `vendor/bundle` to avoid permission issues
- The container persists between sessions - no need to reinstall dependencies

### Option B: Local Setup

1. **Clone the Repository:**
   ```bash
   git clone git@github.com:senglin/senglin.github.io.git
   cd senglin.github.io
   ```

2. **Install Dependencies:**
   ```bash
   make install
   ```

3. **Start Development Server:**
   ```bash
   make serve
   ```

   The site will be available at `http://localhost:4000`

## Available Commands

The repository includes a `Makefile` with convenient shortcuts:

### Setup & Development:
- `make install` - Install dependencies with local bundler config
- `make serve` - Start development server at http://localhost:4000
- `make dev` - Start server with live reload enabled

### Build & Deploy:
- `make build` - Build site for production (output in `_site/`)
- `make clean` - Clean generated files and caches
- `make deploy` - Show deployment instructions

### Utilities:
- `make start` - Start server and open in browser
- `make open` - Open site in browser
- `make help` - Show all available commands

### Direct Commands:

If you prefer not to use the Makefile, you can run commands directly:

```bash
# Install dependencies
bundle config set --local path 'vendor/bundle'
bundle install

# Start development server
bundle exec jekyll serve --host 0.0.0.0

# Build for production
JEKYLL_ENV=production bundle exec jekyll build
```

## Project Structure

```
.
├── .devcontainer/       # VS Code dev container configuration
├── _includes/           # Reusable HTML components
├── _layouts/            # Page templates
├── _site/              # Generated site (not committed)
├── assets/             # CSS, JavaScript, images
├── vendor/             # Bundler gems (not committed)
├── _config.yml         # Jekyll configuration
├── Gemfile             # Ruby dependencies
├── Makefile            # Build automation shortcuts
└── index.html          # Homepage
```

## Deployment to GitHub Pages

This site automatically deploys to GitHub Pages when you push changes to the `main` branch.

### Deployment Steps:

1. **Make your changes** and test locally:
   ```bash
   make serve
   ```

2. **Commit your changes:**
   ```bash
   git add .
   git commit -m "Update site content"
   ```

3. **Push to GitHub:**
   ```bash
   git push origin main
   ```

4. **Wait for deployment:**
   - GitHub Actions will automatically build and deploy your site
   - Check the "Actions" tab in your GitHub repository for build status
   - Site will be live at: `https://senglin.github.io`

### GitHub Pages Configuration:

- **Source Branch:** `main`
- **Build:** GitHub Actions automatically builds Jekyll sites
- **Custom Domain:** Configure in repository settings if desired

### Troubleshooting Deployment:

- Check the "Actions" tab for build errors
- Ensure `_config.yml` is properly configured
- Verify all dependencies are listed in `Gemfile`
- Test production build locally: `make build`

## Configuration

Site configuration is in `_config.yml`. Key settings:

- `title` - Site title
- `description` - Site description
- `baseurl` - Subpath (if not root domain)
- `url` - Full site URL
- Social media links and user information

After changing `_config.yml`, restart the development server.

## Troubleshooting

### Bundle Install Errors

If you encounter permission errors during `bundle install`, the Makefile automatically configures Bundler to install gems locally:

```bash
make install
```

This sets up gems in `vendor/bundle` to avoid system-wide installation issues.

### Jekyll Server Not Starting

1. Ensure all dependencies are installed: `make install`
2. Clean generated files: `make clean`
3. Try starting again: `make serve`

### Port Already in Use

If port 4000 is already in use, you can specify a different port:

```bash
bundle exec jekyll serve --host 0.0.0.0 --port 4001
```

### Dev Container Issues

- **Container won't build:** Ensure Docker is running
- **SSH keys not working:** Check that `~/.ssh` exists on your host
- **Port not forwarding:** Check VS Code's "Ports" panel and manually forward port 4000

## Contributing

This is a personal website repository. If you're not the owner and found a bug, please open an issue.

## License

See [LICENSE](LICENSE) file for details.

## Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Liquid Template Language](https://shopify.github.io/liquid/)
- [Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
