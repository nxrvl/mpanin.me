---
title: rLightning
description: High-performance, Redis 7.x compatible in-memory data store built from scratch in Rust. Implements RESP2/RESP3 protocols, 400+ commands across all data types, with cluster mode, Sentinel HA, Lua scripting, ACL security, and full persistence.
websiteUrl: https://rlightning.mpanin.me
githubUrl: https://github.com/nxrvl/rLightning
featured: true
order: 0
tags: ["rust", "redis", "database", "in-memory", "distributed-systems"]
---

rLightning is a drop-in Redis 7.x replacement built entirely in Rust. Lock-free DashMap storage with Tokio async I/O delivers sub-millisecond latency. Supports all Redis data types: strings, hashes, lists, sets, sorted sets, streams, bitmaps, HyperLogLog, and geospatial indexes. Full transaction support (MULTI/EXEC/WATCH), Lua 5.1 scripting with Redis 7.0 Functions, and fine-grained ACL security. Cluster mode with CRC16 hash slot sharding, gossip protocol, and automatic failover. Sentinel HA with quorum-based detection. Pub/Sub including sharded channels. Persistence via RDB snapshots, AOF logging, or hybrid mode. Full/partial replication (PSYNC) with backlog. Multi-arch Docker images (amd64/arm64/armv7). Comprehensive test suite with multi-language compatibility tests (Go, Python, JavaScript) against real Redis 7.
