---
author: Maksim Panin
pubDatetime: 2026-03-10 22:59:00
title: "Learning Rust by Building a Redis Alternative with AI"
slug: learning-rust-by-building-redis-alternative
featured: true
draft: false
tags:
  - rust
  - redis
  - ai
  - learning
  - open-source
ogImage: ""
description: "How I learned Rust by building rLightning - a Redis-compatible in-memory data store - evolving from Cursor to Claude Code, and now running it in 10 personal projects."
---

# Learning Rust by Building a Redis Alternative with AI

Six months ago I had never written a single line of Rust. Today I have a Redis-compatible in-memory data store called rLightning running in 10 of my personal projects, replacing Redis entirely. This is the story of how that happened.

## Why Redis? Why Rust?

I've been using Redis for some time - caching, sessions, pub/sub, job queues. So when I decided to learn Rust, building a Redis alternative seemed like a natural choice. I already understood the domain deeply, which meant I could focus on learning the language itself instead of figuring out what to build.

I didn't want to go through "The Rust Book" and write toy examples. I wanted to struggle with real problems - concurrency, memory management, protocol parsing, network I/O - and Rust's ownership model would force me to think about all of these from day one.

## The AI Tooling Evolution

Here's the part that might be controversial: I built most of this with AI assistance. But the tooling evolved significantly throughout the project, and so did my understanding of how to use it effectively.

**Phase 1: Agents and Early Experiments.** I started with AI agents - basically giving high-level instructions and watching code get generated. The results were messy. The agents didn't understand the full picture, and I didn't understand Rust well enough to fix what they produced. But it got me past the blank page problem.

**Phase 2: Vibe Coding with Cursor.** I moved to Cursor and started doing what people call "vibe coding" - writing alongside the AI, accepting suggestions, tweaking, learning from what it proposed. This was much better. I could see the Rust patterns forming, understand why the borrow checker was complaining, and gradually develop intuition for lifetimes and ownership. The early versions of rLightning - v1.0.1 through v1.0.6 - were built this way.

**Phase 3: Claude by Anthropic.** At some point I switched to using Claude directly. The conversations became more architectural - I'd describe what I wanted, discuss trade-offs, and then implement it myself with Claude helping me through the tricky parts. This is when I started actually understanding Rust rather than just writing it.

**Phase 4: Claude Code.** The final evolution was Claude Code - the CLI tool. This changed everything. I could work directly in my terminal, have Claude analyze my codebase, suggest changes across multiple files, and run tests. The v2.0.0 release with full Redis 7.x compatibility was built primarily with Claude Code. The code reviews, the architectural refactoring, the multi-language compatibility tests - all of this was done in a tight feedback loop between me and Claude Code.

Looking back, the progression from agents to Claude Code mirrors my own growth as a Rust developer. In the beginning, I needed the AI to write code for me. By the end, I needed it to think with me.

## The Journey: Growing with My Projects

rLightning didn't start as an ambitious "let's implement all 400 Redis commands" project. It grew organically, driven by what my actual projects needed.

It started as a basic key-value store - SET, GET, DEL, EXPIRE. That was enough for one of my projects that needed simple caching. Then another project needed hash maps, so I added HSET and HGET. A messaging project needed pub/sub, so I implemented SUBSCRIBE and PUBLISH - that became the v1.1.0 release.

When I wanted data to survive server restarts, I added RDB persistence. When I needed atomic operations for a rate limiter, I implemented transactions with MULTI/EXEC. Each feature was motivated by a real need, not a checklist.

Eventually I looked at what I had and realized it was becoming a serious Redis alternative. That's when I decided to fill in the gaps - streams, sorted sets, bitmaps, HyperLogLog, geospatial indexes, Lua scripting, ACL security, cluster mode, sentinel HA. The v2.0.0 release covers 400+ Redis commands and supports both RESP2 and RESP3 protocols.

But the core approach never changed: build what you need, learn as you go.

## Running in My Projects

Right now rLightning runs in 10 of my personal projects. Session storage for web apps, caching layers, pub/sub messaging, rate limiting - all the things I used to use Redis for.

The switch was seamless because rLightning speaks the same protocol. Any Redis client library - whether it's `redis-py`, `ioredis`, or `go-redis` - connects to rLightning without any code changes. I literally swapped the Docker image and everything kept working.

Is it as fast as Redis? For my workloads - absolutely. I'm seeing 200-250K ops/sec on GET/SET operations, which is more than enough. And having a single static binary instead of managing a Redis installation is a nice bonus.

## What's Next

I plan to keep developing rLightning. The next phase is serious testing - specifically performance benchmarking and resilience testing under real-world conditions.

Features like clustering, data persistence, replication, and Lua scripting are implemented, but they need thorough, systematic testing to be truly production-ready. Failover scenarios, data corruption edge cases, memory pressure behavior, network partition handling - these are the things that separate a working implementation from a reliable one.

I want to be honest about where the project is: it works great for my personal projects and low-to-medium traffic workloads. But I wouldn't recommend it for critical production systems yet - not until the resilience testing is done and the results are published.

## Open Source

I decided to open-source rLightning. The code is on [GitHub](https://github.com/nxrvl/rLightning) under the MIT license.

If you're interested in Rust, Redis internals, or just want to see what happens when someone learns a language by building something way too ambitious - take a look. Contributions are welcome.

Building rLightning was one of the most rewarding learning experiences I've had. I went from zero Rust knowledge to understanding DashMap internals, async I/O with Tokio, lock-free concurrency patterns, and protocol implementation. And I got a useful tool out of it.

Sometimes the best way to learn a language is to build something you'll actually use.
