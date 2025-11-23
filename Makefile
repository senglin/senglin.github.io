.PHONY: install serve build clean deploy start open new-post new-page help

# Default target
.DEFAULT_GOAL := help

# Install dependencies
install:
	@echo "📦 Installing dependencies..."
	bundle config set --local path 'vendor/bundle'
	bundle install
	@echo "✅ Installation complete!"

# Start development server
serve:
	@echo "🚀 Starting Jekyll development server..."
	bundle exec jekyll serve --host 0.0.0.0

# Start server with live reload
dev:
	@echo "🚀 Starting Jekyll development server with live reload..."
	bundle exec jekyll serve --host 0.0.0.0 --livereload

# Build for production
build:
	@echo "🏗️  Building site for production..."
	JEKYLL_ENV=production bundle exec jekyll build
	@echo "✅ Build complete! Output in _site/"

# Clean generated files
clean:
	@echo "🧹 Cleaning generated files..."
	bundle exec jekyll clean
	rm -rf _site .jekyll-cache
	@echo "✅ Clean complete!"

# Start server in background and open browser
start:
	@echo "🚀 Starting server and opening browser..."
	@bundle exec jekyll serve --host 0.0.0.0 > /dev/null 2>&1 & \
	sleep 3 && \
	"$$BROWSER" http://localhost:4000 || echo "Server started at http://localhost:4000"

# Open site in browser
open:
	@"$$BROWSER" http://localhost:4000 || echo "Open http://localhost:4000 in your browser"

# Create a new blog post
new-post:
	@read -p "Post title: " title; \
	slug=$$(echo "$$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$$//'); \
	date=$$(date +%Y-%m-%d); \
	file="_posts/$$date-$$slug.md"; \
	echo "---" > $$file; \
	echo "layout: post" >> $$file; \
	echo "title: \"$$title\"" >> $$file; \
	echo "date: $$date" >> $$file; \
	echo "description: " >> $$file; \
	echo "image: assets/images/pic01.jpg" >> $$file; \
	echo "---" >> $$file; \
	echo "" >> $$file; \
	echo "Write your content here..." >> $$file; \
	echo "✅ Created: $$file"

# Create a new page
new-page:
	@read -p "Page filename (without .md): " filename; \
	file="$$filename.md"; \
	read -p "Page title: " title; \
	echo "---" > $$file; \
	echo "layout: page" >> $$file; \
	echo "title: \"$$title\"" >> $$file; \
	echo "description: " >> $$file; \
	echo "image: assets/images/pic01.jpg" >> $$file; \
	echo "nav-menu: true" >> $$file; \
	echo "---" >> $$file; \
	echo "" >> $$file; \
	echo "Write your content here..." >> $$file; \
	echo "✅ Created: $$file"

# Deploy reminder (GitHub Pages deploys automatically)
deploy:
	@echo "📤 To deploy to GitHub Pages:"
	@echo "   git add ."
	@echo "   git commit -m 'Update site'"
	@echo "   git push origin main"
	@echo ""
	@echo "GitHub Pages will automatically build and deploy your site."

# Show help
help:
	@echo "Available commands:"
	@echo ""
	@echo "  make install    - Install dependencies"
	@echo "  make serve      - Start development server"
	@echo "  make dev        - Start server with live reload"
	@echo "  make build      - Build site for production"
	@echo "  make clean      - Clean generated files"
	@echo "  make start      - Start server and open in browser"
	@echo "  make open       - Open site in browser"
	@echo "  make new-post   - Create a new blog post"
	@echo "  make new-page   - Create a new page"
	@echo "  make deploy     - Show deployment instructions"
	@echo "  make help       - Show this help message"
