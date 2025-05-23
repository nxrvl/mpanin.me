# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a personal blog/website built with AstroPaper v4.2.0 theme. It's an Astro-based static site with TypeScript, React components, and TailwindCSS styling.

## Essential Commands

### Development
```bash
npm run dev      # Start dev server at localhost:4321
npm run build    # Build for production (includes type checking and optimization)
npm run preview  # Preview production build
```

### Code Quality
```bash
npm run lint     # Run ESLint
npm run format   # Format with Prettier
npm run cz       # Commit with conventional commits (commitizen)
```

## Architecture Overview

### Content Structure
- Blog posts are in `/src/content/blog/` as Markdown files with frontmatter
- Pages are in `/src/pages/` using Astro's file-based routing
- Components are split between:
  - `.astro` components for static/layout elements
  - `.tsx` components for interactive elements (Search, Card, Datetime)

### Key Configuration Files
- `src/config.ts` - Site metadata, social links, post settings
- `astro.config.ts` - Astro framework configuration
- `tailwind.config.cjs` - TailwindCSS theming

### Styling Approach
- TailwindCSS for utility classes
- Custom base styles in `src/styles/base.css`
- Light/dark mode support built-in

### Special Features
- Fuzzy search with FuseJS
- Dynamic OG image generation (`src/utils/generateOgImages.tsx`)
- SEO optimization with sitemap and meta tags
- Docker deployment support

## Working with Content
- Blog posts require frontmatter: title, pubDatetime, tags
- Optional: description, draft, featured
- Images go in `public/images/`
- Use slugified filenames for posts