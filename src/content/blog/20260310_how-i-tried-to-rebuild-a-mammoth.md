---
author: Maksim Panin
pubDatetime: 2026-03-20 13:23:00
title: "How I Tried to Rebuild a Mammoth"
slug: how-i-tried-to-rebuild-a-mammoth
featured: false
draft: true
tags:
  - architecture
  - engineering
  - government
  - leadership
ogImage: ""
description: "A story about joining a massive government system, discovering its feudal architecture, proposing a redesign, and watching the ideas spread on their own."
---

# How I Tried to Rebuild a Mammoth

A few years ago I joined a project that was already enormous. Not chaotic, not broken - at first glance it actually looked impressive. Dozens of subsystems, hundreds of services, and a large development organization behind them. The system had been evolving for almost ten years, with new functionality appearing every year.

But after spending a few weeks inside it, I started noticing something strange. Everything worked on its own, yet nothing truly worked together.

## The system that grew in a vacuum

The system had been designed almost in isolation. Many of its parts were built as if they were prototypes - at the time, nobody expected the platform to operate at national scale. Architecture decisions were made assuming a few thousand users, moderate traffic, and limited datasets.

Reality, of course, had other plans.

At some point the system suddenly had to deal with tens of millions of records and users, and this happened right when the world was going through COVID. New requirements appeared almost overnight: tracking infections, vaccination records, medical documents, analytics, large-scale integrations with external systems. The original architecture simply wasn't designed for that level of load.

But the bigger problem wasn't scale. The bigger problem was structure.

## A collection of feudal kingdoms

The best metaphor I found for the architecture is this: it wasn't a platform. It was a collection of feudal kingdoms.

Each team owned its own service. Each service had its own data structures, its own logic, its own APIs, and its own assumptions about how the world worked. Very little was shared between them. The same problems were solved multiple times across the system, with similar pieces of functionality living in different places under slightly different implementations.

Over time this created a massive operational burden. Adding a single new feature could mean touching five or ten different services, sometimes more. Documentation was almost nonexistent - knowledge lived inside people's heads, and as the organization grew, access to those people became a bottleneck.

## When you realize cosmetic fixes won't work

During my first weeks I was mostly learning the domain. Before this project I had worked on systems in a completely different sector, so suddenly I had to understand healthcare workflows, data models, regulations, and integration patterns. There was a lot to absorb.

But once I started mapping the data flows and connecting different subsystems together in my head, one thing became painfully obvious: this wasn't something that could be fixed with a few improvements here and there. The architecture itself needed a fundamental rethink - not a full rewrite, because that almost never works, but a structural redesign.

## The first architecture sketch

Interestingly, the first version of the solution was actually quite simple. When you stare at a large system long enough, patterns start to emerge. I noticed that many services were doing almost identical work, just in slightly different ways. So the idea was to extract common platform capabilities and centralize them.

The core pieces I proposed included a shared domain model, a master data layer, a centralized reference and regulatory data service, a data integration layer for both internal and external systems, a dedicated layer for medical data storage, and a separate layer for analytics and data processing.

The goal wasn't just technical cleanliness. It was about clearly separating responsibilities - services should exist because of their role in the system, not because some team once needed a place to put their code.

## Why the hardest problems are never technical

Technically, the redesign wasn't the most difficult system I've ever seen. Large and complex, absolutely - but there was nothing fundamentally unsolvable in it.

The real challenge was something else entirely: politics.

Large government systems have many actors - contractors, internal teams, legacy decisions, existing budgets, existing ownership structures. Architectural change threatens all of them. When you introduce a new direction, people naturally start asking uncomfortable questions. Who controls the new platform components? What happens to the existing services? Who owns the data now?

Resistance appeared almost immediately, though not openly. More often it came disguised as endless discussions about why the current system was "good enough" and why we should focus on incremental improvements instead.

## Two different philosophies

Over time I realized there were two fundamentally different philosophies at play. The historical approach to the system could be summarized as: build something good enough to work today, and we'll rebuild it later if needed. This approach is actually quite common in government projects, and not without reason - if you build something perfectly from the start, you might never receive funding for future improvements.

My philosophy is almost the opposite. If you design the architecture with extensibility in mind from the beginning, you can evolve the system much faster down the road. A well-thought-out architecture doesn't slow development down - it multiplies it.

## When architecture starts living on its own

Something interesting happened later. Our architectural documents were never formally adopted as the official direction of the system. But over time, developers started using them anyway.

The reason was simple: before our work, there had never been a clear architectural description of the system. The original architect kept most of the design in his head, and as the team grew, people needed something tangible to rely on when making decisions. Our documents didn't dictate exact implementations - they provided direction. And that turned out to be enough. Gradually these ideas started appearing in new system designs, sometimes almost word for word.

## The moment I saw my own diagrams again

One day another team presented a new architectural proposal. The diagrams looked different, the colors were different, but the structure was immediately familiar. It was essentially the same architecture we had proposed earlier, just drawn in another style.

I smiled. There was a little bit of irony in the situation, sure. But mostly it was satisfying - not because it felt like a victory, but because it confirmed something important. The ideas were strong enough to survive and spread without formal approval.

## What I learned from rebuilding a mammoth

Working on large government systems taught me something that many engineers underestimate: architecture is not just about systems. It's about systems of people.

Formal authority matters far less than most people think. If an architectural idea truly solves real problems, it will eventually spread through the organization - maybe slowly, maybe quietly, but it will spread.

Sometimes the most effective way to change a large system is not to force the change. Sometimes it's simply to plant the idea and wait.
