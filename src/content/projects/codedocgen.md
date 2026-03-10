---
title: codedocgen
description: Automatic code documentation generator using tree-sitter for language-agnostic AST parsing and LLMs for intelligent analysis. Supports Java, Python, Go, TypeScript, and 165+ languages with multi-provider LLM support (Ollama, OpenRouter, OpenAI).
githubUrl: https://github.com/nxrvl/codedocgen
featured: true
order: 3
tags: ["python", "llm", "documentation", "tree-sitter", "code-analysis"]
---

Codedocgen generates comprehensive project documentation by combining deterministic code analysis with LLM-powered insights. Uses tree-sitter for AST parsing across 165+ languages and SQLite for fact storage. Automatically extracts environment variables, DB schemas, Kafka topics, REST APIs, dependencies, and project structure. LLM-assisted algorithm descriptions, C4 architecture diagrams, and class relationships. Supports Ollama for local inference or any OpenAI-compatible API. Includes i18n (Russian/English), Jinja2 templates, incremental updates via git diff, and MkDocs Material output. 1127 tests, 87% coverage.
